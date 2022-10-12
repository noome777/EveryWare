package com.kh.app00.dayoff.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dayoff")
public class DayoffController {
    
    @GetMapping("main")
    public String main() {
        return "dayoff/dayoffMain";
    }
    
    @GetMapping("calendar")
    public String calendar() {
        return "dayoff/dayoffCal";
    }

}
