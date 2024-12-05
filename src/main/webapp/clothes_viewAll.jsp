<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.khadri.mart.clothes.form.ClothesForm"%>
<%@ page import="com.khadri.mart.clothes.dao.ClothesDao"%>
<%@ page import="java.util.*"%>
<%
	ServletContext context = application;
	ClothesDao dao = new ClothesDao(context);
	List<ClothesForm> listOfClothes = dao.selectAllClothes();
%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css' href='styles.css' />
<title>View All Clothes Items</title>
</head>
<body>
	<h2>View All Clothes Items</h2>
	<table border="1">
		<thead>
			<tr>
				<th>Item</th>
				<th>Quantity</th>
				<th>Price</th>
			</tr>
		</thead>
		<tbody>
			<%
				if (listOfClothes.isEmpty()) {
			%>
			<tr>
				<td colspan="3">No clothes items found.</td>
			</tr>
			<%
				} else {
					for (ClothesForm eachForm : listOfClothes) {
			%>
			<tr>
				<td><%=eachForm.getItemName()%></td>
				<td><%=eachForm.getItemQty()%></td>
				<td><%=eachForm.getItemPrice()%></td>
			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
</body>
</html>
