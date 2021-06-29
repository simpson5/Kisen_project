package com.simpson.kisen.review.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class UploadFile {  
    int id;
    
    String fileName;
    

    String saveFileName;
    

    String filePath;
    

    String contentType;

    long size;
    
    Date regDate;
}