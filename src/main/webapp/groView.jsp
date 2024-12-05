<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.khadri.mart.grosary.dao.GrosaryDao"%>
<%@ page import="com.khadri.mart.grosary.form.GrosaryForm"%>
<%
	ServletContext context = application;
	GrosaryDao dao = new GrosaryDao(context);
	List<GrosaryForm> listOfGrossaries = new ArrayList<>();

	String searchName = request.getParameter("name");
	System.out.println("Search Parameter: " + searchName);

	if (searchName != null) {
		listOfGrossaries = dao.selectGrosary(searchName);
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css' href='styles.css' />
<title>View Grocery Items</title>
</head>
<body>
	<h2>View Grocery Items</h2>
	<form action="grosary_view" method="get">
		<label for="name">Grocery Name:</label> <input type="text" id="name"
			name="name"> <input type="submit" value="Search">
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
				for (GrosaryForm eachForm : listOfGrossaries) {
			%>
			<tr>
				<td><%=eachForm.getGrosaryName()%></td>
				<td><%=eachForm.getGrosaryQty()%></td>
				<td><%=eachForm.getGrosaryPrice()%></td>
			</tr>
			<%
				}
			if (listOfGrossaries.isEmpty() && searchName != null) {

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
