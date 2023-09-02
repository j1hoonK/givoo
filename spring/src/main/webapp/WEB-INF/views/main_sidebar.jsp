<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="css/style.css" rel="stylesheet">

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Merienda:wght@700&family=Noto+Sans+KR:wght@500&family=Poppins:ital,wght@0,200;1,900&display=swap');
    </style>

    <title>Admin Panel</title>
</head>

<body>
<div class="sidebar">
    <div class="logo-details">
        <i class='bx bx-donate-heart'></i>
        <span class="logo_name">기부어때</span>
    </div>

    <ul class="nav-links">
        <li>
            <a href="#">
                <i class='bx bx-user'></i>
                <span class="link_name">회원 관리</span>
                <i class='bx bxs-chevron-down'></i>
            </a>
        </li>
        <li>
            <a href="#">
                <i class='bx bxs-buildings'></i>
                <span class="link_name">기관 관리</span>
                <i class='bx bxs-chevron-down'></i>
            </a>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-money-withdraw'></i>
                <span class="link_name">기부금 관리</span>
                <i class='bx bxs-chevron-down'></i>
            </a>
        </li>

        <!--   추후 추가 -->
        <!--        <li>-->
        <!--            <a href="#">-->
        <!--                <i class='bx bx-credit-card-front'></i>-->
        <!--                <span class="link_name">환불 처리</span>-->
        <!--                <i class='bx bxs-chevron-down'></i>-->
        <!--            </a>-->
        <!--        </li>-->
        <!--        <li>-->
        <!--            <a href="#">-->
        <!--                <i class='bx bx-receipt'></i>-->
        <!--                <span class="link_name">영수증 목록</span>-->
        <!--                <i class='bx bxs-chevron-down'></i>-->
        <!--            </a>-->
        <!--        </li>-->
        <!--        <li>-->
        <!--            <a href="#">-->
        <!--                <i class='bx bx-cog'></i>-->
        <!--                <span class="link_name">설정 및 구성</span>-->
        <!--                <i class='bx bxs-chevron-down'></i>-->
        <!--            </a>-->
        <!--        </li>-->
        <!--        여기까지-->


        <li>
            <a href="#">
                <i class='bx bx-log-out'></i>
                <span class="link_name">logout</span>
            </a>
        </li>
    </ul>
</div>

<section class="home-section">
    <nav>
        <div class="sidebar-button">
            <i class='bx bx-menu'></i>
            <span class="dashboard">회원 관리</span>

        </div>
        <div class="search-box">
            <input placeholder="회원명 / 회원번호 검색" type="text">
            <i class='bx bx-search'></i>
        </div>
    </nav>
</section>

</body>
</html>
