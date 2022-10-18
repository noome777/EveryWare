package com.kh.app00.organization.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.service.OrganizationService;
import com.kh.app00.organization.vo.DeptVo;

@Controller
@RequestMapping("organization")
public class OrganizationController {
	
	private final OrganizationService organizationService;
	
	@Autowired
	public OrganizationController(OrganizationService organizationService) {
		this.organizationService = organizationService;
	}

	@GetMapping("info")
	public String getEmpList(Model model, HttpSession session) {
		
		List<DeptVo> deptList = organizationService.selectDeptList();
		List<EmpVo> empList = organizationService.selectEmpList();
		
		if(empList!=null && deptList!=null) {
			model.addAttribute("empList",empList);
			model.addAttribute("deptList",deptList);
			return "organization/info";
		} else {
			session.setAttribute("errorMsg", "임직원 정보 불러오기에 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	@PostMapping("info")
	public String searchEmp(String word,HttpSession session) {
		
		if(word!=null) {
			List<EmpVo> empList = organizationService.selectEmpListByWord(word);
			if(empList!=null) {
				System.out.println(empList);
				session.setAttribute("empList", empList);
				return "redirect:/";
			} else {
				session.setAttribute("alertMsg", "임직원의 정보를 불러올 수 없습니다.  검색하시려는 임직원의 성함을 올바르게 적어주시길 바랍니다.");
				return "redirect:/";
			}
		} else {
			return "redirect:/";
		}
	}

}
