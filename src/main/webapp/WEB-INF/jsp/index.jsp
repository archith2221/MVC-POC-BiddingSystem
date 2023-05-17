<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            background-image: url("https://wallpaperaccess.com/full/2593068.jpg");
            background-size: cover;
            text-align: center;
            padding-top: 150px;
        }
        
        h2 {
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
        
       .register-link {
            color: white;
            text-decoration: none;
            margin-top: 10px;
            display: block;
        }
    </style>
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
        <div class="error">${error}</div>
    </c:if>
    <a href="register" class="register-link"><h3>Register</h3></a> 
   
</body>
</html>



