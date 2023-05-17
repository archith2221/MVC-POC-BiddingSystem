
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

    <style>
        body {background-image: url('https://img.freepik.com/free-photo/hands-holding-credit-card-typing-laptop_1262-2284.jpg?w=1060&t=st=1684344369~exp=1684344969~hmac=3ab0245517e8d8d3dae3e21ef28fd1b2c4e7bb64d8dd40b78716763685f56d3b');
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;
			font-family: Arial, sans-serif;
	 }
        
        h1 {
            text-align: center;
        }
        
        table {
            width: 50%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
        }
        
        td {
            padding: 10px;
        }
        
        input[type="text"] {
            width: 100%;
            padding: 5px;
        }
        
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Payment</h1>
    <form:form method="POST" action="/bidding/paid">
        <table>
            <tr>
                <td><form:hidden path="uid" value="${B.uid}" /></td>
            </tr>
            <tr>
                <td>Product ID:</td>
                <td><form:input path="id" value="${B.id}" readonly="true" /></td>
            </tr>
            <tr>
                <td>Price to be paid:</td>
                <td><form:input path="bidprice" value="${B.bidprice}" /></td>
            </tr>
            <tr>
                <td>Payment details:</td>
                <td><input type="text" name="paymentDetails"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Save" /></td>
            </tr>
        </table>
    </form:form>
</body>
</html>