<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Delete Clothes Details</title>
</head>
<body>
	<%
		String name = request.getParameter("item_name");
		String qty = request.getParameter("item_qty");
		String price = request.getParameter("item_price");
	%>
	<form action="clodelete" method="post">
		<table border="1">
			<table>
				<tr>
					<td>Name:</td>
					<td><input type="text" name="item_name" value="<%=name%>"
						readonly></td>
				</tr>
				<tr>
					<td>Quantity:</td>
					<td><input type="text" name="item_qty" value="<%=qty%>"
						readonly></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input type="text" name="item_price" value="<%=price%>"
						readonly></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="delete"></td>
				</tr>
			</table>
		</table>
	</form>
</body>
</html>
