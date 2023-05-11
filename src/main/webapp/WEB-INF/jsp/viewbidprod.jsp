
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>BidProduct List</h1>
<table border="2" width="70%" cellpadding="2">
	<tr>
		<th>Id</th>
		<th>Bidded Price</th>
		<th>ProductId</th>
		<th>BidResponse</th> 
		<th>Edit</th>
	</tr>
	<c:forEach var="b" items="${list}">
		<tr>
			<td>${b.bidid}</td>
			<td>${b.bidprice}</td>
			<td>${b.id}</td>
		    <td>${b.bidAccepted}</td> 
			<td><a href="editbid/${b.bidid}">Edit</a></td>
			<td><a href="deletebidprod/${b.bidid}">Delete</a></td>
		</tr>
	</c:forEach>
</table>
<br />