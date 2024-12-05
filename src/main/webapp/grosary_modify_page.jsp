<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Modify Product</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String qty = request.getParameter("qty");
		String price = request.getParameter("price");
	%>
	<form action="gromodify" method="post">
		<table border="1">
			<table>
				<tr>
					<td>Name:</td>
					<td><input type="text" name="name" value="<%=name%>"
						readonly></td>
				</tr>
				<tr>
					<td>Quantity:</td>
					<td><input type="text" name="quantity" value="<%=qty%>">
					</td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input type="text" name="price" value="<%=price%>">
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Modify"></td>
				</tr>
			</table>
		</table>
	</form>
</body>
</html>
