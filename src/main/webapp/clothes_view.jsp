<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.khadri.mart.clothes.form.ClothesForm"%>
<%@ page import="com.khadri.mart.clothes.dao.ClothesDao"%>
<%@ page import="java.util.*"%>
<%
	ServletContext context = application;
	ClothesDao dao = new ClothesDao(context);
	List<ClothesForm> listOfClothes = new ArrayList<>();

	String searchName = request.getParameter("item_name");

	if (searchName != null && !searchName.trim().isEmpty()) {
		listOfClothes = dao.selectClothes(searchName.trim());
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css' href='styles.css' />
<title>View Clothes Items</title>
</head>
<body>
	<h2>View Clothes Items</h2>
	<form action="clothes_view" method="get">
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
				for (ClothesForm eachForm : listOfClothes) {
			%>
			<tr>
				<td><%=eachForm.getItemName()%></td>
				<td><%=eachForm.getItemQty()%></td>
				<td><%=eachForm.getItemPrice()%></td>
			</tr>
			<%
				}
				if (listOfClothes.isEmpty() && searchName != null) {
			%>
			<tr>
				<td colspan="3">No items found for "<%=searchName%>".
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>
