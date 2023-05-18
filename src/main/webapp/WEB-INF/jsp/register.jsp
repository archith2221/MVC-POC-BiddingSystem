<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
    <style>
        body {
            background-image: url("https://images.squarespace-cdn.com/content/v1/6019c15d7dff866728d927d5/1628693805047-8CADFHRDK1CABMJ5KD1P/unsplash-image-P1qyEf1g0HU.jpg?format=1500w");
            background-size: cover;
             text-align: center; 
            padding-top: 150px;
        }
        
        h1 {
            color: white;
        }
        
        form {
            display: inline-block;
            background-color: rgba(255, 255, 255, 0.7);
            padding: 20px;
            border-radius: 5px;
        }
        
        input[type="text"],
        input[type="password"] {
            padding: 5px;
            margin: 5px;
            width: 200px;
        }
        
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <h1>Register Page</h1>
    <form:form method="POST" action="/bidding/registeradd">
        <table>
            <tr>
                <td>Name:</td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><form:input path="email" /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><form:input path="password" type="password"   /></td>
            </tr>
            <tr>
                <td></td>
                <td><form:hidden path="role" value="customer" /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Register" /></td>
            </tr>
        </table>
    </form:form>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <a href="index">LOGIN Page</a><br>
</body>
</html>
