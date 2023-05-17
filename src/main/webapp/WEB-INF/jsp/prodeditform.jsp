<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Edit Product</title>
	<style>
		body {
			 background-image: url('https://img.freepik.com/free-photo/shopping-cart-near-blank-blackboard_23-2148288186.jpg?w=1380&t=st=1684309035~exp=1684309635~hmac=f6174f418a6a33f24ccd5f4c8b3c10fb2513051fd7bfe2e2b7888aa63cdfedf7');
            background-repeat: no-repeat;
            background-size: cover;
		}

		.container {
			max-width: 400px;
			margin: 0 auto;
			padding: 20px;
			background-color: #ffffff;
			border: 1px solid #cccccc;
			border-radius: 5px;
		}

		h1 {
			text-align: center;
			color: #333333;
		}

		.form-group {
			margin-bottom: 20px;
		}

		.form-label {
			display: block;
			margin-bottom: 5px;
			color: #333333;
			font-weight: bold;
		}

		.form-input {
			width: 100%;
			padding: 10px;
			border: 1px solid #cccccc;
			border-radius: 3px;
		}

		.form-submit {
			width: 100%;
			padding: 10px;
			background-color: #4CAF50;
			color: #ffffff;
			border: none;
			border-radius: 3px;
			cursor: pointer;
		}

		.form-submit:hover {
			background-color: #45a049;
		}
	</style>
</head>
<body>
<div class="container">
<h1>Edit Product</h1>
<form:form method="POST" action="/bidding/editsave">
	<table>
		<div class="form-group">
		<tr>
			<td></td>
			<td><form:hidden path="id" /></td>
		</tr>
		<tr>
			<td>Name :</td>
			<td><form:input path="name" /></td>
		</tr>
		<tr>
		<tr>
			<td>Details :</td>
			<td><form:input path="details" /></td>
		</tr>
		<tr>
			<td>Price :</td>
			<td><form:input path="price" /></td>
		</tr>
		<tr>
			<td>Activated :</td>
		
	<td>	<select name="activated">
          <option value="true">Approved</option>
          <option value="false">Unapproved</option>
        </select>
		</tr> </td>
<br>
		<tr>
			<td></td>
			<td><input type="submit" value="Edit Save" /></td>
		</tr>
		</div>
	</table>
</form:form>
</div>
</body>
</html>