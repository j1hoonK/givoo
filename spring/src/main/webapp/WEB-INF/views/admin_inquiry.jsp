<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <link rel="stylesheet" href="\css\admin_inquiry.css">
    <title>Hello World!</title>
</head>
<body>
<%@ include file="main_sidebar.jsp" %>
<section class="notice">
  <div class="page-title">
    <div class="container">
      <h3>문의사항</h3>
    </div>
  </div>

  <!-- board seach area -->
  <div id="board-search">
    <div class="container">
      <div class="search-window">
        <form action="">
          <div class="search-wrap">
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- board list area -->
  <div id="board-list">
    <div class="container">
      <table class="board-table">
        <thead>
        <tr>
          <th scope="col" class="th-num">작성자</th>
          <th scope="col" class="th-num">제목</th>
          <th scope="col" class="th-title">내용</th>
          <th scope="col" class="th-date">등록일</th>
          <th scope="col" class="th-date">상태</th>
          <th scope="col" class="th-date">답변달기</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${inquirys}" var="inquiry">
          <!-- 클릭 이벤트 추가 -->
          <td>${inquiry.userId}</td>
            <td>${inquiry.title}</td>
            <td>${inquiry.content}</td>
            <td>${inquiry.createdAt}</td>
          <td>${inquiry.status}</td>
          <td><a href="/admin/inquiry/answer/${inquiry.inquiryId}">답변</a></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="pagination">
        <c:if test="${currentPage > 1}">
          <a href="${currentPage - 1}">이전</a>
        </c:if>

        <c:choose>
          <c:when test="${totalPages <= 10}">
            <c:forEach begin="1" end="${totalPages}" var="page">
              <c:choose>
                <c:when test="${page == currentPage}">
                  <span>${page}</span>
                </c:when>
                <c:otherwise>
                  <a href="?page=${page}">${page}</a>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <c:set var="startPage" value="${currentPage - 5}" />
            <c:set var="endPage" value="${currentPage + 4}" />

            <c:if test="${startPage < 1}">
              <c:set var="startPage" value="1" />
              <c:set var="endPage" value="10" />
            </c:if>

            <c:if test="${endPage > totalPages}">
              <c:set var="endPage" value="${totalPages}" />
              <c:set var="startPage" value="${totalPages - 9}" />
            </c:if>

            <c:forEach begin="${startPage}" end="${endPage}" var="page">
              <c:choose>
                <c:when test="${page == currentPage}">
                  <span>${page}</span>
                </c:when>
                <c:otherwise>
                  <a href="${page}">${page}</a>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </c:otherwise>
        </c:choose>

        <c:if test="${currentPage < totalPages}">
          <a href="${currentPage + 1}">다음</a>
        </c:if>
      </div>
    </div>
  </div>
</body>
</html>
