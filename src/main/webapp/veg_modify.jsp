<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.khadri.mart.vegetable.dao.VegetableDao"%>
<%@ page import="com.khadri.mart.vegetable.form.VegetableForm"%>
<%@ page import="java.util.*"%>

	<%
		String searchName = request.getParameter("veg_name");
		List<VegetableForm> listOfVegetables = new ArrayList<>();
		if (searchName != null && !searchName.isEmpty()) {
			ServletContext context = application;
			VegetableDao dao = new VegetableDao(context);
			listOfVegetables = dao.selectVegetables(searchName);
		}
	%>
<!DOCTYPE html>
<html>
<head>
<title>Modify Vegetable Items</title>
<link rel='stylesheet' type='text/css' href='styles.css' />

</head>
<body>
	<h2>Search Vegetable Item</h2>
	<form action="veg_modify" method="get">
		<table>
			<tr>
				<td>Vegetable Name: <input type="text" name="veg_name"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Search Items"></td>
			</tr>
		</table>
	</form>
	<br>
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
				for (VegetableForm eachForm : listOfVegetables) {
			%>
			<tr>
				<td><a href="veg_modify_page.jsp?vegName=<%= eachForm.getVegName() %>&vegQty=<%= eachForm.getVegQty() %>&vegPrice=<%= eachForm.getVegPrice() %>" target="bottom_right"> 
                            <%= eachForm.getVegName() %> 
				</a></td>
				<td><%=eachForm.getVegQty()%></td>
				<td><%=eachForm.getVegPrice()%></td>
			</tr>
			<%
				}
			if (listOfVegetables.isEmpty() && searchName != null) {
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