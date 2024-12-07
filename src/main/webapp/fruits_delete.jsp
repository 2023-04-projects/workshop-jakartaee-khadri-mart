<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.khadri.mart.fruits.dao.FruitsDao" %>
<%@ page import="com.khadri.mart.fruits.form.FruitsForm" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import ="jakarta.servlet.ServletContext" %>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css' href='styles.css' />
    <title>Delete Fruits Items</title>
</head>
<body>
    <h2>Search Fruits Item</h2>
    <form action="fruits_delete" method="get">
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
        List<FruitsForm> listOfFruits = new ArrayList<>();
        if (searchName != null && !searchName.isEmpty()) {
            ServletContext context = application; 
            FruitsDao dao = new FruitsDao(context);
            listOfFruits = dao.selectFruits(searchName);
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
                for (FruitsForm eachForm : listOfFruits) {
            %>
                <tr>
                    <td>
                        <a href="fruits_delete_page.jsp?item_name=<%= eachForm.getItemName() %>&item_qty=<%= eachForm.getItemQty() %>&item_price=<%= eachForm.getItemPrice() %>" target="bottom_right"> 
                            <%= eachForm.getItemName() %> 
                        </a>
                    </td>
                    <td><%= eachForm.getItemQty() %></td>
                    <td><%= eachForm.getItemPrice() %></td>
                </tr>
            <%
                }
                if (listOfFruits.isEmpty() && searchName != null) {
            %>
                <tr>
                    <td colspan="3">No items found for "<%= searchName %>".</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>>