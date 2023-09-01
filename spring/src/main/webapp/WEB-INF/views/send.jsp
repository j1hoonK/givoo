<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Send Page</title>
</head>
<body>
<h1>Send Donations</h1>
<form action="/donation/send" method="post" accept-charset="UTF-8">
    <p>dnt_amount: <input type="text" name="dnt_amount"></p>
    <p>type_payment: <input type="text" name="type_payment"></p>
    <p>dnt_comment: <input type="text" name="dnt_comment"></p>
    <p>is_regulation: <input type="text" name="is_regulation"></p>
    <p>dnt_comment_regulation: <input type="text" name="dnt_comment_regulation"></p>
    <p>dnt_type: <input type="text" name="dnt_type"></p>
    <button type="submit">Send</button>
</form>

</body>
</html>