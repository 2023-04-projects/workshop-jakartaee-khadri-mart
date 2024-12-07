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
		String name = request.getParameter("item_name");
		String qty = request.getParameter("item_qty");
		String price = request.getParameter("item_price");
	%>
	<form action="clothesmodify" method="post">
		<table border="1">
			<tbody>
				<tr>
					<td>Name: <input type="text" name="item_name"
						value="<%=name%>" readonly>
					</td>
				</tr>
				<tr>
					<td>Quantity: <input type="text" name="item_qty" id="qty"
						value="<%=qty%>">
					</td>
				</tr>
				<tr>
					<td>Price: <input type="text" name="item_price" id="price"
						value="<%=price%>">
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="Modify"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
