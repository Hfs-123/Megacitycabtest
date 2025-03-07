<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.admin.RateDAO, com.model.admin.FareRate" %>
<%@ page session="true" %>
<%
    String adminId = (String) session.getAttribute("adminId");
    if (adminId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));
    RateDAO fareDAO = new RateDAO();
    FareRate fare = fareDAO.getFareRateById(id);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Fare Rate</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/admin/Fare.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <div class="fare-form-container">
        <h2 class="form-title">Edit Fare Rate</h2>
        <form action="/Admin/EditFareRateServlet" method="post">
            <input type="hidden" name="id" value="<%= fare.getId() %>">

            <div class="form-group">
                <label>Car Type:</label>
                <input type="text" name="carType" value="<%= fare.getCarType() %>" required>
            </div>

            <div class="form-group">
                <label>Base Fare:</label>
                <input type="number" name="baseFare" value="<%= fare.getBaseFare() %>" required>
            </div>

            <div class="form-group">
                <label>Per KM Rate:</label>
                <input type="number" name="perKmRate" value="<%= fare.getPerKmRate() %>" required>
            </div>

            <div class="form-group checkbox-group">
                <label>Multiplier Enabled:</label>
                <input type="checkbox" name="multiplierEnabled" <%= fare.isMultiplierEnabled() ? "checked" : "" %>>
            </div>

            <div class="form-group">
                <label>Multiplier Value:</label>
                <input type="number" name="multiplier" value="<%= fare.getMultiplier() %>">
            </div>

            <div class="form-group checkbox-group">
                <label>Tax Enabled:</label>
                <input type="checkbox" name="taxEnabled" <%= fare.isTaxEnabled() ? "checked" : "" %>>
            </div>

            <div class="form-group">
                <label>Tax Rate:</label>
                <input type="number" name="taxRate" value="<%= fare.getTaxRate() %>">
            </div>

            <div class="form-group">
                <label>Discount:</label>
                <input type="number" name="discount" value="<%= fare.getDiscount() %>">
            </div>

            <div class="button-container">
                <button type="submit" class="btn update-btn">Update Fare</button>
                <a href="FareRates.jsp" class="btn back-btn">Go Back</a>
            </div>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
