<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.dao.admin.EmployeeDAO" %>
<%@ page session="true" %>
<%
    String adminId = (String) session.getAttribute("adminId");

    if (adminId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    EmployeeDAO dao = new EmployeeDAO();
    String nextEmployeeID = dao.generateNextEmployeeID(); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Employee</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/admin/register.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <div class="register-card">
        <h2>Register Employee</h2>
        <p class="sub-text">Fill in the details to add a new employee.</p>

        <form action="<%= request.getContextPath() %>/Admin/RegisterEmployeeServlet" method="post">
            <div class="input-group">
                <label>Employee ID:</label>
                <input type="text" name="employeeID" value="<%= nextEmployeeID %>" readonly>
            </div>

            <div class="input-group">
                <label>Username:</label>
                <input type="text" name="username" required>
            </div>

            <div class="input-group">
                <label>Password:</label>
                <input type="password" name="password" required>
            </div>

            <div class="input-group">
                <label>Email:</label>
                <input type="email" name="email" required>
            </div>

            <div class="input-group">
                <label>Role:</label>
                <select name="role">
                    <option value="Admin">Admin</option>
                    <option value="Staff">Staff</option>
                    <option value="Driver">Driver</option>
                </select>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn-primary">Register Employee</button>
                <a href="Employee.jsp" class="btn-secondary">Back</a>
            </div>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
