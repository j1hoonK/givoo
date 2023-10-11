package com.givoo.service;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.organization.Organization;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

@Service
@RequiredArgsConstructor
public class ExcelService {
    @Autowired
    private final DonationService donationService;
    @Autowired
    private final OrganizationService organizationService;

    public static final String FILE_PATH = "C:\\Users\\KIBWA_06\\sample.xlsx";

    private void setValue(Sheet sheet, String position, String value) {
        CellReference ref = new CellReference(position);
        Row r = sheet.getRow(ref.getRow());
        if (r != null) {
            Cell c = r.getCell(ref.getCol());
            c.setCellValue(value);
        }
    }

    public void createExcel(Long orgId, Long dntId, HttpServletResponse response) throws InvalidFormatException, IOException, org.apache.poi.openxml4j.exceptions.InvalidFormatException {
        // 견적 가져오기
        Organization org = organizationService.findById(orgId).orElseThrow();
        Donation dnt = donationService.dnt(dntId).orElseThrow();

        // 엑셀 파일 불러오기
        OPCPackage opcPackage = OPCPackage.open(new File(FILE_PATH));
        XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
        String sheetName = workbook.getSheetName(0);
        Sheet sheet = workbook.getSheet(sheetName);

        // 데이터 세팅
        setValue(sheet, "C4", org.getOrgName()); // 수신
        // 다운로드
        response.setContentType("ms-vnd/excel");
        String fileName = "기부영수증" + org.getOrgName();
// 엑셀 다운로드시 한글 깨짐 처리
        String outputFileName = new String(fileName.getBytes("KSC5601"), "8859_1");
        response.setHeader("Content-Disposition", "attachment;filename=" + outputFileName + ".xlsx");
        response.setStatus(200);
        workbook.write(response.getOutputStream());
        workbook.close();
    }

    public String ShowExcel(Long orgId, Long dntId, HttpServletResponse response) throws InvalidFormatException, IOException, org.apache.poi.openxml4j.exceptions.InvalidFormatException {
        try {
            // 견적 가져오기
            Organization org = organizationService.findById(orgId).orElseThrow();
            Donation dnt = donationService.dnt(dntId).orElseThrow();

            // 엑셀 파일 불러오기
            OPCPackage opcPackage = OPCPackage.open(new File(FILE_PATH));
            XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
            String sheetName = workbook.getSheetName(0);
            Sheet sheet = workbook.getSheet(sheetName);

            // 데이터 세팅
            setValue(sheet, "C4", org.getOrgName()); // 수신

            StringBuilder htmlContent = new StringBuilder("<table border=\"1\">");
            Iterator<Row> rowIterator = sheet.iterator();
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                Iterator<Cell> cellIterator = row.iterator();

                htmlContent.append("<tr>");
                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                    String cellValue = getCellValueAsString(cell);
                    htmlContent.append("<td>").append(cellValue).append("</td>");
                }
                htmlContent.append("</tr>");
            }

            htmlContent.append("</table>");
            workbook.close();

            return htmlContent.toString();

        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }
    private String getCellValueAsString(Cell cell) {
        String cellValue = "";
        switch (cell.getCellType()) {
            case STRING:
                cellValue = cell.getStringCellValue();
                break;
            case NUMERIC:
                cellValue = String.valueOf(cell.getNumericCellValue());
                break;
            case BOOLEAN:
                cellValue = String.valueOf(cell.getBooleanCellValue());
                break;
            default:
                break;
        }
        return cellValue;
    }
}




