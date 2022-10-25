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
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 10);
		
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
		
		return"작성 성공";
	}
	
	
	
	@GetMapping("approvalAdmin")
	public String admin() {
		return "approval/approvalAdmin";
	}
	
	@GetMapping("approvalDocDetail")
	public String docDetail() {
		return "approval/approvalDocDetail";
	}
	
	@GetMapping("storage")
	public String storage() {
		return "approval/storage";
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
		
		return "성공";
	}
	
}
