<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Ordered List</h1>
<table border="2" width="70%" cellpadding="2">
	<tr>
		<th>Id</th>
		<th>Price</th>
		<th>Product ID</th>
	</tr>
	<c:forEach var="p" items="${list}">
		<tr>
			<td>${p.id}</td>
			<td>${p.name}</td>
			<td>${p.details}</td>
			<td>${p.price}</td> 
			<td><a href="bid/${p.id}" >BIDD</a></td>
			
		</tr>
	</c:forEach>
</table>
<br />