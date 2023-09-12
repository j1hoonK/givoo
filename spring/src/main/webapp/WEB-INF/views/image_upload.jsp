<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>imageUpload</title>
</head>
<body>
<form method="post" action="/upload" enctype="multipart/form-data">
    <input multiple type="file" name="file">
    <button>submit</button>
</form>
</body>
</html>
