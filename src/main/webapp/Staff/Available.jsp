<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.model.admin.Car, com.dao.admin.CarDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false); // Don't create a new session if none exists
    String StaffId = (sessionObj != null) ? (String) sessionObj.getAttribute("StaffId") : null;

    if (StaffId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp"); // Redirect to login if not logged in
        return;
    }
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Cars</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/Staff/availableCars.css">
</head>
<body>

<%@ include file="header.jsp" %>

<main class="main-content">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Available Cars</h2>

        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Car ID</th>
                        <th>Model</th>
                        <th>License Plate</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        CarDAO carDAO = new CarDAO();
                        List<Car> cars = carDAO.getAvailableCars();
                        if (cars.isEmpty()) { %>
                            <tr>
                                <td colspan="4" class="text-danger fw-bold">No available cars found.</td>
                            </tr>
                        <% } else {
                            for (Car car : cars) {
                    %>
                    <tr>
                        <td><%= car.getCarID() %></td>
                        <td><%= car.getModel() %></td>
                        <td><%= car.getPlateNumber() %></td>
                        <td>
                            <% if ("Available".equalsIgnoreCase(car.getStatus())) { %>
                                <span class="badge bg-success">Available</span>
                            <% } else { %>
                                <span class="badge bg-danger"><%= car.getStatus() %></span>
                            <% } %>
                        </td>
                    </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>
