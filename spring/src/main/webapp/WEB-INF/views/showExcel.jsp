<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>영수증</title>
</head>
<body>
<div id="preview-table">
  <!-- excelHtml 내용을 출력합니다. -->
  <c:out value="${excelHtml}" escapeXml="false"/>
</div>
</body>
</html>
