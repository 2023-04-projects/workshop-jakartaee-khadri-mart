<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.khadri.mart.grosary.dao.GrosaryDao"%>
<%@ page import="com.khadri.mart.grosary.form.GrosaryForm "%>
<%@ page import jakarta.servlet.ServletContext "%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css' href='styles.css' />
<title>Search and Delete Grocery Items</title>
</head>
<body>
	<h2>Search Grocery Items</h2>
	<form action="grosary_delete" method="post">
		<label for="name">Grosary Name:</label> <input type="text" id="name"
			name="name" required> <input type="submit" value="Search">
	</form>

	<%
	String searchName = request.getParameter("name");

	List<GrosaryForm> listOfGrossaries = new ArrayList<>();

	if (searchName != null) {
		ServletContext context = application;
		GrosaryDao dao = new GrosaryDao(context);
		listOfGrossaries = dao.selectGrosary(searchName);
	}
	%>


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
				<td><a
					href="grosary_delete_page.jsp?name=<%=eachForm.getGrosaryName()%>&qty=<%=eachForm.getGrosaryQty()%>&price=<%=eachForm.getGrosaryPrice()%>"
					target="bottom_right"> <%=eachForm.getGrosaryName()%>
				</a></td>
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
