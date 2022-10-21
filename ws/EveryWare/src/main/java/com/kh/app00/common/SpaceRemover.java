package com.kh.app00.common;

import com.kh.app00.emp.vo.EmpVo;

public class SpaceRemover {

	public static String removeSpace(String str) {          
		
		String replacedStr = str.replaceAll("\\s", "");    

		return replacedStr;
	}
	
	public static EmpVo removeEmpWhiteSpace(EmpVo empVo) {
		
		String replacedName = empVo.getEmpName().replaceAll("\\s", "");
		String replacedId = empVo.getEmpId().replaceAll("\\s", "");
		String replacedPwd = empVo.getEmpPwd().replaceAll("\\s", "");
		
		empVo.setEmpName(replacedName);
		empVo.setEmpId(replacedId);
		empVo.setEmpPwd(replacedPwd);
		
		return empVo;
	}
}
