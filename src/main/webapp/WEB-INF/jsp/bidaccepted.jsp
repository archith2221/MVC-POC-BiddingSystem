
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Bid Accepted and Not Accepted Product List</title>
    <style>
    body {
         background-color: #F3DEBA;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;  }
        h1 {
            text-align: center;
            color:Black;
        }
        
        table {
            width: 70%;
            margin: 0 auto;
            background-color: #f2f2f2;
            padding: 20px;
        }
        
        th, td {
            padding: 10px;
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
    <h1>Bid Accepted Product List</h1>
    <table border="2" cellpadding="2">
        <tr>
           <th>ProductId</th>
           <th>Product name</th>
            <th>Bidded Price</th>
           
            <th>To Purchase</th>
        </tr>
        <c:forEach var="t" items="${acclist}">
            <tr>
                <td>${t.id}</td>
                <td>${t.name}</td>
                <td>${t.bidprice}</td>
               
                <td><a href="topay/${t.bidid}">Payment</a></td>
            </tr>
        </c:forEach>
    </table>
    <br />
    <h1>Bid Not Accepted Product List</h1>
    <table border="2" cellpadding="2">
        <tr>
            <th>ProductId</th>
            <th>ProductName</th>
            <th>Bidded Price</th>
            
        </tr>
        <c:forEach var="n" items="${notacclist}">
            <tr>
                <td>${n.id}</td>
                <td>${n.name}</td>
                <td>${n.bidprice}</td>
              
            </tr>
        </c:forEach>
    </table>
    <a href="viewcustprod">BACK</a><br>
</body>
</html>