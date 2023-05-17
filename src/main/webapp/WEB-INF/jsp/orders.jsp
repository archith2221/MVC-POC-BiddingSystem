<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Purchased Products</title>
	<style>
		body {
			background-image: url('https://img.freepik.com/free-photo/colorful-shopping-bags_23-2147652050.jpg?size=626&ext=jpg&ga=GA1.1.1934983661.1684259978&semt=ais');
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;
			font-family: Arial, sans-serif;
		}

		h1 {
			color: Black;
		}

		table {
			background-color: #FFFFFF;
			border-collapse: collapse;
			margin: 20px auto;
		}

		th, td {
			padding: 10px;
			border: 1px solid #000000;
		}

		a {
			color: Black;
			text-decoration: none;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<h1>Purchased Products</h1>
	<table border="2" width="70%" cellpadding="2">
		<tr>
			<th>Order Number</th>
			<th>Product ID</th>
			<th>Product Name</th>
			<th>Amount</th>
		</tr>
		<c:forEach var="o" items="${list}">
			<tr>
				<td>${o.orderid}</td>
				<td>${o.id}</td>
				<td>${o.name}</td>
				<td>${o.bidprice}</td>
			</tr>
		</c:forEach>
	</table>
	<br />

	<a href="home1">Home Page</a><br>
</body>
</html>