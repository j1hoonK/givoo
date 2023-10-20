<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>기부어때 Admin Panel</title>
    <link href="\css\web_tablestyle.css" rel="stylesheet">
    <link href="\css\modal.css" rel="stylesheet">
    <script type="text/javascript" src="\js\usermodal.js"></script>
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

    <!-- 유저 테이블 -->
    <div class="table-container">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Address</th>
                <th>Nickname</th>
                <th>Birth</th>
                <th>Image</th>
                <th>Login Type</th>
            </tr>
            <c:forEach items="${users}" var="user">
                <!-- 클릭 이벤트 추가 -->
                <tr class="user-row" data-user-id="${user.userId}" onclick="openModal('${user.userId}')">
                    <td>${user.userId}</td>
                    <td>${user.userName}</td>
                    <td>${user.userEmail}</td>
                    <td>${user.userTell}</td>
                    <td>${user.userAddress}</td>
                    <td>${user.userNname}</td>
                    <td>${user.userNumberFirst}</td>
                    <td>${user.userImage}</td>
                    <td>${user.loginType}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!-- 모달 창 -->
    <div id="userModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>수정 하기</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <td><input class="form-control" id="modalUserId" type="text"></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><input class="form-control" id="modalUserName" type="text"></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><input class="form-control" id="modalUserEmail" type="text"></td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td><input class="form-control" id="modalUserTell" type="text"></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><input class="form-control" id="modalUserAddress" type="text"></td>
                </tr>
                <tr>
                    <th>Nickname</th>
                    <td><input class="form-control" id="modalUserNname" type="text"></td>
                </tr>
                <tr>
                    <th>Birth</th>
                    <td><input class="form-control" id="modalUserNumberFirst" type="text"></td>
                </tr>
                <tr>
                    <th>Image</th>
                    <td><input class="form-control" id="modalUserImage" type="text"></td>
                </tr>
                <tr>
                    <th>Login Type</th>
                    <td><input class="form-control" id="modalLoginType" type="text"></td>
                </tr>
            </table>
            <button id="editButton" onclick="openEditForm()">수정</button>
            <button id="deleteButton" onclick="deleteUser()">삭제</button>
        </div>
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

</body>
</html>
