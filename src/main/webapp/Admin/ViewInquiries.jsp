<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.dao.customer.InquiryDAO" %> 
<%@ page import="com.model.customer.Inquiry" %> 
<%@ page import="java.util.List" %> <!-- Add this import for List -->
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
    <title>Customer Inquiries</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/admin/inquiries.css"> <!-- Custom CSS -->
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Customer Inquiries</h2>

    <%
        InquiryDAO inquiryDAO = new InquiryDAO();
        List<Inquiry> inquiries = inquiryDAO.getAllInquiries();
    %>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Inquiry ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <% for (Inquiry inquiry : inquiries) { %>
                <tr>
                    <td><%= inquiry.getInquiryId() %></td>
                    <td><%= inquiry.getName() %></td>
                    <td><%= inquiry.getEmail() %></td>
                    <td><%= inquiry.getSubject() %></td>
                    <td><%= inquiry.getStatus() %></td>
                    <td>
                        <a href="Inquries.jsp?inquiryId=<%= inquiry.getInquiryId() %>" class="btn btn-info btn-sm">View & Reply</a>
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
