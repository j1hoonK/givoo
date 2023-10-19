package com.givoo.controller;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OpenApiController {
    @GetMapping("/org/recruitment")
    public List<Map<String, String>> getAllRecruitmentData() throws IOException, ParseException {
        int pageNo = 1; // 페이지 번호
        int pageSize = 1000; // 페이지 크기

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String todayDate = dateFormat.format(new Date());
        Calendar cal = Calendar.getInstance();
        String endDate = "20241231";
        StringBuilder sb = new StringBuilder();

        while (dateFormat.parse(todayDate).before(dateFormat.parse(endDate))) {

            StringBuilder urlBuilder = new StringBuilder("http://openapi.1365.go.kr/openapi/service/rest/ContributionGroupService/getCntrGrpProgramList");
            urlBuilder.append("?serviceKey=m9IRUGmwrOiSW82kWOXnIC4m7NaSN42qLgPtrh02EjHQ2XjT%2BN8btdSpQsB2HlD4pjNFxkMlIJnpfuyRYrHk0g%3D%3D"); // 서비스 키
            urlBuilder.append("&" + URLEncoder.encode("schCntrProgrmRegistNo", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*모집등록번호*/
            urlBuilder.append("&" + URLEncoder.encode("schSido", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*시도*/
            urlBuilder.append("&" + URLEncoder.encode("schRcritBgnde", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*모집시작일자*/
            urlBuilder.append("&" + URLEncoder.encode("keyword", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*검색어*/
            urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + pageNo); // 페이지 번호
            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + pageSize); // 페이지 크기
            cal.add(Calendar.DATE, 1);
            todayDate = dateFormat.format(cal.getTime());
            urlBuilder.append("&" + URLEncoder.encode("schRcritEndde", "UTF-8") + "=" + URLEncoder.encode(todayDate, "UTF-8")); /*모집완료일자*/
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            String line;
            while ((line = rd.readLine()) != null) {
                if(line.contains("<item>")){
                    sb.append(line);
                   // System.out.println(sb);
                }
            }
            rd.close();
            conn.disconnect();
        }

        String xmlData = sb.toString(); // XML 데이터를 여기에 추가
        String jsonData = convertXmlToJson(xmlData);
        System.out.println(jsonData);

        ObjectMapper objectMapper = new ObjectMapper();
        List<Map<String, String>> itemList = new ArrayList<>();

        try {
            JsonNode root = objectMapper.readTree(jsonData);
            JsonNode itemsNode = root.path("body").path("items").path("item");

            if (itemsNode.isArray()) {
                for (JsonNode itemNode : itemsNode) {
                    Map<String, String> itemMap = new ObjectMapper().convertValue(itemNode, Map.class);
                    itemList.add(itemMap);
                }
            }
            // itemList에 "item" 데이터가 맵 형태로 저장됨
            for (Map<String, String> item : itemList) {
                System.out.println(item);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        System.out.println("itemList : " + itemList);
        //System.out.println(sb);
        return itemList;
    }
    public static String convertXmlToJson(String xmlData) {
        try {
            XmlMapper xmlMapper = new XmlMapper();
            JsonNode jsonNode = xmlMapper.readTree(xmlData);
            // JSON을 String으로 변환
            return jsonNode.toPrettyString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
