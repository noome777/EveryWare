package com.kh.app00.commute.vo;

import lombok.Data;

@Data
public class CommuteVo {
    
    private String comCode;
    private String eCode;
    private String startTime;
    private String startTimeFormat;
    private String endTime;
    private String endTimeFormat;
    private String workingTime;
    private String enrollDate;
    private String comStatus;

}
