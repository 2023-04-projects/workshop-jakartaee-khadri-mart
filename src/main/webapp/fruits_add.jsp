<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
    <link rel='stylesheet' type='text/css' href='styles.css' />
    <title>Add Clothes</title>
</head>
<body>
<table border="3"> 
    <h2>Add Fruits </h2>
    <form action="fruitsadd" method="post">
        <label for="item_name"> Name:</label><br>
        <input type="text" id="item_name" name="item_name" required><br><br>

        <label for="item_qty">Quantity:</label><br>
        <input type="number" id="item_qty" name="item_qty" required><br><br>

        <label for="item_price">Price:</label><br>
        <input type="number" step="0.01" id="item_price" name="item_price" required><br><br>

        <input type="submit" value="Add items">
    </form>
    </table>
</body>
</html>

</body>
</html>