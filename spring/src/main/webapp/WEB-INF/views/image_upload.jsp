<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>imageUpload</title>
    <link rel="stylesheet" href="\css\org_main2.css">
</head>
<body>
<%@ include file="org_header.jsp" %>
<form method="post" action="/auth/org/upload/${orgId}" enctype="multipart/form-data">
    <input multiple type="file" name="file">
    <button>등록하기</button>
</form>
</body>
</html>
