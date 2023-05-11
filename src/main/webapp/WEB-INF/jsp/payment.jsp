<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Edit Product</h1>
<form:form method="POST" action="/bidding/paid">
	<table>
		<%-- <tr>
			<td></td>
			<td><form:hidden path="bidid" /></td>
		</tr> --%>
		
		<tr>
           <td>Product ID:</td>
             
              <td><form:input path="id" value="${B.id}" readonly="true" /><td>
            </tr>
		
		<tr>
		<tr>
           <td> Price to be paid:</td>
            <td><form:input path="bidprice" value="${B.bidprice}" readonly="true" /><td>
           
            </tr>
		
		<tr>
			<td>Payment details</td>
		
		 	 <td><input type="text" name="paymentDetails"> </td>
		</tr>
		
		
			<td></td>
			<td><input type="submit" value=" Save" /></td>
		</tr>
	</table>
</form:form>