

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Product List</title>
    <!-- <style>
        body {
            background-image: url('https://img.freepik.com/free-photo/cyber-monday-retail-sales_23-2148688493.jpg?w=1380&t=st=1684260006~exp=1684260606~hmac=03f8e1e7d5bb235d9bc9656e8b06606c429b91dbd2646764f0a644c789bcb69b');
            background-repeat: no-repeat;
            background-size: cover;
        }
        
        h1 {
            text-align: center;
        }
        
        table {
            width: 70%;
            border-collapse: collapse;
            margin: 0 auto;
        }
        
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #f2f2f2;
        }
        
       a {
			color: Black;
			text-decoration: none;
			font-weight: bold;
		}
        
        a:hover {
            text-decoration: underline;
        }
    </style> -->
    
     <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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
    <h1>Product List</h1>
    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Details</th>
            <th>Price</th>
            <th>Activated</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="p" items="${list}">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.details}</td>
                <td>${p.price}</td>
                <td>${p.activated}</td>
                <td><a href="editprod/${p.id}">Edit</a></td>
                <td><a href="deleteprod/${p.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="home1">Home Page</a><br>
</body>
</html>
