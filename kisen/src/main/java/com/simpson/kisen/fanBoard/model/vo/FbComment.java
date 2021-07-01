package com.simpson.kisen.fanBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FbComment {
    
    private int commentNo;
    private int commentLevel;
    private String writer;
    private String content;
    private int fbNo;
    private int commentRef;
    private Date regDate;

}
