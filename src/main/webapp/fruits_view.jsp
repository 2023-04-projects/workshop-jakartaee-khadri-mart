<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.khadri.mart.fruits.form.FruitsForm"%>
<%@ page import="com.khadri.mart.fruits.dao.FruitsDao"%>
<%
	ServletContext context = application;
	FruitsDao dao = new FruitsDao(context);
	List<FruitsForm> listOfFruits = new ArrayList<>();

	String searchName = request.getParameter("item_name");

	if (searchName != null && !searchName.trim().isEmpty()) {
		listOfFruits = dao.selectFruits(searchName.trim());
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css' href='styles.css' />
<title>View Fruits Items</title>
</head>
<body>
	<h2>View Fruits</h2>
	<form action="fruits_view" method="get">
		<label for="item_name">Item Name:</label> <input type="text"
			id="item_name" name="item_name"> <input type="submit"
			value="Search Items">
	</form>

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
				for (FruitsForm eachForm : listOfFruits) {
			%>
			<tr>
				<td><%=eachForm.getItemName()%></td>
				<td><%=eachForm.getItemQty()%></td>
				<td><%=eachForm.getItemPrice()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>