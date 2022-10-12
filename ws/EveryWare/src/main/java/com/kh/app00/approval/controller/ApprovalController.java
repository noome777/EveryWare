package com.kh.app00.approval.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app00.approval.service.ApprovalService;
import com.kh.app00.approval.vo.DocFormMapperVo;
import com.kh.app00.approval.vo.DocFormVo;
import com.kh.app00.approval.vo.DocPeriodVo;
import com.kh.app00.approval.vo.DocSecurityVo;

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
	@GetMapping("write")
	public String write(Model model) {
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		//보존연한 불러오기
		List<DocPeriodVo> periodList = service.selectPeriodList();
		//보안등급 불러오기
		List<DocSecurityVo> securityList = service.selectSecurityList();
		
		model.addAttribute("formList", formList);
		model.addAttribute("periodList", periodList);
		model.addAttribute("securityList", securityList);
		
		return "approval/write";
	}
	
	//양식코드 받아와서 항목 그리기
	@GetMapping("formSelect")
	@ResponseBody
	public String formSelect(String formCode) {
		System.out.println("ajax 요청");
		
		DocFormMapperVo vo = new DocFormMapperVo();
//		vo.getFormCode(formCode);
		List<DocFormMapperVo> formMappingList = service.formSelect(formCode);
		System.out.println(formMappingList);
		
		return "success";
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
