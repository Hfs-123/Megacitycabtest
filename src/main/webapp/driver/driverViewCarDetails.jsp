<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.dao.admin.CarDAO" %>
<%@ page import="com.model.admin.Car" %>

<%
    String driverId = (String) session.getAttribute("driverId");

    if (driverId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    CarDAO carDAO = new CarDAO();
    Car assignedCar = carDAO.getAssignedCarByDriverId(driverId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Assigned Car</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/driver/car.css">
</head>
<body>

<%@ include file="header.jsp" %>

<!-- Main Content Area -->
<main class="container mt-5">
    <h2 class="text-center mb-4 text-primary">My Assigned Car</h2>

    <!-- Display Car Details or Alert -->
    <div class="card mb-4 shadow-sm">
        <div class="card-body">
            <% if (assignedCar != null) { %>
                <h5 class="card-title text-success"><i class="fas fa-car"></i> Car Details</h5>
                <ul class="list-group">
                    <li class="list-group-item"><strong>Car ID:</strong> <%= assignedCar.getCarID() %></li>
                    <li class="list-group-item"><strong>Model:</strong> <%= assignedCar.getModel() %></li>
                    <li class="list-group-item"><strong>Plate Number:</strong> <%= assignedCar.getPlateNumber() %></li>
                    <li class="list-group-item"><strong>Status:</strong> <span class="badge bg-primary"><%= assignedCar.getStatus() %></span></li>
                </ul>
            <% } else { %>
                <div class="alert alert-warning text-center">
                    <i class="fas fa-exclamation-triangle"></i> No car has been assigned to you yet.
                </div>
            <% } %>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>
