<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.khadri.mart.vegetable.dao.VegetableDao"%>
<%@ page import="com.khadri.mart.vegetable.form.VegetableForm"%>
<%@ page import="java.util.*"%>

	<%
		ServletContext context = application;
		VegetableDao dao = new VegetableDao(context);
	List<VegetableForm> listOfVegetables = new ArrayList<>();
	String searchName = request.getParameter("veg_name");
	System.out.println("Search Parameter: " + searchName);
	if (searchName != null && !searchName.isEmpty()) {
		listOfVegetables = dao.selectVegetables(searchName);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css' href='styles.css' />
    <title>View Vegetable Items</title>
</head>
<body>
	<h1> View Vegetables </h1>
	<form action="veg_view" method="get">
		<label for="veg_name">Vegetable Name:</label> 
		<input type="text" id="veg_name" name="veg_name">
		<input type="submit" value = "SearchItems">
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
				// Loop through the list and display the vegetables
					for (VegetableForm eachForm : listOfVegetables ) {
			%>


			<tr>
				<td><%=eachForm.getVegName()%></td>
				<td><%=eachForm.getVegQty()%></td>
				<td><%=eachForm.getVegPrice()%></td>
			</tr>
			<%
				}
			if (listOfVegetables.isEmpty() && searchName != null) {
			%>
			<tr>
				<td colspan="3">No items found for "<%=searchName%>".</td>
			</tr>

			<%
				}
			%>
		
		</tbody>
	</table>
</body>
</html>