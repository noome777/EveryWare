package com.kh.app00.approval.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.app00.approval.doc.vo.DocDataVo;
import com.kh.app00.approval.doc.vo.DocFormDetailTemplateVo;
import com.kh.app00.approval.doc.vo.DocFormMapperVo;
import com.kh.app00.approval.doc.vo.DocFormVo;
import com.kh.app00.approval.doc.vo.DocPeriodVo;
import com.kh.app00.approval.service.ApprovalService;
import com.kh.app00.approval.vo.ApprovalDocVo;
import com.kh.app00.approval.vo.ApprovalFileVo;
import com.kh.app00.approval.vo.ApprovalListVo;
import com.kh.app00.approval.vo.ApprovalRefVo;
import com.kh.app00.approval.vo.ApprovalTypeVo;
import com.kh.app00.common.PageVo;
import com.kh.app00.common.Pagination;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

@Controller
@RequestMapping("approval")
public class ApprovalController {
	
	private final ApprovalService service;
	
	@Autowired
	public ApprovalController(ApprovalService service) {
		this.service = service;
	}
	
	
	@GetMapping("progressAllList/{pno}")
	public String list(Model model, @PathVariable int pno) {
		
		int totalCount = service.selectTotalCnt();
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);
		
		//list 조회
		List<ApprovalDocVo> docList = service.selectDocList(pv);
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		model.addAttribute("pv", pv);
		return "approval/progressAllList";
	}
	
	//문서작성 화면
	@GetMapping("write/{formCode}")
	public String write(Model model, @PathVariable int formCode) {
		
		//문서
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		//보존연한 불러오기
		List<DocPeriodVo> periodList = service.selectPeriodList();
		//문서양식 불러오기
		List<DocFormMapperVo> formMappingList = service.formSelect(formCode);
		
		
		//결재라인
		//결재타입 불러오기
		List<ApprovalTypeVo> approvalTypeList = service.selectTypeList();
		//부서 불러오기
		List<DeptVo> deptList = service.selectDeptList();
		//임직원 불러오기
		List<EmpVo> empList = service.selectEmpList();
		
		
		DocFormMapperVo vo = new DocFormMapperVo();
		String formCode_ = String.valueOf(formCode);
		vo.setFormCode(formCode_);
		
		model.addAttribute("formList", formList);
		model.addAttribute("periodList", periodList);
		model.addAttribute("formMappingList", formMappingList);
		model.addAttribute("selectedFormCode", vo.getFormCode());
		model.addAttribute("approvalTypeList", approvalTypeList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		
		return "approval/write";
	}
	
	//결재라인 설정 - 부서별 임직원 조회
	@PostMapping("selectDept")
	@ResponseBody
	public String selectDept(@RequestParam int deptCode) {
		
		List<EmpVo> deptEmpList = service.selectDeptEmp(deptCode);
		String gson = new Gson().toJson(deptEmpList);
		
		return gson;
	}
	
	
	//결재문서 작성 - 첨부파일 수정 필요
	@PostMapping("write")
	@ResponseBody
	public String write(@RequestBody ApprovalDocVo docVo, HttpSession session) {
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
//		docVo.setEmpCode(loginMember.getEmpCode());
		
		
		
		int result = service.insertApprovalDoc(docVo);
		
		if(result == 1) {
			return "작성 성공";
		} else {
			return "작성 실패";
		}
	}
	
	
	
	//문서 상세 불러오기
	@GetMapping("approvalDocDetail/{docCode}")
	public String docDetail(@PathVariable String docCode, Model model) {
		
		ApprovalDocVo apprDocVo = service.selectDocDetail(docCode);
		List<DocDataVo> docDataVoList = service.selectDocDataList(docCode);
		List<ApprovalListVo> approverVoList = service.selectApproverList(docCode);
		List<ApprovalRefVo> approvalRefVoList = service.selectRefVoList(docCode);
//		List<ApprovalFileVo> approvalFileList = service.selectFileVoList(docCode);
		List<ApprovalListVo> apprTypeCountList = service.selectTypeCountList(docCode);
		
		model.addAttribute("apprDocVo", apprDocVo);
		model.addAttribute("docDataVoList", docDataVoList);
		model.addAttribute("approverVoList", approverVoList);
		model.addAttribute("approvalRefVoList", approvalRefVoList);
		model.addAttribute("apprTypeCountList", apprTypeCountList);
		
		return "approval/approvalDocDetail";
	}
	
	
	//진행 - 예정목록 
	@GetMapping("progressExpectedList/{pno}")
	public String progressExpectedList(Model model, HttpSession session, @PathVariable int pno) {
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		
		int totalCount = service.selectExpectCount();
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);
		List<ApprovalDocVo> docList = service.selectExpectDocList(pv);
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		model.addAttribute("pv", pv);
		
		return "approval/progressExpectedList";
	}
	
	//진행 - 확인 목록
	@GetMapping("progressRefList")
	public String progressRefList(Model model) {
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		
		List<ApprovalDocVo> docList = service.selectRefDocList();
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		
		return "approval/progressRefList";
	}
	
	
	@GetMapping("storage")
	public String storage() {
		return "approval/storage";
	}
	
	
	
	@GetMapping("approvalAdmin")
	public String admin() {
		return "approval/approvalAdmin";
	}
	
	
	@GetMapping("formManager")
	public String formManager() {
		return "approval/formManager";
	}
	
	@GetMapping("formManagerDetail")
	public String formManagerDetail() {
		return "approval/formManagerDetail";
	}
	
	@GetMapping("formEdit")
	public String formEdit() {
		return "approval/formEdit";
	}
	
	
	
	@GetMapping("formInsert")
	public String formInsert(Model model) {
		//양식상세 항목 보여주기
		List<DocFormDetailTemplateVo> formDetailList = service.selectFormDetailList();
		model.addAttribute("formDetailList", formDetailList);
		
		return "approval/formInsert";
	}
	
	@PostMapping("formInsert")
	@ResponseBody
	public String formInsert(@RequestBody DocFormVo formVo) {
		int formInsert = service.insertForm(formVo);
		
		if(formInsert == 1) {
			return "성공";
		} else {
			return "실패";
		}
		
	}
	
}
