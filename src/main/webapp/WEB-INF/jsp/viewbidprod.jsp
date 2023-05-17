

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>BidProduct List</title>
    <style>
        body {
            background-image: url('https://img.freepik.com/free-photo/shopping-cart-filled-with-coins-copy-space-background_23-2148305919.jpg?w=1060&t=st=1684260102~exp=1684260702~hmac=0186f23fe8e2a2f7849f94300d68a76e5a9314d0a2029724c166f8025b88e0b8');
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
            background-color: #f2f2f2;
            padding: 20px;
        }
        
        th, td {
            padding: 10px;
            text-align: center;
        }
        
        th {
            background-color: #ccc;
        }
        
        tr:nth-child(even) {
            background-color: #e6e6e6;
        }
        
        tr:hover {
            background-color: #f5f5f5;
        }
        
        a {
			color: Black;
			text-decoration: none;
			font-weight: bold;
		}
        
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>BidProduct List</h1>
    <table border="2" width="70%" cellpadding="2">
        <tr>
            <th>Id</th>
            <th>Bidded Price</th>
            <th>ProductId</th>
            <th>Product Name</th>
            <th>Bid Response</th> 
            <th>CustomerId</th>
            <th>Customer Email ID</th>
            <th>Edit</th>
            <th>Delete Bid</th>
        </tr>
        <c:forEach var="b" items="${list}">
            <tr>
                <td>${b.bidid}</td>
                <td>${b.bidprice}</td>
                <td>${b.id}</td>
                <td>${b.name}</td>
                <td>${b.bidAccepted}</td> 
                <td>${b.uid}</td>
                <td>${b.email}</td>
                <td><a href="editbid/${b.bidid}">Edit</a></td>
                <td><a href="deletebidprod/${b.bidid}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <br />
     <a href="home1">Home Page</a><br>
</body>
</html>