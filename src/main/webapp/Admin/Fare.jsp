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
    <title>Fare Management</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/admin/Fare2.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>


<div class="fare-management-container">
    <!-- Add Fare Rate Form -->
    <h1>Add New Fare Rate</h1>
    <form action="AddFareRateServlet" method="post" class="fare-form">
        <label for="carType">Car Type:</label>
        <select name="carType" id="carType" required>
            <option value="" disabled selected>Select Car Type</option>
            <option value="Sedan">Sedan</option>
            <option value="SUV">SUV</option>
            <option value="Luxury">Luxury</option>
        </select>

        <label for="baseFare">Base Fare (LKR):</label>
        <input type="number" step="0.01" name="baseFare" id="baseFare" required>

        <label for="perKmRate">Per KM Rate (LKR):</label>
        <input type="number" step="0.01" name="perKmRate" id="perKmRate" required>

        <div class="checkbox-group">
            <input type="checkbox" id="multiplierEnabled" name="multiplierEnabled">
            <label for="multiplierEnabled">Enable Vehicle Multiplier</label>
        </div>

        <label for="multiplier">Multiplier Value:</label>
        <input type="number" step="0.1" name="multiplier" id="multiplier" value="1.0">

        <div class="checkbox-group">
            <input type="checkbox" id="taxEnabled" name="taxEnabled">
            <label for="taxEnabled">Enable Tax Rate</label>
        </div>

        <label for="taxRate">Tax Rate (%):</label>
        <input type="number" step="0.1" name="taxRate" id="taxRate" value="0.0">

        <label for="discount">Discount (%):</label>
        <input type="number" step="0.1" name="discount" id="discount" value="0.0">

        <button type="submit" class="submit-btn">Add Fare Rate</button>
    </form>

  
    <div class="view-rates-btn-container">
        <a href="FareRates.jsp" class="view-rates-btn">View Fare Rates</a>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
