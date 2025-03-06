<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.admin.RateDAO,com.model.admin.FareRate, java.util.List" %>
<%@ page session="true" %>
<%

    String adminId = (String) session.getAttribute("adminId");

    if (adminId == null) {
       
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<%
    RateDAO fareDAO = new RateDAO();
    List<FareRate> fareRates = fareDAO.getAllFareRates();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fare Rates</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all_css/admin/Fare3.css">
</head>
<body>
<%@ include file="header.jsp" %>
    <div class="dashboard-container">
        <!-- Return to Fare Management Button -->
        <div class="top-right-container">
            <a href="FareManagement.jsp" class="return-btn">Return</a>
        </div>

        <h1>Fare Rates</h1>
        <table class="fare-table">
            <thead>
                <tr>
                    <th>Car Type</th>
                    <th>Base Fare</th>
                    <th>Per Km Rate</th>
                    <th>Multiplier</th>
                    <th>Tax Rate</th>
                    <th>Discount</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (FareRate fare : fareRates) { %>
                    <tr>
                        <td><%= fare.getCarType() %></td>
                        <td>$<%= fare.getBaseFare() %></td>
                        <td>$<%= fare.getPerKmRate() %></td>
                        <td><%= fare.isMultiplierEnabled() ? fare.getMultiplier() + "x" : "Disabled" %></td>
                        <td><%= fare.isTaxEnabled() ? fare.getTaxRate() + "%" : "No Tax" %></td>
                        <td><%= fare.getDiscount() %>%</td>
                        <td>
                            <a href="EditFareRate.jsp?id=<%= fare.getId() %>" class="btn edit-btn">Edit</a>
                            <a href="DeleteFareRateServlet?id=<%= fare.getId() %>" class="btn delete-btn" onclick="return confirm('Are you sure?');">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <%@ include file="footer.jsp" %>
    
</body>
</html>
