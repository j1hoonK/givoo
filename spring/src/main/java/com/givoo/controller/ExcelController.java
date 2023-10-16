
package com.givoo.controller;


import com.givoo.service.ExcelService;
import jakarta.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;


@Controller
@RequestMapping("/auth")
public class ExcelController {

    private final ExcelService excelService;

    @Autowired
    public ExcelController(ExcelService excelService) {
        this.excelService = excelService;
    }

    @GetMapping("/excel/{orgId}/{dntId}")
    public void downloadExcel(@PathVariable("orgId") Long orgId,
                              @PathVariable("dntId") Long dntId,
                              HttpServletResponse response) throws IOException, InvalidFormatException {
        // 엑셀 파일 생성 및 다운로드 로직을 ExcelService 또는 다른 서비스로 이동
        // ExcelService 클래스의 createExcel 메서드를 호출하여 엑셀 파일을 생성하고 response로 다운로드
        excelService.createExcel(orgId, dntId, response);
    }
    @GetMapping("/showexcel/{orgId}/{dntId}")
    public String showExcel(@PathVariable("orgId") Long orgId,
                          @PathVariable("dntId") Long dntId,
                              HttpServletResponse response, Model model) throws IOException, InvalidFormatException {

        model.addAttribute("excelHtml",excelService.ShowExcel(orgId, dntId, response));
        return "showExcel";
    }
    }


