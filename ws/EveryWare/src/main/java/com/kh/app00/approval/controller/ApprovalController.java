package com.kh.app00.approval.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.app00.approval.doc.vo.DocCommentVo;
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
	public String write(Model model, @PathVariable int formCode, HttpSession session) {
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
		
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
		model.addAttribute("loginMember", loginMember);
		
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
		docVo.setEmpCode(loginMember.getEmpCode());
		
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
		DocCommentVo unApprComment = service.selectUnApprComment(docCode);
		
		model.addAttribute("apprDocVo", apprDocVo);
		model.addAttribute("docDataVoList", docDataVoList);
		model.addAttribute("approverVoList", approverVoList);
		model.addAttribute("approvalRefVoList", approvalRefVoList);
		model.addAttribute("apprTypeCountList", apprTypeCountList);
		model.addAttribute("unApprComment", unApprComment);
		
		return "approval/approvalDocDetail";
	}
	
	//문서 승인
	@PostMapping("approve")
	@ResponseBody
	public String approve(@RequestBody ApprovalListVo vo) {
		
		int result = service.updateApprove(vo);
		
		if(result == 1) {
			return "승인 완료";
		} else {
			return "승인 실패";
		}
	}
	
	//문서 반려
	@PostMapping("unApprove")
	@ResponseBody
	public String unApprove(@RequestBody ApprovalListVo apprVo) {
		
		int result = service.updateUnApprove(apprVo);
		
		return "반려 완료";
	}
	
	
	//진행 - 예정목록 
	@GetMapping("progressExpectedList/{pno}/{docFormCode}")
	public String progressExpectedList(Model model, HttpSession session, @PathVariable int pno, @PathVariable String docFormCode) {
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");

		ApprovalDocVo vo = new ApprovalDocVo();
		vo.setEmpCode(loginMember.getEmpCode());
		vo.setDocFormCode(docFormCode);
		
		int totalCount = service.selectExpectCount(vo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);

		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		List<ApprovalDocVo> docList = service.selectExpectDocList(vo, pv);
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		model.addAttribute("pv", pv);
		model.addAttribute("selectedFormCode", vo.getDocFormCode());
		
		return "approval/progressExpectedList";
	}
	
	//진행 - 확인 목록 
	@GetMapping("progressRefList/{pno}/{docFormCode}")
	public String progressRefList(Model model, HttpSession session, @PathVariable int pno, @PathVariable String docFormCode) {
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");

		ApprovalDocVo vo = new ApprovalDocVo();
		vo.setEmpCode(loginMember.getEmpCode());
		vo.setDocFormCode(docFormCode);
		
		int totalCount = service.selectRefListTotalCnt(vo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		List<ApprovalDocVo> docList = service.selectRefDocList(vo, pv);
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		model.addAttribute("pv", pv);
		model.addAttribute("selectedFormCode", vo.getDocFormCode());
		
		return "approval/progressRefList";
	}
	
	//진행 - 대기 목록 > 내가 결재할 차례인 문서
	@GetMapping("progressWaitList/{pno}/{docFormCode}")
	public String progressWaitList(Model model, HttpSession session, @PathVariable int pno, @PathVariable String docFormCode) {
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");

		ApprovalDocVo vo = new ApprovalDocVo();
		vo.setEmpCode(loginMember.getEmpCode());
		vo.setDocFormCode(docFormCode);
		
		int totalCount = service.selectWaitListTotalCnt(vo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		List<ApprovalDocVo> docList = service.selectWaitList(vo, pv);
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		model.addAttribute("pv", pv);
		model.addAttribute("selectedFormCode", vo.getDocFormCode());
		
		return"approval/progressWaitList";
	}
	
	//진행 - 진행 목록 > 내가 작성했고, 결재가 진행중인 문서
	@GetMapping("progressList/{pno}/{docFormCode}")
	public String progressList(Model model, HttpSession session, @PathVariable int pno, @PathVariable String docFormCode) {
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");

		ApprovalDocVo vo = new ApprovalDocVo();
		vo.setEmpCode(loginMember.getEmpCode());
		vo.setDocFormCode(docFormCode);
		
		int totalCount = service.selectProgressListTotalCnt(vo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		List<ApprovalDocVo> docList = service.selectProgressList(vo, pv);
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		model.addAttribute("pv", pv);
		model.addAttribute("selectedFormCode", vo.getDocFormCode());
		
		return "approval/progressList";
		
	}
	
	//뮨서함 - 전체
//	@GetMapping("completAllList/{pno}/{docFormCode}")
//	public String completAllList(Model model, HttpSession session, @PathVariable int pno, @PathVariable String docFormCode) {
//		
//		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
//
//		ApprovalDocVo vo = new ApprovalDocVo();
//		vo.setEmpCode(loginMember.getEmpCode());
//		vo.setDocFormCode(docFormCode);
//		
//		int totalCount = 100;
//		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);
//		
//		//문서종류 불러오기
//		List<DocFormVo> formList = service.selectFormList();
////		List<ApprovalDocVo> docList = dfd(empCode, pv);
//		
//		model.addAttribute("formList", formList);
////		model.addAttribute("docList", docList);
//		model.addAttribute("pv", pv);
//		
//		return "approval/completAllList";
//	}
	
	//문서함 - 기안
	@GetMapping("completWriteList/{pno}/{docFormCode}")
	public String completWriteList(Model model, HttpSession session, @PathVariable int pno, @PathVariable String docFormCode) {
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");

		ApprovalDocVo vo = new ApprovalDocVo();
		vo.setEmpCode(loginMember.getEmpCode());
		vo.setDocFormCode(docFormCode);
		
		int totalCount = service.selectCompletWriteTotalCnt(vo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		List<ApprovalDocVo> docList = service.selectCompletWriteDocList(vo, pv);
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		model.addAttribute("pv", pv);
		model.addAttribute("selectedFormCode", vo.getDocFormCode());
		
		return "approval/completWriteList";
	}
	
	//문서함 - 결재
	@GetMapping("completApprList/{pno}/{docFormCode}")
	public String completApprList(Model model, HttpSession session, @PathVariable int pno, @PathVariable String docFormCode) {
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");

		ApprovalDocVo vo = new ApprovalDocVo();
		vo.setEmpCode(loginMember.getEmpCode());
		vo.setDocFormCode(docFormCode);
		
		int totalCount = service.selectCompletApprTotalCnt(vo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		List<ApprovalDocVo> docList = service.selectCompletApprDocList(vo, pv);
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		model.addAttribute("pv", pv);
		model.addAttribute("selectedFormCode", vo.getDocFormCode());
		
		return "approval/completApprList";
	}
	
	//문서함 - 참조
	@GetMapping("completRefList/{pno}/{docFormCode}")
	public String completRefList(Model model, HttpSession session, @PathVariable int pno, @PathVariable String docFormCode) {
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");

		ApprovalDocVo vo = new ApprovalDocVo();
		vo.setEmpCode(loginMember.getEmpCode());
		vo.setDocFormCode(docFormCode);
		
		int totalCount = service.selectCompletRefTotalCnt(vo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		List<ApprovalDocVo> docList = service.selectCompletRefDocList(vo, pv);
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		model.addAttribute("pv", pv);
		model.addAttribute("selectedFormCode", vo.getDocFormCode());
		
		return "approval/completRefList";
	}
	
	//문서함 - 반려
	@GetMapping("unApprList/{pno}/{docFormCode}")
	public String unApprList(Model model, HttpSession session, @PathVariable int pno, @PathVariable String docFormCode) {
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");

		ApprovalDocVo vo = new ApprovalDocVo();
		vo.setEmpCode(loginMember.getEmpCode());
		vo.setDocFormCode(docFormCode);
		
		int totalCount = service.selectUnApprTotalCnt(vo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		List<ApprovalDocVo> docList = service.selectUnApprDocList(vo, pv);
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		model.addAttribute("pv", pv);
		model.addAttribute("selectedFormCode", vo.getDocFormCode());
		
		return "approval/unApprList";
	}
	
	@GetMapping("storage")
	public String storage() {
		return "approval/storage";
	}
	
	
	@GetMapping("formManager")
	public String formManager(Model model) {
		
		List<DocFormVo> docFormList = service.selectDocFormList();
		model.addAttribute("docFormList", docFormList);
		
		return "approval/formManager";
	}
	
	@GetMapping("formManagerDetail/{formCode}")
	public String formManagerDetail(@PathVariable int formCode, Model model) {
		
		DocFormVo docForm = service.selectDocForm(formCode);
		List<DocFormMapperVo> formMappingList = service.formSelect(formCode);
		
		model.addAttribute("docForm", docForm);
		model.addAttribute("formMappingList", formMappingList);
		
		return "approval/formManagerDetail";
	}
	
	@GetMapping("formEdit/{formCode}")
	public String formEdit(@PathVariable int formCode, Model model) {
		
		DocFormVo docForm = service.selectDocForm(formCode);
		List<DocFormMapperVo> formMappingList = service.formSelect(formCode);
		List<DocFormDetailTemplateVo> formDetailList = service.selectFormDetailList();
		
		model.addAttribute("formDetailList", formDetailList);
		model.addAttribute("docForm", docForm);
		model.addAttribute("formMappingList", formMappingList);
		
		return "approval/formEdit";
	}
	
	@PostMapping("formEdit")
	@ResponseBody
	public String forEdit(@RequestBody DocFormVo vo) {
		int updateForm = service.updateDocForm(vo);
		if(updateForm == 1) {
			return "수정 성공";
		} else {
			return "수정 실패";
		}
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
	
	@GetMapping("approvalAllList/{pno}/{docFormCode}")
	public String approvalAllList(Model model, HttpSession session, @PathVariable int pno, @PathVariable String docFormCode) {
		
		ApprovalDocVo vo = new ApprovalDocVo();
		vo.setDocFormCode(docFormCode);
		
		int totalCount = service.selectAllDocTotalCnt(vo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 3, 15);
		
		//문서종류 불러오기
		List<DocFormVo> formList = service.selectFormList();
		List<ApprovalDocVo> docList = service.selectAllDocList(vo, pv);
		
		model.addAttribute("formList", formList);
		model.addAttribute("docList", docList);
		model.addAttribute("pv", pv);
		model.addAttribute("selectedFormCode", vo.getDocFormCode());
		
		return "approval/approvalAllList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
