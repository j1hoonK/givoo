<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>기부어때 Admin Panel</title>
    <link href="\css\web_tablestyle.css" rel="stylesheet">
    <link href="\css\modal.css" rel="stylesheet">
</head>
<body>
<%@ include file="main_sidebar.jsp" %>

<section class="home-section">
    <nav>
        <div class="sidebar-button">
            <span class="">기관 관리</span>

        </div>
        <div class="search-box">
            <input placeholder="기관명 / 기관번호 검색" type="text">
        </div>
    </nav>
    <!-- 유저 테이블 -->
    <div class="table-container">
        <table>
            <tr>
                <th>org_id</th>
                <th>org_name</th>
                <th>org_ownnumber</th>
                <th>org_number</th>
                <th>org_address</th>
                <th>zip</th>
                <th>location_lat</th>
                <th>location_long</th>
                <th>orgTell</th>
                <th>org_type</th>
                <th>org_info</th>
                <th>org_notice</th>
                <th>org_owner</th>
                <th>started_up</th>
                <th>account_number</th>
                <th>bank_name</th>
                <th>account_holder</th>
                <th>image_path</th>
                <th>hompage</th>

            </tr>
            <c:forEach items="${organizarion}" var="org">
                <!-- 클릭 이벤트 추가 -->
                <tr class="org-row" data-user-id="${org.orgId}" onclick="openModal('${org.orgId}')">
                    <td>${org.orgId}</td>
                    <td>${org.orgName}</td>
                    <td>${org.orgOwnnumber}</td>
                    <td>${org.orgNumber}</td>
                    <td>${org.orgAddress}</td>
                    <td>${org.zip}</td>
                    <td>${org.locationLat}</td>
                    <td>${org.locationLong}</td>
                    <td>${org.orgTell}</td>
                    <td>${org.orgType}</td>
                    <td>${org.orgInfo}</td>
                    <td>${org.orgNotice}</td>
                    <td>${org.orgOwner}</td>
                    <td>${org.startedUp}</td>
                    <td>${org.accountNumber}</td>
                    <td>${org.bankName}</td>
                    <td>${org.accountHolder}</td>
                    <td>${org.imagePath}</td>
                    <td><a href="${org.hompage}">${org.hompage}</a></td>

                </tr>
            </c:forEach>
        </table>
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