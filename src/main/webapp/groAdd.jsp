<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Grosary</title>
<link rel='stylesheet' type='text/css' href='styles.css' />

</head>
<body>
	<h2>Add Grosary Item</h2>
	<form action="groadd" method="post">
		<label for="name">Grosary Name:</label><br> <input type="text"
			id="name" name="name" required><br> <br> <label
			for="qty">Quantity:</label><br> <input type="number" id="qty"
			name="qty" required><br> <br> <label for="price">Price:</label><br>
		<input type="number" id="price" name="price" required><br>
		<br> <input type="submit" value="Add Grosary">
	</form>
</body>
</html>
