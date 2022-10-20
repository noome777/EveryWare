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

import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.service.OrganizationService;
import com.kh.app00.organization.vo.DeptVo;
import com.kh.app00.common.PageVo;
import com.kh.app00.common.Pagination;

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
				return "organization/searchEmp";
			} else {
				session.setAttribute("alertMsg", "임직원의 정보를 불러올 수 없습니다.  검색하시려는 임직원의 성함을 올바르게 적어주시길 바랍니다.");
				return "redirect:/";
			}
		} else {
			return "redirect:/";
		}
	}
	
	@GetMapping("management/emp/{pno}")
	public String manageEmp(Model model, @PathVariable int pno) {
		
		int totalCount = organizationService.selectTotalCnt();
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<EmpVo> empList = organizationService.selectEmpListByPage(pv);
		
		model.addAttribute("empList",empList);
		model.addAttribute("pv", pv);
		
		return "organization/empManager";
	}
	
	
	@GetMapping("management/right/{pno}")
		public String manageRight(Model model, @PathVariable int pno){
		
		return "organization/rightManager";
		
	}

}
