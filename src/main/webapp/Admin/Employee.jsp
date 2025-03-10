<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.model.admin.Employee,com.dao.admin.EmployeeDAO" %>
<%@ page session="true" %>

<%
    String adminId = (String) session.getAttribute("adminId");

    if (adminId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/admin/employee.css">
</head>
<body>
<%@ include file="header.jsp" %>

<div class="employee-management-container">
    <div class="header">
        <h2 class="page-title">Employee Management</h2>
        <a href="Addregister.jsp" class="btn btn-primary add-employee-btn">Add</a>
    </div>

    <div class="employee-table-container">
        <table class="employee-table">
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    EmployeeDAO employeeDAO = new EmployeeDAO();
                    List<Employee> employees = employeeDAO.getAllEmployees();
                    for (Employee emp : employees) {
                %>
                <tr>
                    <td><%= emp.getEmployeeID() %></td>
                    <td><%= emp.getUsername() %></td>
                    <td><%= emp.getEmail() %></td>
                    <td><%= emp.getRole() %></td>
                    <td class="action-buttons">
                        <a href="EditUsers.jsp?id=<%= emp.getEmployeeID() %>" class="edit-btn">Edit</a>
                        <a href="DeleteEmployeeServlet?id=<%= emp.getEmployeeID() %>" class="delete-btn" onclick="return confirm('Are you sure?');">Delete</a>
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
