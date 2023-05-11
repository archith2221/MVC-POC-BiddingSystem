<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Edit Product</h1>
<form:form method="POST" action="/bidding/bideditsave">
	<table>
		<tr>
			<td></td>
			<td><form:hidden path="bidid" /></td>
		</tr>
		
		<tr>
           <td>Product ID:</td>
              <td> <c:out value="${command.id}"/></td>
            </tr>
		
		<tr>
		<tr>
           <td>Bidded price:</td>
            <td><c:out value="${command.bidprice}"></c:out>
            </tr>
		
		<tr>
			<td>Respond:</td>
	<td>	
	<form:select path="bidAccepted">
  <form:option value="true">Accept</form:option>
  <form:option value="false">Reject</form:option>
</form:select>
</td>
<br>
		<tr>
			<td></td>
			<td><input type="submit" value="Edit Save" /></td>
		</tr>
	</table>
</form:form>