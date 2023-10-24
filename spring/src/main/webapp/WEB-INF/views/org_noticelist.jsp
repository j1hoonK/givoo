<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<head>
    <title>기부어때 Admin Panel</title>
    <link href="\css\web_tablestyle.css" rel="stylesheet">
    <link href="\css\modal.css" rel="stylesheet">
    <link rel="stylesheet" href="\css\org_noticelist.css">
</head>
<body>
<%@ include file="org_header.jsp" %>
<section class="notice">
    <div class="page-title">
        <div class="container">
            <h3>공지사항</h3>
        </div>
    </div>

    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                        <a href="#" style="color:#081D45 ">등록</a>
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
                    <th scope="col" class="th-num">제목</th>
                    <th scope="col" class="th-title">내용</th>
                    <th scope="col" class="th-date">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${notice}" var="notice">
                    <!-- 클릭 이벤트 추가 -->
                    <tr class="org-row" data-user-id="${notice.noticeId}" onclick="openModal('${notice.noticeId}')">
                        <td>${notice.subject}</td>
                        <td>${notice.contents}</td>
                        <td>${notice.noticeDate}</td>
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
                <a href="/auth/org/notice/register/${organization.get().orgId}?orgId=${organization.get().orgId}">등록</a>
            </div>
        </div>
    </div>

</section>

</body>
</html>