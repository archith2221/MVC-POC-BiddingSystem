
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        .navbar {
            background-color: #333;
            padding: 10px;
            text-align: right;
            color: #fff;
        }
        
        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 5px 10px;
            margin-left: 10px;
            border-radius: 5px;
        }
        
        .navbar a:hover {
            background-color: #555;
        }
        
        h1 {
            text-align: center;
            margin-top: 30px;
        }
        
        table {
            width: 70%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }
        
        th, td {
            padding: 10px;
            text-align: left;
        }
        
        th {
            background-color: #333;
            color: #fff;
        }
        
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
        a.button {
            display: inline-block;
            background-color: #4CAF50;
            color: #fff;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        
        a.button:hover {
            background-color: #45a049;
        }
        
        .left {
            float: left;
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="left">
            <a href="bidaccepted" class="button">Bid Status</a>
            <a href="Purchased" class="button">Purchased Products</a>
        </div>
        <a href="http://localhost:8080/bidding/index">Logout</a>
        <h1>Welcome ${name}</h1>
    </div>
    <h1>Product List</h1>
    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Details</th>
            <th>Price</th>
            <th>Bidding</th>
        </tr>
        <c:forEach var="p" items="${list}">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.details}</td>
                <td>${p.price}</td>
                <td><a href="bid/${p.id}" class="button">BID</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>