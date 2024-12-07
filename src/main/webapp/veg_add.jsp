<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel='stylesheet' type='text/css' href='styles.css' />
<title>add vegetable page</title>
</head>
<body>
	<h2>Add Vegetable Item</h2>
	<form action="vegAdd" method="post">
		<label for="veg_name">Vegetable Name:</label><br> 
		<input	type="text" id="veg_name" name="veg_name" required><br><br>
		
		 <label for="veg_qty">Vegetable Qty:</label><br> 
		 <input type="number" id="veg_qty" name="veg_qty" required><br><br>
		 
		 <label for="veg_price">Vegetable Price:</label><br> 
		 <input type="number" step="0.01" id="veg_price" name="veg_price" required><br><br>
		 
		 <input type="submit" value="Add Vegetable">
	</form>
</body>
</html>