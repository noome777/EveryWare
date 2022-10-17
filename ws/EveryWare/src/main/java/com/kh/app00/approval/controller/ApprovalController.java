package com.kh.app00.approval.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app00.approval.doc.vo.DocDataVo;
import com.kh.app00.approval.doc.vo.DocFormMapperVo;
import com.kh.app00.approval.doc.vo.DocFormVo;
import com.kh.app00.approval.doc.vo.DocPeriodVo;
import com.kh.app00.approval.doc.vo.DocSecurityVo;
import com.kh.app00.approval.service.ApprovalService;
import com.kh.app00.approval.vo.ApprovalDocVo;
import com.kh.app00.approval.vo.ApprovalTypeVo;

@Controller
@RequestMapping("approval")
public class ApprovalController {
	
	private final ApprovalService service;
	
	@Autowired
	public ApprovalController(ApprovalService service) {
		this.service = service;
	}
	
	@GetMapping("list")
	public String list() {
		return "approval/list";
	}
	
	//문서작성 화면
	@GetMapping("write/{formCode}")
	public String write(Model model, @PathVariable int formCode) {
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		//보존연한 불러오기
		List<DocPeriodVo> periodList = service.selectPeriodList();
		//보안등급 불러오기
		List<DocSecurityVo> securityList = service.selectSecurityList();
		//문서양식 불러오기
		List<DocFormMapperVo> formMappingList = service.formSelect(formCode);
		//결재타입 불러오기
		List<ApprovalTypeVo> approvalTypeList = service.selectTypeList();
		//임직원 
		
		
		DocFormMapperVo vo = new DocFormMapperVo();
		String formCode_ = String.valueOf(formCode);
		vo.setFormCode(formCode_);
		
		model.addAttribute("formList", formList);
		model.addAttribute("periodList", periodList);
		model.addAttribute("securityList", securityList);
		model.addAttribute("formMappingList", formMappingList);
		model.addAttribute("selectedFormCode", vo.getFormCode());
		model.addAttribute("approvalTypeList", approvalTypeList);
		
		return "approval/write";
	}
	
	@PostMapping("write")
	public String write(ApprovalDocVo docVo, DocDataVo dataVo) {
		
		
		return"";
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
	public String formInsert() {
		return "approval/formInsert";
	}
	
}
