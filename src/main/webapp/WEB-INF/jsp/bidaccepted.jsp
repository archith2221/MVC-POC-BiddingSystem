
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Bid Accepted Product List</h1>
<table border="2" width="70%" cellpadding="2">
	<tr>
		<th>Id</th>
		<th>Bidded Price</th>
		<th>ProductId</th>
		<th>To Purchase</th>
	</tr>
	<c:forEach var="t" items="${acclist}">
		<tr>
			<td>${t.bidid}</td>
			<td>${t.bidprice}</td>
			<td>${t.id}</td> 
			<td><a href="">Payment</a></td>
			
		</tr>
	</c:forEach>
</table>
<br />
<h1>Bid Accepted Product List</h1>
<table border="2" width="70%" cellpadding="2">
<tr>
		<th>Id</th>
		<th>Bidded Price</th>
		<th>ProductId</th>
	</tr>
	<c:forEach var="n" items="${notacclist}">
		<tr>
			<td>${n.bidid}</td>
			<td>${n.bidprice}</td>
			<td>${n.id}</td> 
			
			
		</tr>
	</c:forEach>
</table>