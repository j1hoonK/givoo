<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<head>
    <title>기부어때 Admin Panel</title>
    <link href="\css\web_tablestyle.css" rel="stylesheet">
    <link href="\css\modal.css" rel="stylesheet">
    <link rel="stylesheet" href="\css\org_dntlist.css">

</head>
<body>
<%@ include file="org_header.jsp" %>
<section class="home-section">
    <nav>
        <div class="sidebar-button">
            <span class="">기부금 관리</span>
        </div>
        <div class="search-box">
            <input placeholder="회원명 / 회원번호 검색" type="text">
        </div>
    </nav>
    <!-- 기부금 관리 테이블 -->
    <div class="table-container">
        <table>
            <tr>
                <th>dnt_amount</th>
                <th>dnt_date</th>
                <th>receipt_result</th>
                <th>기관이름</th>
                <th>유저아이디</th>
                <th>type_payment</th>
                <th>dnt_comment</th>
                <th>is_regulation</th>
                <th>dnt_comment_regulation</th>
                <th>dnt_type</th>

            </tr>
            <c:forEach items="${donation}" var="donation">
                <!-- 클릭 이벤트 추가 -->
                <tr class="org-row" data-user-id="${donation.dntId}" onclick="openModal('${donation.dntId}')">
                    <td>${donation.dntAmount}</td>
                    <td>${donation.dntDate}</td>
                    <td>${donation.receiptResult}</td>
                    <td>${donation.orgId}</td>
                    <td>${donation.userId}</td>
                    <td>${donation.typePayment}</td>
                    <td>${donation.dntComment}</td>
                    <td>${donation.isRegulation}</td>
                    <td>${donation.dntCommentRegulation}</td>
                    <td>${donation.dntType}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!-- 모달 창 -->
    <div id="userModal" class="modal">
        <%--        <div class="modal-content">--%>
        <%--            <span class="close" onclick="closeModal()">&times;</span>--%>
        <%--            <h2>수정 하기</h2>--%>
        <%--            <table>--%>
        <%--                <tr>--%>
        <%--                    <th>ID</th>--%>
        <%--                    <td><input class="form-control" id="modalUserId" type="text"></td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>
        <%--                    <th>Name</th>--%>
        <%--                    <td><input class="form-control" id="modalUserName" type="text"></td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>
        <%--                    <th>Email</th>--%>
        <%--                    <td><input class="form-control" id="modalUserEmail" type="text"></td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>
        <%--                    <th>Phone Number</th>--%>
        <%--                    <td><input class="form-control" id="modalUserTell" type="text"></td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>
        <%--                    <th>Address</th>--%>
        <%--                    <td><input class="form-control" id="modalUserAddress" type="text"></td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>
        <%--                    <th>Nickname</th>--%>
        <%--                    <td><input class="form-control" id="modalUserNname" type="text"></td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>
        <%--                    <th>Birth</th>--%>
        <%--                    <td><input class="form-control" id="modalUserNumberFirst" type="text"></td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>
        <%--                    <th>Image</th>--%>
        <%--                    <td><input class="form-control" id="modalUserImage" type="text"></td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>
        <%--                    <th>Login Type</th>--%>
        <%--                    <td><input class="form-control" id="modalLoginType" type="text"></td>--%>
        <%--                </tr>--%>
        <%--            </table>--%>
        <%--            <button id="editButton" onclick="openEditForm()">수정</button>--%>
        <%--            <button id="deleteButton" onclick="deleteUser()">삭제</button>--%>
        <%--        </div>--%>
    </div>

    <!-- 페이징 -->
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