<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>기관 페이지</title>
  <link rel="stylesheet" type="text/css" href="\css\org_main.css"> <!-- 여기에 실제 CSS 파일 경로를 넣어주세요 -->
</head>
<body>

    <div class="org-info">
      <h1>${organization.get().orgName}</h1>
      <p>대표자: ${organization.get().orgOwner}</p>
      <p>기관 주소: ${organization.get().orgAddress}</p>
      <p>예금주: ${organization.get().accountHolder}</p>
      <p>예금 은행: ${organization.get().bankName}</p>
      <p>계좌 번호: ${organization.get().accountNumber}</p>
    </div>

<h2>기부 내역</h2>
<table class="donation-table">
  <thead>
  <tr>
    <th>날짜</th>
    <th>금액</th>
    <th>기부자</th>
    <th>수정</th>
    <th>삭제</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="donation" items="${donations}">
    <tr>
      <td>${donation.date}</td>
      <td>${donation.amount}</td>
      <td>${donation.donor}</td>
      <td><a href="/edit-donation/${donation.id}">수정</a></td>
      <td><a href="/delete-donation/${donation.id}">삭제</a></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>