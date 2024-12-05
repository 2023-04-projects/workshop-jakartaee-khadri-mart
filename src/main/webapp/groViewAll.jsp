<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.khadri.mart.grosary.dao.GrosaryDao" %>
<%@ page import="com.khadri.mart.grosary.form.GrosaryForm" %>
<%
ServletContext context = application;
GrosaryDao dao = new GrosaryDao(context);
    List<GrosaryForm> listOfGrosary = dao.selectAllGrosary(); 
%>
<!DOCTYPE html>
<html>
<head>
    <link rel='stylesheet' type='text/css' href='styles.css' />
    <title>View All grosary Items</title>
</head>
<body>
    <h2>View All grosary Items</h2>

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
                
                    for (GrosaryForm eachForm : listOfGrosary) {
            %>
            
             <tr>
                    <td><%= eachForm.getGrosaryName() %></td>
                    <td><%= eachForm.getGrosaryQty() %></td>
                    <td><%= eachForm.getGrosaryPrice()%></td>
                </tr>
             <%
                }
			     if (listOfGrosary.isEmpty()) {
               %>
            <tr>
                <td colspan="3">No grosary items found.</td>
            </tr>
            <%
                }
            %>
               
        </tbody>
    </table>
</body>
</html>