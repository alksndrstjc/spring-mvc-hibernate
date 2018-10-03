<%--
  Created by IntelliJ IDEA.
  User: Aleksandar
  Date: 11.6.2018.
  Time: 22.46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Log in</title>
    <script>
        var minCharsUsername = 7;
        var minCharsPass = 8;

        function validateInputForm() {
            var isOk = true;
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            if (username.length < minCharsUsername || password < minCharsPass) {
                isOk = false;
                alert("Invalid input! Username must be at least 7 chars long. Password must be at least 8 chars long. Please try again!")
            }
            return isOk;
        }

    </script>
</head>
<body>
<form action="/usercooking" onsubmit="return validateInputForm()">
    <label for="username">Enter your username: </label><br>
    <input type="text" id="username" name="username" placeholder="Your username here" required/><br>
    <label for="password">Enter your password: </label><br>
    <input type="password" id="password" name="password" placeholder="Your password here" required/><br>
    <input type="submit" value="submit"/>
</form>
</body>
</html>
