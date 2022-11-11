package com.kh.app00.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app00.alarm.service.AlarmService;
import com.kh.app00.alarm.vo.AlarmVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.filemanager.service.FilemanagerService;
import com.kh.app00.filemanager.vo.FilemanagerVo;


@Controller
public class AlarmController {
	
private final AlarmService service;
	
	@Autowired
	public AlarmController(AlarmService service) {
		this.service = service;
	}
	
	// /*는 임시로
	@GetMapping("/*")
	public List<AlarmVo> select(Model model, HttpSession session) {
		
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        
		List<AlarmVo> alarmList = service.selectAll(loginMember.getEmpCode());
		model.addAttribute("alarmList", alarmList);
		
		
		return alarmList;
	
	}
}

	

	
