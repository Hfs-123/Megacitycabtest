<%@ page import="com.dao.admin.EmployeeDAO, com.model.admin.Employee" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%
    
    String adminId = (String) session.getAttribute("adminId");

    if (adminId == null) {
      
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>


<%
    String employeeId = request.getParameter("id");
    EmployeeDAO dao = new EmployeeDAO();
    Employee employee = dao.getEmployeeById(employeeId);

    if (employee == null) {
        response.sendRedirect("Employee.jsp"); 
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/admin/Edit.css">
</head>
<body>
<%@ include file="header.jsp" %>

    <div class="container">
        <h2>Edit Employee</h2>
        
        <form action="<%= request.getContextPath() %>/Admin/EditEmployeeServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Employee ID:</label>
                <input type="text" class="form-control" name="employeeId" value="<%= employee.getEmployeeID() %>" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">Username:</label>
                <input type="text" class="form-control" name="username" value="<%= employee.getUsername() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password:</label>
                <input type="password" class="form-control" name="password" value="<%= employee.getPassword() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email:</label>
                <input type="email" class="form-control" name="email" value="<%= employee.getEmail() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Role:</label>
                <select class="form-select" name="role" required>
                    <option value="Admin" <%= employee.getRole().equals("Admin") ? "selected" : "" %>>Admin</option>
                    <option value="Staff" <%= employee.getRole().equals("Staff") ? "selected" : "" %>>Staff</option>
                    <option value="Driver" <%= employee.getRole().equals("Driver") ? "selected" : "" %>>Driver</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Update Employee</button>
            <a href="Employee.jsp" class="btn btn-secondary">Back</a>
        </form>
    </div>
    <%@ include file="footer.jsp" %>

</body>
</html>
