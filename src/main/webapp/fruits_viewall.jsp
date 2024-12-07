<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.khadri.mart.fruits.form.FruitsForm"%>
<%@ page import="com.khadri.mart.fruits.dao.FruitsDao"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%
	ServletContext context = application;
	FruitsDao dao = new FruitsDao(context);
	List<FruitsForm> listOfFruits = dao.selectAllFruits();
%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css' href='styles.css' />
<title>View All Fruits Items</title>
</head>
<body>
	<h2>View All Fruits Items</h2>

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
				if (listOfFruits.isEmpty()) {
			%>
			<tr>
				<td colspan="3">No Fruits found.</td>
			</tr>
			<%
				} else {
					for (FruitsForm eachForm : listOfFruits) {
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
