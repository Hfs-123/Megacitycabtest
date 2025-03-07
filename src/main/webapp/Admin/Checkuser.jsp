<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.model.User"%>
<%@ page import="com.dao.UserDAO"%>
<%@ page session="true" %>

<%
    String adminId = (String) session.getAttribute("adminId");
    if (adminId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    UserDAO userDAO = new UserDAO();
    List<User> customers = userDAO.getAllCustomers();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Accounts</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/admin/accounts.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="main-container">
    <h1 class="page-title">Customer Accounts</h1>
    
    <div class="card-container">
        <% for (User customer : customers) { %>
            <div class="customer-card">
                <div class="card-header">
                    <h2><%= customer.getName() %></h2>
                    <span class="status <%= "Customer".equals(customer.getRole()) ? "active" : "inactive" %>">
                        <%= "Customer".equals(customer.getRole()) ? "Active" : "Deactivated" %>
                    </span>
                </div>
                <div class="card-body">
                    <p><strong>Email:</strong> <%= customer.getEmail() %></p>
                    <p><strong>Phone:</strong> <%= customer.getPhone() %></p>
                    <p><strong>Address:</strong> <%= customer.getAddress() != null ? customer.getAddress() : "N/A" %></p>
                </div>
                <div class="card-footer">
                    <% if ("Customer".equals(customer.getRole())) { %>
                        <a href="DeactivateCustomerServlet?id=<%= customer.getUserId() %>" class="btn btn-warning">Deactivate</a>
                    <% } else { %>
                        <span class="disabled-text">Deactivated</span>
                    <% } %>
                </div>
            </div>
        <% } %>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
