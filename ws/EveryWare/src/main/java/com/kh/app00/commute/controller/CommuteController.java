package com.kh.app00.commute.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("commute")
public class CommuteController {
    
    @GetMapping("main")
    public String commuteMain() {
        return "commute/commuteMain";
    }
    
    @GetMapping("selectByMonth")
    public String selectByMonth() {
        return "commute/selectByMonth";
    }
    
    @GetMapping("overwork")
    public String overwork() {
        return "commute/overwork";
    }

}
