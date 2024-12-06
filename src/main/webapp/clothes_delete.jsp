<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.khadri.mart.clothes.dao.ClothesDao"%>
<%@ page import="com.khadri.mart.clothes.form.ClothesForm"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css' href='styles.css' />
<title>Delete clothes Items</title>
</head>
<body>
	<h2>Delete clothes Item</h2>
	<form action="clothes_delete" method="post">
		<table>
			<tr>
				<td>Item Name: <input type="text" name="item_name"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Search Items"></td>
			</tr>
		</table>
	</form>
	<br>
	<%
		String searchName = request.getParameter("item_name");
		List<ClothesForm> listOfClothes = new ArrayList<>();
		if (searchName != null && !searchName.isEmpty()) {
			ServletContext context = application;
			ClothesDao dao = new ClothesDao(context);
			listOfClothes = dao.selectClothes(searchName);
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
				for (ClothesForm eachForm : listOfClothes) {
			%>
			<tr>
				<td><a
					href="clothes_delete_page.jsp?item_name=<%=eachForm.getItemName()%>&item_qty=<%=eachForm.getItemQty()%>&item_price=<%=eachForm.getItemPrice()%>"
					target="bottom_right"> <%=eachForm.getItemName()%>
				</a></td>
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
