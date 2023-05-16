<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Register Page</h1>
 <form:form method="POST" action="/bidding/registeradd" >
	<table>
		
		<tr>
			<td>Name :</td>
			<td><form:input path="name" /></td>
		</tr>
	
		<tr>
			<td>Email :</td>
			<td><form:input path="email" /></td>
		</tr>
		
		<tr>
			<td>Password :</td>
			<td><form:input path="password" /></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:hidden path="role" value ="customer"/></td>
		</tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Edit Save" /></td>
		</tr>
	</table>
	
</form:form>  

<c:if test="${not empty error}">
        <div style="color: red;">${error}</div>
    </c:if>