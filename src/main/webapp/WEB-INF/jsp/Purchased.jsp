<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Purchased Products</h1>
<table border="2" width="70%" cellpadding="2">
	<tr>
		<th>Order Number</th>
		<th>Product ID</th>
		<th>Product Name</th>
		<th>Amount</th>
		
		
	</tr>
	<c:forEach var="p" items="${list}">
		<tr>
			<td>${p.orderid}</td>
			<td>${p.id} </td>
			<td>${p.name}</td>
		   <td>${p.bidprice}</td>
			
		</tr>
	</c:forEach>
</table>
<br />

<a href="viewcustprod">Products Page</a><br>