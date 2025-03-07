<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.dao.admin.EmployeeDAO" %>
<%@ page import="com.dao.admin.CarDAO" %>
<%@ page import="com.model.admin.Employee" %>
<%@ page import="com.model.admin.Car" %>
<%@ page session="true" %>

<%
    String adminId = (String) session.getAttribute("adminId");
    if (adminId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<%
    String employeeId = request.getParameter("employeeId");
    String carIdStr = request.getParameter("carId");

    Employee employee = null;
    Car car = null;

    if (employeeId != null && carIdStr != null) {
        EmployeeDAO employeeDAO = new EmployeeDAO();
        CarDAO carDAO = new CarDAO();

        employee = employeeDAO.findEmployeeById(employeeId);
        car = carDAO.findCarById(carIdStr);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Assign Car to Driver</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/admin/assignCar.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <h2 class="title">Assign Car to Driver</h2>

    <div class="form-section">
        <form method="get">
            <div class="input-group">
                <label for="employeeId">Employee ID:</label>
                <input type="text" id="employeeId" name="employeeId" placeholder="Type here" required>
            </div>

            <div class="input-group">
                <label for="carId">Car ID:</label>
                <input type="text" id="carId" name="carId" placeholder="Type here" required>
            </div>

            <button type="submit" class="btn-submit">Get Details</button>
        </form>
    </div>

    <% if (employee != null) { %>
        <div class="info-card">
            <h3>Employee Details</h3>
            <p><strong>Employee ID:</strong> <%= employee.getEmployeeID() %></p>
            <p><strong>Username:</strong> <%= employee.getUsername() %></p>
            <p><strong>Email:</strong> <%= employee.getEmail() %></p>
        </div>
    <% } else if (employeeId != null) { %>
        <div class="alert">No employee found with ID: <%= employeeId %></div>
    <% } %>

    <% if (car != null) { %>
        <div class="info-card">
            <h3>Car Details</h3>
            <p><strong>Car ID:</strong> <%= car.getCarID() %></p>
            <p><strong>Model:</strong> <%= car.getModel() %></p>
            <p><strong>Plate Number:</strong> <%= car.getPlateNumber() %></p>
            <p><strong>Status:</strong> <%= car.getStatus() %></p>
        </div>
    <% } else if (carIdStr != null) { %>
        <div class="alert">No car found with ID: <%= carIdStr %></div>
    <% } %>

    <% if (employee != null && car != null) { %>
        <form method="post" action="<%= request.getContextPath() %>/AssignCarServlet">
            <input type="hidden" name="employeeId" value="<%= employee.getEmployeeID() %>">
            <input type="hidden" name="carId" value="<%= car.getCarID() %>">
            <button type="submit" class="btn-assign">Assign Car</button>
        </form>
    <% } %>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
