<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="\css\notice_register.css">
    <title>Hello World!</title>
</head>
<body>
<% String orgId = request.getParameter("orgId"); %>
<form action="/auth/org/notice/register/<%= orgId %>" method="post" enctype="multipart/form-data">
    <h2>공지사항 등록</h2>
    <div id="in_title">
        <textarea name="subject" id="subject" rows="1" cols="55" placeholder="제목" maxlength="100" required></textarea>
    </div>

    <div class="wi_line"></div>
    <div id="in_content">
        <textarea name="contents" id="contents" placeholder="내용" required></textarea>
    </div>

    <div class="bt_se">
        <button type="submit">글 작성</button>
    </div>
</form>
</body>

</html>
