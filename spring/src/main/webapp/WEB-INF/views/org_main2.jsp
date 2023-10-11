<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>기관 페이지</title>
  <link rel="stylesheet" href="\css\org_main2.css">
</head>
<body>
<%@ include file="org_header.jsp" %>
<section id="imageSection">
  <!-- 이미지 슬라이드 쇼 코드 (JavaScript 사용) -->
  <!-- imageUrl 변수를 사용하여 이미지를 동적으로 로드 -->
</section>

<section id="notices">
  <div style="display: flex; flex: 1; flex-direction: column;">
    <div style="display: flex; align-items: center;">
      <h2>공지사항</h2>
      <a style="margin-left: auto;" href="/auth/org/notice/${organization.get().orgId}/1">
        <h4 style="color: gray;">전체보기</h4>
      </a>
    </div>
    <c:choose>
      <c:when test="${empty orgNotice}">
        <p style="text-align: center;">공지사항이 없습니다.</p>
      </c:when>
      <c:otherwise>
        <ul>
          <c:forEach var="notice" items="${orgNotice}" varStatus="status">
            <li>${notice.subject}</li>
            <!-- 공지사항 내용 뿌려주기 -->
          </c:forEach>
        </ul>
      </c:otherwise>
    </c:choose>
  </div>
</section>

<section id="donations">
  <div style="display: flex; flex: 1; flex-direction: column;">
    <div style="display: flex; align-items: center;">
      <h2>기부 내역</h2>
      <a style="margin-left: auto;" href="/auth/org/dnt/${organization.get().orgId}/1">
        <h4 style="color: gray;">전체보기</h4>
      </a>
    </div>
    <c:choose>
      <c:when test="${empty donations}">
        <p style="text-align: center;">기부내역이 없습니다.</p>
      </c:when>
      <c:otherwise>
        <table>
          <!-- 기부 내역 리스트 출력 (최대 5개) -->
          <tr>
            <th>날짜</th>
            <th>금액</th>
            <th>기부자</th>
            <th>영수증다운</th>
          </tr>
          <c:forEach items="${donations}" var="donation">
            <tr>
              <td>${donation.dntAmount}</td>
              <td>${donation.dntAmount}</td>
              <td>${donation.userId}</td>
              <td><a href="/auth/excel/${organization.get().orgId}/${donation.dntId}">
                <img src="\images\excel.png"/>
              </a></td>
            </tr>
          </c:forEach>
        </table>
      </c:otherwise>
    </c:choose>
  </div>
</section>

<section id="info">
  <h2>기관 정보</h2>
  <p>대표자: ${organization.get().orgOwner}</p>
  <p>예금주: ${organization.get().accountHolder}</p>
  <p>계좌번호: ${organization.get().accountNumber}</p>
  <p>설립일: ${organization.get().startedUp}</p>
  <p>기관 홈페이지: <a href="${organization.get().hompage}">${organization.get().hompage}</a></p>
</section>


</body>
</html>