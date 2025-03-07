<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.model.admin.FareRate, com.dao.admin.RateDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    String StaffId = (sessionObj != null) ? (String) sessionObj.getAttribute("StaffId") : null;

    if (StaffId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fare Rates</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/Staff/fareRates.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="main-content">
    <div class="container">
        <h2 class="text-center">Fare Rates</h2>

        <div class="card-container">
            <%
                RateDAO rateDAO = new RateDAO();
                List<FareRate> fareRates = rateDAO.getAllFareRates();
                for (FareRate fareRate : fareRates) {
            %>
            <!-- Fare Rate Card -->
            <div class="fare-card">
                <h4><%= fareRate.getCarType() %></h4>
                <p><strong>Base Fare:</strong> $<%= fareRate.getBaseFare() %></p>
                <p><strong>Per Km Rate:</strong> $<%= fareRate.getPerKmRate() %></p>
                <p><strong>Multiplier:</strong> x<%= fareRate.getMultiplier() %></p>
                <p><strong>Tax Rate:</strong> <%= fareRate.getTaxRate() %>%</p>
                <p><strong>Discount:</strong> <%= fareRate.getDiscount() %>%</p>
            </div>
            <% } %>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
