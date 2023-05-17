

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Add New Product</title>
    <style>
        body {
           /*  background-image: url('https://image.freepik.com/free-photo/white-wall-empty-room-with-plants-floor-3d-rendering_41470-3284.jpg'); */
           background-image: url(' https://img.freepik.com/premium-photo/close-up-mini-shopping-cart-smartphone_101448-3459.jpg?w=1060');
            background-repeat: no-repeat;
            background-size: cover;
        }
        
        h1 {
            text-align: center;
        }
        
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 0 auto;
            background-color: #f2f2f2;
            padding: 20px;
        }
        
        td {
            padding: 10px;
        }
        
        input[type="text"] {
            width: 100%;
            padding: 5px;
        }
        
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Add New Product</h1>
    <form:form method="post" action="save">
        <table>
            <tr>
                <td>Name :</td>
                <td><input name="name" required  /></td>
            </tr>
            <tr>
                <td>Details :</td>
                <td><input name="details" required /></td>
            </tr>
            <tr>
                <td>Price :</td>
                <td><input name="price" required type="number"/></td>
            </tr>
            <tr>
                <td>Activated :</td>
                <td><input name="activated" required /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Save" /></td>
            </tr>
        </table>
    </form:form>
</body>
</html>