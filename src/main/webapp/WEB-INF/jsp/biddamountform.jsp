<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


 
 <html>
<head>
	<title>Bidding Form</title>
</head>
<body>
	<h2>Bidding Form for Product: ${product.name}</h2>

	<form:form method="POST" action="/bidding/biddstore">
		<table>
		<%-- <tr>
		<input type="hidden" name="prodId" value="<%= p.getId() %>">
		</tr> --%>
		
			<tr>
				<td>Product:</td>
			<td><c:out value="${P.name}" /></td>
			</tr>
			
			 <tr>
           <td>Product ID:</td>
            <td><form:input path="id" value="${P.id}" readonly="true" /></td>
            </tr>
			<tr>
				<td>Description:</td>
				<td><c:out value="${P.details}" /></td>
			</tr>
			<tr>
				<td>Price:</td>
				<td><c:out value="${P.price}" /></td>
			</tr>
			
		  <tr>
				<td><form:input type="hidden" path="bidAccepted" value="false" /></td>
			</tr>  
			<tr>
				<td>Your Bid:</td>
				<td><form:input path="bidprice" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Submit Bid" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>