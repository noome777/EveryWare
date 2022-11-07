package com.kh.app00.organization.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.service.OrganizationService;
import com.kh.app00.organization.vo.DeptVo;
import com.kh.app00.organization.vo.JobVo;
import com.kh.app00.organization.vo.RankVo;
import com.google.gson.Gson;
import com.kh.app00.common.FileUploader;
import com.kh.app00.common.PageVo;
import com.kh.app00.common.Pagination;
import com.kh.app00.common.SpaceRemover;

@Controller
@RequestMapping("organization" )
public class OrganizationController {
	
	private final OrganizationService organizationService;
	
	@Autowired
	public OrganizationController(OrganizationService organizationService) {
		this.organizationService = organizationService;
	}

	//임직원 정보 
	@GetMapping("info")
	public String getEmpList(Model model, HttpSession session) {
		
		List<DeptVo> deptList = organizationService.selectDeptList();
		List<EmpVo> empList = organizationService.selectEmpList();
		/*
		 * HashMap 통해서 key : level, value : DeptVo를 담은 list 전달 (level별로 묶음)
		 */
		
		HashMap<String, ArrayList<DeptVo>> deptMap = new HashMap<String, ArrayList<DeptVo>>();
		
		for(DeptVo vo : deptList) {
			String depth = vo.getDeptDepth();
			ArrayList<DeptVo> list = deptMap.getOrDefault(depth, new ArrayList<DeptVo>());
			list.add(vo);
			deptMap.put(depth, list);
		}
		//
		
		if(empList!=null && deptList!=null) {
			model.addAttribute("empList",empList);
			model.addAttribute("deptMap",deptMap);
			model.addAttribute("deptList",deptList);
			return "organization/info";
		} else {
			session.setAttribute("errorMsg", "임직원 정보 불러오기에 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	//임직원 정보 검색
	@PostMapping("info")
	public String searchEmp(String word,HttpSession session, Model model) {
		
		if(word!=null) {
			List<EmpVo> empList = organizationService.selectEmpListByWord(word);
			if(empList!=null) {
				model.addAttribute("empList", empList);
				return "organization/empSearchList";
			} else {
				session.setAttribute("alertMsg", "임직원의 정보를 불러올 수 없습니다.  검색하시려는 임직원의 성함을 올바르게 적어주시길 바랍니다.");
				return "redirect:/";
			}
		} else {
			return "redirect:/";
		}
	}
	
	@GetMapping("chart")
	public String openChart(HttpSession session,Model model) {
		
		List<DeptVo> deptList = organizationService.selectDeptList();
		
		/*
		 * HashMap 통해서 key : level, value : DeptVo를 담은 list 전달 (level별로 묶음)
		 */
		
		HashMap<String, ArrayList<DeptVo>> deptMap = new HashMap<String, ArrayList<DeptVo>>();
		
		for(DeptVo vo : deptList) {
			String depth = vo.getDeptDepth();
			ArrayList<DeptVo> list = deptMap.getOrDefault(depth, new ArrayList<DeptVo>());
			list.add(vo);
			deptMap.put(depth, list);
		}
		
		if(deptList!=null) {
			model.addAttribute("deptMap",deptMap);
			model.addAttribute("deptList",deptList);
			return "organization/chart";
		} else {
			session.setAttribute("errorMsg", "부서정보 불러오기에 실패하였습니다.");
			return "redirect:/";
		}
		
		
	}
	
	// 임직원 관리 리스트
	@GetMapping("management/emp/{pno}")
	public String manageEmp(Model model, @PathVariable int pno) {
		
		int totalCount = organizationService.selectTotalCnt();
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<EmpVo> empList = organizationService.selectEmpListByPage(pv);
		List<DeptVo> deptList = organizationService.selectDeptList();
		List<RankVo> rankList = organizationService.selectRankList();
		List<JobVo> jobList = organizationService.selectJobList();
		
		model.addAttribute("empList",empList);
		model.addAttribute("deptList",deptList);
		model.addAttribute("rankList",rankList);
		model.addAttribute("jobList",jobList);
		model.addAttribute("pv", pv);
		
		return "organization/empManager";
	}
	
	//임직원 관리 -> 임직원 추가
	@PostMapping("management/emp/add")
	public String addEmp (EmpVo empVo, HttpSession session) {
		
		int dupCheckCnt = organizationService.checkIdDup(empVo.getEmpId());
		
		if(dupCheckCnt==1) {
			session.setAttribute("errorMsg", "사용자 추가 성공하였습니다.");
			System.out.println("사용자 추가 실패 :: 아이디 중복");
			return "redirect:/organization/management/emp/1";
		}
		
		int result = organizationService.insertEmp(empVo);
		
		if(result==1) {
			session.setAttribute("alertMsg", "사용자 추가 성공하였습니다.");
			System.out.println("사용자 추가 성공");
			return "redirect:/organization/management/emp/1";
		} else {
			session.setAttribute("errorMsg", "사용자 추가 성공하였습니다.");
			System.out.println("사용자 추가 실패");
			return "redirect:/organization/management/emp/1";
		}
		
	}
	
	//임직원 관리 -> 임직원 검색
	
	@PostMapping("management/emp/1")
	public String searchEmpForManagement (String empData, HttpSession session, Model model) {
		
		if(empData!=null) {
			
			List<EmpVo> empList = organizationService.selectEmpListByEmpData(empData);
			
			if(empList!=null) {
				
				
				List<DeptVo> deptList = organizationService.selectDeptList();
				List<RankVo> rankList = organizationService.selectRankList();
				List<JobVo> jobList = organizationService.selectJobList();
				
				model.addAttribute("empList",empList);
				model.addAttribute("deptList",deptList);
				model.addAttribute("rankList",rankList);
				model.addAttribute("jobList",jobList);
				
				return "organization/empListForManagement";
				
			} else {
				session.setAttribute("errorMsg", "임직원의 정보를 불러올 수 없습니다.  검색하시려는 임직원의 성함을 올바르게 적어주시길 바랍니다.");
				return "redirect:/";
			}
		} else {
			session.setAttribute("errorMsg", "임직원의 정보를 불러올 수 없습니다.  검색하시려는 임직원의 성함을 올바르게 적어주시길 바랍니다.");
			return "redirect:/";
		}
	}
	
	//임직원 관리 - 체크 후 ajax로 직위변경
	@PostMapping("management/emp/update/checkedRank")
	@ResponseBody
	public String updateCheckedRank(@RequestParam("checkBoxArr") String[] checkBoxArr, @RequestParam("rankCode") String rankCode, Model model) {
		
		List<String> empCodeList = new ArrayList<String>();
		
		for (String empCode : checkBoxArr) {
			empCodeList.add(empCode);
		}
		
		List<String > rankCodeList = new ArrayList<String>();
		rankCodeList.add(rankCode);
		Map<String, List<String>> updateTarget = new HashMap<String,List<String>>();
		updateTarget.put("empCodeList", empCodeList);
		updateTarget.put("rankCodeList", rankCodeList);
		
		
		int result = organizationService.updateCheckedRank(updateTarget);
		
		if(result==0) {
			return "0";
		}else {
			String updatedEmpCode = empCodeList.get(0);
			EmpVo updatedRank = organizationService.selectUpdatedRank(updatedEmpCode);
			
			List<String> resultList = new ArrayList<String>();
			resultList.add(updatedRank.getRankName());
			resultList.add(updatedRank.getEmpPromotionDate());
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(resultList);
			
			System.out.println(jsonStr);
			
			return jsonStr;
		}
	}
	
	//임직원 관리 - 체크 후 ajax로 직무변경
	@PostMapping("management/emp/update/checkedJob")
	@ResponseBody
	public String changeJob(@RequestParam("checkBoxArr") String[] checkBoxArr, @RequestParam("jobCode") String jobCode, Model model) {
		
		List<String> empCodeList = new ArrayList<String>();
		
		for (String empCode : checkBoxArr) {
			empCodeList.add(empCode);
		}
		
		List<String > jobCodeList = new ArrayList<String>();
		jobCodeList.add(jobCode);
		Map<String, List<String>> updateTarget = new HashMap<String,List<String>>();
		updateTarget.put("empCodeList", empCodeList);
		updateTarget.put("jobCodeList", jobCodeList);
		
		int result = organizationService.updateCheckedJob(updateTarget);
		
		System.out.println(result);
		if(result==0) {
			return "0";
		}else {
			String updatedEmpCode = empCodeList.get(0);
			String updatedJob = organizationService.selectUpdatedJob(updatedEmpCode);
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(updatedJob);
			
			System.out.println(jsonStr);
			
			return jsonStr;
		}
	}
	
	//임직원 관리 - 체크 후 ajax로 부서변경
	@PostMapping("management/emp/update/checkedDept")
	@ResponseBody
	public String changeDept(@RequestParam("checkBoxArr") String[] checkBoxArr, @RequestParam("deptCode") String deptCode, Model model) {
		List<String> empCodeList = new ArrayList<String>();
		
		for (String empCode : checkBoxArr) {
			empCodeList.add(empCode);
		}
		
		List<String > deptCodeList = new ArrayList<String>();
	    deptCodeList.add(deptCode);
	    
	    System.out.println("deptCode" +deptCode);
	    
		Map<String, List<String>> updateTarget = new HashMap<String,List<String>>();
		updateTarget.put("empCodeList", empCodeList);
		updateTarget.put("deptCodeList", deptCodeList);
		
		int result = organizationService.updateCheckedDept(updateTarget);
		
		System.out.println(result);
		if(result==0) {
			return "0";
		}else {
			String updatedEmpCode = empCodeList.get(0);
			String updatedDept = organizationService.selectUpdatedDept(updatedEmpCode);
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(updatedDept);
			
			return jsonStr;
		}
	}	
	
	//임직원 관리 - 체크 후 ajax로 상태변경
	@PostMapping("management/emp/update/checkedStatus")
	@ResponseBody
	public String changeStatus(@RequestParam("checkBoxArr") String[] checkBoxArr, @RequestParam("status") String status, Model model) {
		List<String> empCodeList = new ArrayList<String>();
		
		for (String empCode : checkBoxArr) {
			empCodeList.add(empCode);
		}
		
		List<String > statusList = new ArrayList<String>();
	    statusList.add(status);
	    
		Map<String, List<String>> updateTarget = new HashMap<String,List<String>>();
		updateTarget.put("empCodeList", empCodeList);
		updateTarget.put("statusList", statusList);
		
		
		int result = organizationService.updateCheckedStatus(updateTarget);
		
		System.out.println(result);
		if(result==0) {
			return "0";
		}else {
			String updatedEmpCode = empCodeList.get(0);
			String updatedStatus = organizationService.selectUpdatedStatus(updatedEmpCode);
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(updatedStatus);
			
			System.out.println(jsonStr);
			
			return jsonStr;
		}
	}
	
	//임직원 관리 - 체크 후 ajax로 프로필 사진 변경
	@PostMapping("management/emp/update/checkedProfile")
	@ResponseBody
	public String changeProfile(@RequestParam("checkBoxArr") String[] checkBoxArr,@RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest req, Model model) {
	
		String savePath = req.getServletContext().getRealPath("/resources/upload/profile/");
		String changeName = FileUploader.fileUpload(uploadFile, savePath);
		
		List<String> empCodeList = new ArrayList<String>();
		
		for (String empCode : checkBoxArr) {
			empCodeList.add(empCode);
		}
		
		List<String > fileList = new ArrayList<String>();
	    fileList.add(changeName);
	    
	    Map<String, List<String>> updateTarget = new HashMap<String,List<String>>();
	    updateTarget.put("fileList", fileList);
	    updateTarget.put("empCodeList", empCodeList);
		
		int result = organizationService.updateCheckedFileName(updateTarget);
		
		System.out.println("result :" + result);
		if(result==0) {
			return "0";
		}else {
			String updatedEmpCode = empCodeList.get(0);
			String updatedStatus = organizationService.selectUpdatedFileName(updatedEmpCode);
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(updatedStatus);
			
			System.out.println("json :" + jsonStr);
			
			return jsonStr;
		}
		
	}
	
	//임직원 관리 - 임직원 수정
	@PostMapping("management/emp/update/one")
	public String updateEmp(Model model, HttpSession session, EmpVo empVo) {
		
		int result = organizationService.updateEmp(empVo);
		
		if(result==1) {
			session.setAttribute("alertMsg", "임직원 수정에 성공하였습니다.");
		}else if(result==-1){
			session.setAttribute("alertMsg", "임직원 수정에 실패하였습니다.");
		} else if(result==-2) {
			session.setAttribute("errorMsg","임직원 수정에 실패하였습니다. 사내전화는 숫자로 11글자를 맞춰서 기입해주세요.");
		} else if(result==-3) {
			session.setAttribute("errorMsg","임직원 수정에 실패하였습니다. 개인전화는 숫자로 11글자를 맞춰서 기입해주세요.");
		} else if(result==-4) {
			session.setAttribute("errorMsg", "임직원 수정에 실패하였습니다. 이메일은 30글자 이하로 기입해주시길 바랍니다.");
		} else if(result==-5) {
			session.setAttribute("errorMsg", "임직원 수정에 실패하였습니다. 주소에는 각각 50글자 이하로 작성해주시길 바랍니다.");
		} else if(result==-6) {
			session.setAttribute("errorMsg", "임직원 수정에 실패하였습니다. 주소에는 각각 50글자 이하로 작성해주시길 바랍니다.");
		} else {
			session.setAttribute("errorMsg", "ErrorCode : " + result);
		}
		
		return "redirect:/organization/management/emp/1";
	}
	
	
	//권한 관리 페이지
	@GetMapping("management/right")
		public String manageRight(Model model,HttpSession session){
		
		List<EmpVo> adminList = organizationService.selectAdminList();
		
		if(adminList != null) {
			model.addAttribute("adminList",adminList);
			return "organization/rightManager";
		} else {
			session.setAttribute("errorMsg","권한 관리를 위한 임직원 목록을 조회하는데 실패하였습니다.");
			return "redirect:/";
		}
		
	}
	
	//관리자 삭제
	@PostMapping("management/right/delete")
	@ResponseBody
	public String deleteAdmin(@RequestParam("value") String adminCode) {
		
		System.out.println(adminCode);
		int result = organizationService.updateAdmin(adminCode);
		
		System.out.println(result);
		if(result != 1) {
			String fail = "관리자 삭제에 실패하였습니다. 다시 한 번 시도해보시길 바랍니다.";
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(fail);
			
			System.out.println("json :" + jsonStr);
			
			return jsonStr;
		} else {
			
			String success = "관리자 삭제에 성공하였습니다.";
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(success);
			
			System.out.println("json :" + jsonStr);
			
			return jsonStr;
		}
	}
	
	//관리자 추가 > 임직원 검색
	@PostMapping("management/right/select")
	@ResponseBody
	public String insertAdmin(@RequestParam("word") String word) {
		
		List<EmpVo> empList = organizationService.selectEmpListForAdmin(word);
		
		if(empList.size() == 0) {
			String fail = "null";
			Gson gson = new Gson();
			String jsonStr = gson.toJson(fail);
			
			return jsonStr;
		} else {
			Gson gson = new Gson();
			String jsonStr = gson.toJson(empList);
			
			return jsonStr;
		}
	}
	
	//관리자 추가
	@PostMapping("management/right/add")
	@ResponseBody
	public String addAdmin(@RequestParam("checkBoxArr") String[] checkBoxArr, @RequestParam("rightValue") String rightCode) {
		
		
		List<String> empCodeList = new ArrayList<String>();
		for (String empCode : checkBoxArr) {
			empCodeList.add(empCode);
		}
		List<String > rightCodeList = new ArrayList<String>();
		rightCodeList.add(rightCode);
		
		Map<String, List<String>> updateTarget = new HashMap<String,List<String>>();
		updateTarget.put("empCodeList", empCodeList);
		updateTarget.put("rightCodeList", rightCodeList);
		
		
		int result = organizationService.updateEmpToAdmin(updateTarget);
		
		
		if (result != -1) {
			String fail = "ERROR : 관리자 추가에 실패하였습니다.";
			Gson gson = new Gson();
			String jsonStr = gson.toJson(fail);
			System.out.println(jsonStr);
			return jsonStr;
		}
		String success = "관리자 추가에 성공하였습니다.";
		Gson gson = new Gson();
		String jsonStr = gson.toJson(success);
		
		System.out.println(jsonStr);
		
		return jsonStr;
	}
	
	// 직위/직무설정
	
	@GetMapping("management/position")
	public String managePosition(Model model, HttpSession session) {
		
		List<RankVo> rankList = organizationService.selectRankListForManagement();
		List<RankVo> rankLevelList = organizationService.selectRankList();
		List<JobVo> jobList = organizationService.selectJobList();
		
		HashMap<String, ArrayList<RankVo>> rankMap = new HashMap<String, ArrayList<RankVo>>();
		
		for(RankVo rankVo : rankLevelList) {
			String level = rankVo.getRankLevel();
			ArrayList<RankVo> list = rankMap.getOrDefault( level, new ArrayList<RankVo>());
			list.add(rankVo);
			rankMap.put(level, list);
		}
		
		
		
		if(rankList != null && jobList != null) {
			
			model.addAttribute("rankMap", rankMap);
			model.addAttribute("rankList", rankList);
			model.addAttribute("jobList",jobList);
			return "organization/positionManager";
		} else {
			session.setAttribute("errorMsg", "페이지 로딩을 위한 정보를 불러오는데 실패하였습니다.");
			return "redirect:/";
		}
		
	}
	
	// 직위추가
	@PostMapping("management/rank/add")
	public String addRank(RankVo rankVo, HttpServletRequest session) {
		
		int result = organizationService.insertRank(rankVo);
		
		if(result==1 ) {
			session.setAttribute("alertMsg","직위 추가에 성공하였습니다.");
			return "redirect:/organization/management/position";
		} else if (result==-5) {
			session.setAttribute("errorMsg", "직위명은 10글자내로 작성해주시길 바랍니다.");
			return "redirect:/organization/management/position";
		} else if(result==-10) {
			session.setAttribute("errorMsg", "직위명은 한글로 작성해주시길 바랍니다.");
			return "redirect:/organization/management/position";
		}
			session.setAttribute("errorMsg","직위 추가에 실패하였습니다.");
			return "redirect:/organization/management/position";
		}
		
	
	//직위수정
	@PostMapping("management/rank/edit")
	@ResponseBody
	public String editRank(@RequestParam("checkBoxArr") String[] checkBoxArr, @RequestParam("editRankArr") String[] editRankArr) {
		
		List<String> rankCodeList = new ArrayList<String>();
		for (String rankCode : checkBoxArr) {
			rankCodeList.add(rankCode);
		}
		List<String> editRankList = new ArrayList<String>();
		for (String editRankName : editRankArr) {
			editRankList.add(editRankName);
		}
		
		Map<String, List<String>> updateTarget = new HashMap<String,List<String>>();
		updateTarget.put("rankCodeList",rankCodeList);
		updateTarget.put("editRankList", editRankList);
		
		int result = organizationService.updateRankName(updateTarget);
		
		if(result!=-1) {
			Gson gson = new Gson();
			String errorMsg = gson.toJson("직위 업데이트에 실패하였습니다.");
			return errorMsg;
		} else {
			Gson gson = new Gson();
			String jsonStr = gson.toJson("직위 업데이트에 성공하였습니다!");
			return jsonStr;
		}
		
	}
	
	//직위삭제
	@PostMapping("management/rank/delete")
	@ResponseBody
	public String deleteRank(@RequestParam("checkBoxArr") String[] checkBoxArr) {
		
		List<String> rankCodeList = new ArrayList<String>();
		for (String rankCode : checkBoxArr) {
			rankCodeList.add(rankCode);
		}
		
		int result = organizationService.updateRankToDelete(rankCodeList);
		
		if(result!=-1) {
			Gson gson = new Gson();
			String errorMsg = gson.toJson("직위 삭제에 실패하였습니다.");
			return errorMsg;
		} else {
			Gson gson = new Gson();
			String jsonStr = gson.toJson("직위 삭제에 성공하였습니다!");
			return jsonStr;
		}
	}
	
	//직무추가
	@PostMapping("management/job/add")
	@ResponseBody
	public String addJob(@RequestParam("jobName") String jobName) {
		
		int result = organizationService.insertJob(jobName);
		
		Gson gson = new Gson();
		String msg = "";
		
		if(result==1 ) {
			msg =  "직무 추가에 성공하였습니다.";
		} else if (result==-5) {
			msg =  "직무명은 10글자내로 작성해주시길 바랍니다.";
		} else if(result==-10) {
			msg =  "직무명은 한글로 적어주시길 바랍니다.";
		} else {
			msg = "직무 추가에 실패하였습니다. 다시 한 번 시도해보시길 바랍니다.";
		}
		String jsonStr = gson.toJson(msg);
		
		System.out.println(jsonStr);
		
		return jsonStr;
	}
	
	//직무수정
	@PostMapping("management/job/edit")
	@ResponseBody
	public String editJob(@RequestParam("jobName") String jobName, @RequestParam("previousName") String previousName) {
		
		int result = organizationService.updateJob(jobName, previousName);
		
		Gson gson = new Gson();
		String msg = "";
		
		if(result==1 ) {
			msg =  "직무 수정에 성공하였습니다.";
		} else if (result==-5) {
			msg =  "직무명은 10글자내로 작성해주시길 바랍니다.";
		} else if(result==-10) {
			msg =  "직무명은 한글로 적어주시길 바랍니다.";
		} else {
			msg = "직무 수정에 실패하였습니다. 다시 한 번 시도해보시길 바랍니다.";
		}
		String jsonStr = gson.toJson(msg);
		
		System.out.println(jsonStr);
		
		return jsonStr;
		
	}
	
	//직무삭제
	@PostMapping("management/job/delete")
	@ResponseBody
	public String deleteJob(@RequestParam("jobName") String jobName) {
		
		int result = organizationService.updateJobToD(jobName);
		
		Gson gson = new Gson();
		String msg = "";
		if(result ==1) {
			msg = "직무 삭제에 성공하였습니다.";
		} else {
			msg = "직무 삭제에 실패하였습니다. 다시 한 번 시도해보시길 바랍니다.";
		}
		
		String jsonStr = gson.toJson(msg);
		
		return jsonStr;
		
	}
	
	
	//부서관리
	@GetMapping("management/dept")
	public String manageDept() {
		
		return "organization/deptManager";
		
	}
	
	@PostMapping("management/getDept") 
	@ResponseBody
	public String getDept() {
		List<DeptVo> deptList = organizationService.selectDeptListForChart();
		
		Gson gson =  new Gson();
		
		if(deptList!=null) {
			String jsonStr = gson.toJson(deptList);
			System.out.println("성공!" + jsonStr);
			return jsonStr;
			
		} else {
			String errorMsg = "부서정보 불러오기에 실패하였습니다.";
			System.out.println(errorMsg);
			String jsonStr = gson.toJson(errorMsg);
			return jsonStr;
		}
	}
	
	
}
