<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Purchased Products</h1>
<table border="2" width="70%" cellpadding="2">
	<tr>
		<th>Id</th>
		<th>Price</th>
		<th>Product ID</th>
		
	</tr>
	<c:forEach var="p" items="${list}">
		<tr>
			<td>${p.orderid}</td>
			<td>${p.bidprice}</td>
			<td>${p.id}</td>
			
	</tr>
	</c:forEach>
</table>
<br />

<a href="viewcustprod">Products</a><br>