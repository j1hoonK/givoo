<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello World!</title>
</head>
<body>
<header>
    <nav id="nav2">
        <a href="/auth/org/${organization.get().orgId}">
        <h1>${organization.get().orgName}</h1>
        </a>
        <ul>
            <li><a href="/auth/org/dnt/${organization.get().orgId}/1">기부내역</a></li>
            <li><a href="/auth/org/notice/${organization.get().orgId}/1">공지사항</a></li>
            <li><a href="/auth/org/edit/${organization.get().orgId}">기관정보</a></li>
            <li><a href="/auth/org/imageupload/${organization.get().orgId}">이미지 등록</a></li>
            <li><a href="#">로그아웃</a></li>
        </ul>
    </nav>
</header>

</body>
</html>
