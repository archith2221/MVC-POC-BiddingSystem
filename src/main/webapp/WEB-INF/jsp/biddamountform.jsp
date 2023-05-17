

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Bidding</title>
    <style>
        body {
            background-image: url('https://ak.picdn.net/shutterstock/videos/1014210296/thumb/1.jpg');
            background-repeat: no-repeat;
            background-size: cover;
        }
        
        h2 {
            text-align: center;
        }
        
        table {
            width: 50%;
            margin: 0 auto;
            background-color: #f2f2f2;
            padding: 20px;
        }
        
        td {
            padding: 10px;
        }
        
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #0066cc;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #0052a3;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Bidding</h2>

    <form:form method="POST" action="/bidding/biddstore">
        <table>
     
            
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
                  <center>  <input type="submit" value="Submit Bid" /></center>
                </td>
            </tr>
        </table>
    </form:form>
</body>
</html>