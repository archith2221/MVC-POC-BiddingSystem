<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
    <h2>Login Page</h2>
    <form method="POST" action="/bidding/login">
        <label>Email:</label>
        <input type="text" name="email" /><br><br>
        <label>Password:</label>
        <input type="password" name="password" /><br><br>
        <input type="submit" value="Login" />
    </form>
    <c:if test="${not empty error}">
        <div style="color: red;">${error}</div>
    </c:if>
    <a href="register">Register</a>
</body>
</html>



