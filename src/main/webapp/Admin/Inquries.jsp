<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.dao.customer.InquiryDAO" %>
<%@ page import="com.model.customer.Inquiry" %>
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
    <title>Reply to Inquiry</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/Main_css/admin/Inquire.css" rel="stylesheet"> <!-- Custom CSS Link -->
</head>
<body>
<%
    String inquiryId = request.getParameter("inquiryId");
    InquiryDAO inquiryDAO = new InquiryDAO();
    Inquiry inquiry = inquiryDAO.getInquiryById(Integer.parseInt(inquiryId));
%>

<div class="container reply-container">
    <div class="inquiry-details">
        <h2 class="text-center">Reply to Inquiry</h2>
        <div class="inquiry-card">
            <p><strong>From:</strong> <%= inquiry.getName() %> (<%= inquiry.getEmail() %>)</p>
            <p><strong>Subject:</strong> <%= inquiry.getSubject() %></p>
            <p><strong>Message:</strong> <%= inquiry.getMessage() %></p>
        </div>
    </div>

    <!-- Reply Form -->
    <form action="SendReplyServlet" method="post" class="reply-form">
        <input type="hidden" name="inquiryId" value="<%= inquiry.getInquiryId() %>">

        <div class="form-group">
            <label for="reply">Your Reply</label>
            <textarea class="form-control" id="reply" name="reply" rows="5" required placeholder="Write your reply here..."></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Send Reply</button>
    </form>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
