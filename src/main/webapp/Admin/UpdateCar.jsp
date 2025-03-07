<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.admin.Car" %>
<%@ page import="com.dao.admin.CarDAO" %>
<%@ page session="true" %>

<%
 
    String adminId = (String) session.getAttribute("adminId");

    if (adminId == null) {
    
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Car</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/admin/update.css"> <!-- Custom CSS Link -->
</head>
<body>
<%
    String carID = request.getParameter("id");
    CarDAO carDAO = new CarDAO();
    Car car = carDAO.getCarById(carID);
%>


<div class="dashboard-container">
    <h1 class="text-center">Update Car Details</h1>
    
    <form action="UpdateCarServlet" method="post">
        <input type="hidden" name="carID" value="<%= car.getCarID() %>">

  
        <div class="mb-3">
            <label for="model" class="form-label">Model</label>
            <input type="text" name="model" id="model" class="form-control" value="<%= car.getModel() %>" required>
        </div>

     
        <div class="mb-3">
            <label for="plateNumber" class="form-label">Plate Number</label>
            <input type="text" name="plateNumber" id="plateNumber" class="form-control" value="<%= car.getPlateNumber() %>" required>
        </div>


        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select name="status" id="status" class="form-select">
                <option value="Available" <%= car.getStatus().equals("Available") ? "selected" : "" %>>Available</option>
                <option value="Unavailable" <%= car.getStatus().equals("Unavailable") ? "selected" : "" %>>Unavailable</option>
            </select>
        </div>

     
        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary w-48">Update Car</button>
            <a href="Car.jsp" class="btn btn-secondary w-48 text-center">Cancel</a>
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
