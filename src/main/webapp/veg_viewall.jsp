<%@page import="com.khadri.mart.vegetable.form.VegetableForm"%>
<%@page import="com.khadri.mart.vegetable.dao.VegetableDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>

<%
		ServletContext context = application;

		VegetableDao vegetableDao = new VegetableDao(context);
		List<VegetableForm> vegetableList = vegetableDao.selectAllVegetables();
		%>
	<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css' href='styles.css' />
<title>View All Vegetable Page</title>
</head>
<body>
	<form action="vegViewAll" method="get">
		<h2>View All Vegetable Items</h2>

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

				if(vegetableList.isEmpty()){

				%>
				<tr>
					<td colspan="3">No vegetable items found.</td>
				</tr>
				<%
					} else {
						for (VegetableForm eachForm : vegetableList) {
				%>
				<tr>
					<td><%=eachForm.getVegName()%></td>
					<td><%=eachForm.getVegQty()%></td>
					<td><%=eachForm.getVegPrice()%></td>
				</tr>
				<%
					}
					}
				%>
			</tbody>
		</table>
	</form>
</body>
</html>