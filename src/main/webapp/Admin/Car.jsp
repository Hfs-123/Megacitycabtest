<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.admin.Car" %>
<%@ page import="com.dao.admin.CarDAO" %>
<%@ page session="true" %>

<%
    String adminId = (String) session.getAttribute("adminId");
    if (adminId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    CarDAO carDAO = new CarDAO();
    List<Car> cars = carDAO.getAllCars();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Car Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/admin/car.css">
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container">
        <div class="header-section">
            <h1>Add New Car</h1>
        </div>

        <div class="form-container">
            <form action="AddCarServlet" method="post">
                <div class="row g-3">
                    <div class="col-md-4">
                        <input type="text" name="model" class="form-control" placeholder="Car Model" required>
                    </div>
                    <div class="col-md-4">
                        <input type="text" name="plateNumber" class="form-control" placeholder="Plate Number" required>
                    </div>
                    <div class="col-md-3">
                        <select name="status" class="form-select">
                            <option value="Available">Available</option>
                            <option value="Unavailable">Unavailable</option>
                        </select>
                    </div>
                    <div class="col-md-1">
                        <button type="submit" class="btn btn-primary w-100">+</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="table-responsive">
            <table class="table table-hover mt-4">
                <thead>
                    <tr>
                        <th>Car ID</th>
                        <th>Model</th>
                        <th>Plate Number</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Car car : cars) { %>
                    <tr>
                        <td><%= car.getCarID() %></td>
                        <td><%= car.getModel() %></td>
                        <td><%= car.getPlateNumber() %></td>
                        <td>
                            <span class="status-badge <%= car.getStatus().equals("Available") ? "available" : "unavailable" %>">
                                <%= car.getStatus() %>
                            </span>
                        </td>
                        <td>
                            <a href="UpdateCar.jsp?id=<%= car.getCarID() %>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="DeleteCarServlet?id=<%= car.getCarID() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
