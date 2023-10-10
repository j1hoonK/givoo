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

import java.io.File;
import java.io.IOException;

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

    public void createExcel(Long orgId,Long dntId, HttpServletResponse response) throws InvalidFormatException, IOException, org.apache.poi.openxml4j.exceptions.InvalidFormatException {
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
   /*     setValue(sheet, "C5", estimate.getEmail()); // 이메일
        setValue(sheet, "C6", convertPhone(estimate.getPhone())); // 연락처
        setValue(sheet, "C8", convertDateWithYear(estimate.getCreatedDate())); // 견적일
        setValue(sheet, "C9", convertDateWithYear(estimate.getValidDate())); // 유효일
*/
        /*// 차량-내용
        String date = convertDate(estimate.getDepartDate()) + "~" + convertDate(estimate.getArrivalDate());
        setValue(sheet, "C14", date);
        String content = estimate.getArrivalPlace() + " ~ " + estimate.getArrivalPlace();
        setValue(sheet, "F14", content);
        setValue(sheet, "L14", estimate.getVehicleType()); // 규격
        setValue(sheet, "N14", Integer.toString(estimate.getVehicleNumber())); // 댓수
        setValue(sheet, "O14", "대");
*/
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

    // 06-29 형식
    private String convertDate(String date){
        return date.substring(5, 10);
    }

    // 2022-06-29 형식
    private String convertDateWithYear(String date) {
        return date.substring(0, 10);
    }

    // 010-1234-1234 형식
    private String convertPhone(String phone) {
        String top = phone.substring(0, 3);
        String mid = phone.substring(3, 7);
        String bottom = phone.substring(7, 11);
        return top + "-" + mid + "-" + bottom;
    }
}

