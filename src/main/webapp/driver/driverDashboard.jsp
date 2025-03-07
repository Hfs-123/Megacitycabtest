<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%

    String driverId = (String) session.getAttribute("driverId");

    if (driverId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/driver/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>

<%@ include file="header.jsp" %>

<main class="dashboard-container">
    <div class="container">
        <div class="text-center mb-5">
            <h1 class="dashboard-title">Welcome Back, Driver!</h1>
            <p class="subtitle">Manage your profile, bookings, and car details</p>
        </div>

        <div class="row justify-content-center">
            <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                <a href="driverProfile.jsp" class="dashboard-card">
                    <div class="card shadow-lg rounded profile-card">
                        <div class="card-body">
                            <i class="fas fa-user-circle icon profile-icon"></i>
                            <h5 class="card-title">My Profile</h5>
                            <p class="card-text">Update your personal information and view your details</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                <a href="driverViewAssignedBooking.jsp" class="dashboard-card">
                    <div class="card shadow-lg rounded booking-card">
                        <div class="card-body">
                            <i class="fas fa-calendar-check icon booking-icon"></i>
                            <h5 class="card-title">Assigned Bookings</h5>
                            <p class="card-text">View and manage your upcoming rides and tasks</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                <a href="driverViewCarDetails.jsp" class="dashboard-card">
                    <div class="card shadow-lg rounded car-card">
                        <div class="card-body">
                            <i class="fas fa-car icon car-icon"></i>
                            <h5 class="card-title">My Car Details</h5>
                            <p class="card-text">Check the details of your assigned vehicle and maintenance status</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
