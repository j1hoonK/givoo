<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>기부어때 Admin Panel</title>
    <link href="\css\web_tablestyle.css" rel="stylesheet">
</head>
<body>
<%@ include file="main_sidebar.jsp" %>

<section class="home-section">
    <nav>
        <div class="sidebar-button">
            <span class="">회원 관리</span>
        </div>
        <div class="search-box">
            <input placeholder="회원명 / 회원번호 검색" type="text">
        </div>
    </nav>

<%--    유저 테이블--%>
    <div class="table-container">
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>email</th>
            <th>phone_number</th>
            <th>address</th>
            <th>nickname</th>
            <th>birth</th>
            <th>image</th>
            <th>login type</th>
            <!-- 다른 유저 정보 필드를 여기에 추가 -->
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.userEmail}</td>
                <td>${user.userTell}</td>
                <td>${user.userAddress}</td>
                <td>${user.userNname}</td>
                <td>${user.userNumberFirst}</td>
                <td>${user.userImage}</td>
                <td>${user.loginType}</td>
                <!-- 다른 유저 정보 필드를 여기에 추가 -->
            </tr>
        </c:forEach>
    </table>
    </div>

<%--    페이징 --%>
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="${currentPage - 1}">이전</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="page">
            <c:choose>
                <c:when test="${page == currentPage}">
                    <span>${page}</span>
                </c:when>
                <c:otherwise>
                    <a href="${page}">${page}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="?page=${currentPage + 1}">다음</a>
        </c:if>
    </div>
</section>

</body>
</html>
