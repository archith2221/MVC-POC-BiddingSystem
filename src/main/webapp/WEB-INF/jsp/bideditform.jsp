
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Edit Product</title>
	<style>
		body {
			 background-image: url('https://img.freepik.com/free-photo/assortment-with-judge-gavel-euro-banknotes_23-2148230132.jpg?w=1060&t=st=1684301103~exp=1684301703~hmac=d69115dc729485c8c53b291c51fd004aee49782d34612764ed71ea5f688c2aff');
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
		<form:form method="POST" action="/bidding/bideditsave">
			<div class="form-group">
				<form:hidden path="bidid" />
			</div>
			<div class="form-group">
				<form:hidden path="uid" />
			</div>
			
			<div class="form-group">
				<label class="form-label">Product ID:</label>
				<c:out value="${command.id}" />
			</div>
			
			<div class="form-group">
				<label class="form-label">Bidded Price:</label>
				<c:out value="${command.bidprice}" />
			</div>
			
			<div class="form-group">
				<label class="form-label">Respond:</label>
				<form:select path="bidAccepted" class="form-input">
					<form:option value="true">Accept</form:option>
					<form:option value="false">Reject</form:option>
				</form:select>
			</div>
			
			<div class="form-group">
				<input type="submit" value="Edit Save" class="form-submit" />
			</div>
		</form:form>
	</div>
</body>
</html>