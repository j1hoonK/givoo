<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="\css\admin_answer_inquiry.css">
    <title>문의 상세 페이지</title>
</head>
<body>
<div class="container">
    <h1>문의 상세 내용</h1>
    <div class="question">
        <h2>${inquiry.get().title}</h2>
        <p>${inquiry.get().content}</p>
        <p>작성자: ${inquiry.get().userId}</p>
    </div>
    <div class="answer">
        <h2>답변</h2>
        ${inquiry.get().answer}

    </div>
    <div class="answer-form">
        <h2>답변 작성</h2>

        <form action="/admin/inquiry/answer/${inquiry.get().inquiryId}" method="post">
            <textarea name="answer" rows="4" cols="50" placeholder="답변을 입력하세요"></textarea>
            <br>
            <input type="submit" value="답변 제출">
        </form>
    </div>
</div>
</body>
</html>