package com.kh.app00.organization.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.service.OrganizationService;
import com.kh.app00.organization.vo.DeptVo;
import com.kh.app00.organization.vo.JobVo;
import com.kh.app00.organization.vo.RankVo;
import com.kh.app00.common.PageVo;
import com.kh.app00.common.Pagination;
import com.kh.app00.common.SpaceRemover;

@Controller
@RequestMapping("organization")
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
		
		System.out.println(result);
		if(result==0) {
			return "실패!";
		}else {
			List<EmpVo> empList = organizationService.selectRankOnly(empCodeList);
			System.out.println(empList);
			return "성공";
		}
	}
	
	//임직원 관리 - 체크 후 ajax로 직무변경
	@PostMapping("management/emp/update/checkedJob")
	public String changeJob() {
		return null;
	}
	
	//임직원 관리 - 체크 후 ajax로 부서변경
	@PostMapping("management/emp/update/checkedDept")
	public String changeDept() {
		return null;
	}	
	
	//임직원 관리 - 체크 후 ajax로 상태변경
	@PostMapping("management/emp/update/checkedStatus")
	public String changeStatus() {
		return null;
	}
	
	//임직원 관리 - 체크 후 ajax로 프로필 사진 변경
	@PostMapping("management/emp/update/checkedProfile")
	public String changeProfile() {
		return null;
	}
	
		
	
	// 직위/직무설정
	
	@GetMapping("management/position")
	public String managePosition() {
		return "organization/positionManager";
	}
	
	//권한 관리 페이지
	@GetMapping("management/right/{pno}")
		public String manageRight(Model model, @PathVariable int pno){
		
		return "organization/rightManager";
	}
	
	//조직도
	@GetMapping("management/chart")
	public String manageChart() {
		return "organization/chartManager";
	}
}
