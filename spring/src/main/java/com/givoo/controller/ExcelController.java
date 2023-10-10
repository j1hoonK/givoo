
package com.givoo.controller;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import com.givoo.service.ExcelService;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.IOException;


@Controller

public class ExcelController {

    private final ExcelService excelService;

    @Autowired
    public ExcelController(ExcelService excelService) {
        this.excelService = excelService;
    }

    @GetMapping("/members/excel/{orgId}/{dntId}")
    public void downloadExcel(@PathVariable("orgId") Long orgId,
                              @PathVariable("dntId") Long dntId,
                              HttpServletResponse response) throws IOException, InvalidFormatException {
        // 엑셀 파일 생성 및 다운로드 로직을 ExcelService 또는 다른 서비스로 이동
        // ExcelService 클래스의 createExcel 메서드를 호출하여 엑셀 파일을 생성하고 response로 다운로드
        excelService.createExcel(orgId, dntId, response);
    }

}
