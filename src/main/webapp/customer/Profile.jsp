<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.model.User" %>
<%@ page import="com.dao.UserDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession userSession = request.getSession(false);
    String userId = (userSession != null) ? (String) userSession.getAttribute("userId") : null;

    if (userId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp"); 
        return;
    }
%>

<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Main_css/customer/profile.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
</head>
<body>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    User loggedInUser = (User) sessionObj.getAttribute("user");
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getCustomerById(loggedInUser.getUserId());

    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>

<div class="profile-container">
    <% if ("1".equals(success)) { %>
        <div class="alert alert-success text-center">Profile updated successfully!</div>
    <% } else if ("1".equals(error)) { %>
        <div class="alert alert-danger text-center">Failed to update profile. Please try again!</div>
    <% } %>

    <div class="profile-box">
        <div class="profile-header">
            <div class="avatar">
                <i class="fas fa-user-circle"></i>
            </div>
            <h2><%= user.getName() %></h2>
            <p class="email"><%= user.getEmail() %></p>
        </div>

        <div class="profile-details">
            <p><i class="fas fa-phone"></i> <strong>Phone:</strong> <%= user.getPhone() %></p>
            <p><i class="fas fa-id-card"></i> <strong>NIC:</strong> <%= user.getNic() %></p>
            <p><i class="fas fa-map-marker-alt"></i> <strong>Address:</strong> <%= user.getAddress() %></p>

            <button class="btn btn-primary edit-btn" onclick="toggleForm()">Edit Profile</button>
        </div>
    </div>

    <div class="profile-box hidden-form" id="editForm">
        <h3>Edit Profile</h3>
        <form action="UpdateProfileServlet" method="post">
            <input type="hidden" name="userId" value="<%= user.getUserId() %>">

            <div class="input-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" value="<%= user.getName() %>" required>
            </div>

            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
            </div>

            <div class="input-group">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" value="<%= user.getPhone() %>" required>
            </div>

            <div class="input-group">
                <label for="nic">NIC</label>
                <input type="text" id="nic" name="nic" value="<%= user.getNic() %>" required>
            </div>

            <div class="input-group">
                <label for="address">Address</label>
                <textarea id="address" name="address" rows="3" required><%= user.getAddress() %></textarea>
            </div>

            <button type="submit" class="btn btn-success">Save Changes</button>
            <button type="button" class="btn btn-secondary" onclick="toggleForm()">Cancel</button>
        </form>
    </div>
</div>

<script>
    function toggleForm() {
        document.getElementById('editForm').classList.toggle('hidden-form');
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<%@ include file="footer.jsp" %>

</body>
</html>
