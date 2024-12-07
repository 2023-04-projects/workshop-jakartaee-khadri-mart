<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Modify Vegetable</title>
</head>
<body>
	<%
		String vegName = request.getParameter("vegName");
		String vegQty = request.getParameter("vegQty");
		String vegPrice = request.getParameter("vegPrice");
	%>
	<form action="vegModify" method="post">
		<table border="1">
			<table>
				<tr>
					<td>Vegetable Name:</td>
					<td><input type="text" name="veg_name" value="<%=vegName%>"
						readonly></td>
				</tr>
				<tr>
					<td>Vegetable Qty:</td>
					<td><input type="text" name="veg_qty" value="<%=vegQty%>">
					</td>
				</tr>
				<tr>
					<td>Vegetable Price:</td>
					<td><input type="text" name="veg_price" value="<%=vegPrice%>">
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