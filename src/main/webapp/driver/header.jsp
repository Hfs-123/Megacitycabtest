<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/driver/header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
    <header class="header">
        <!-- Logo & Branding -->
        <div class="logo-container">
            <img src="<%= request.getContextPath() %>/component/driver.png" alt="MegaCityCab Logo" class="logo">
            <h1 class="brand-name">
                <span class="blue-text">Mega</span><span class="orange-text">City</span><span class="blue-text">Cab</span>
                <span class="orange-text">| Driver</span> <span class="blue-text">Dashboard</span>
            </h1>
        </div>

        <!-- Navigation Links -->
        <nav class="nav-links">
            <a href="<%= request.getContextPath() %>/driver/driverDashboard.jsp" class="nav-item"><i class="fas fa-home"></i> Home</a>
            <a href="<%= request.getContextPath() %>/driver/driverProfile.jsp" class="nav-item"><i class="fas fa-user"></i>Profile</a>
            <a href="<%= request.getContextPath() %>/driver/driverViewAssignedBooking.jsp" class="nav-item"><i class="fas fa-taxi"></i>Rides</a>
            <a href="<%= request.getContextPath() %>/driver/driverViewCarDetails.jsp" class="nav-item"><i class="fas fa-car"></i>Car Details</a>
        </nav>

        <!-- Profile & Logout Icons -->
        <div class="nav-icons">
            <a href="<%= request.getContextPath() %>/driver/driverProfile.jsp" class="profile-icon" title="Profile">
                <i class="fas fa-user"></i>
            </a>
            <a href="<%= request.getContextPath() %>/landing.jsp" class="exit-icon" title="Logout">
                <i class="fas fa-sign-out-alt"></i>
            </a>
        </div>
    </header>
</body>
</html>
