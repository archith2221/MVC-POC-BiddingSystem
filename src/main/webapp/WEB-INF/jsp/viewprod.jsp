
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Product List</h1>
<table border="2" width="70%" cellpadding="2">
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Details</th>
		<th>Price</th>
	<!-- 	<th>Activated</th> -->
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach var="p" items="${list}">
		<tr>
			<td>${p.id}</td>
			<td>${p.name}</td>
			<td>${p.details}</td>
			<td>${p.price}</td>
		<%-- <td>${p.activated}</td> --%>
			<td><a href="editprod/${p.id}">Edit</a></td>
			<td><a href="deleteprod/${p.id}">Delete</a></td>
		</tr>
	</c:forEach>
</table>
<br />
<a href="prodform">Add New Products</a>