<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.admin.EmployeeDAO" %>
<%@ page session="true" %>
<%
    
    String adminId = (String) session.getAttribute("adminId");

    if (adminId == null) {
       
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<%
    
    EmployeeDAO dao = new EmployeeDAO();
    String nextEmployeeID = dao.generateNextEmployeeID(); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Employee</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all_css/admin/register.css">
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
    <h2 class="text-center my-4">Register Employee</h2>

    <form action="<%= request.getContextPath() %>/admin/RegisterEmployeeServlet" method="post">
        <div class="mb-3">
            <label>Employee ID:</label>
            <input type="text" name="employeeID" class="form-control" value="<%= nextEmployeeID %>" readonly>
        </div>
        <div class="mb-3">
            <label>Username:</label>
            <input type="text" name="username" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Password:</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Email:</label>
            <input type="email" name="email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Role:</label>
            <select name="role" class="form-control">
                <option value="Admin">Admin</option>
                <option value="Manager">Manager</option>
                <option value="Driver">Driver</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Register Employee</button>
        <a href="EmployeeSection.jsp" class="btn btn-secondary">Back</a>
    </form>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>
