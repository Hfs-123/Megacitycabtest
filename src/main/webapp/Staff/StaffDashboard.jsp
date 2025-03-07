<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false); // Don't create a new session if none exists
    String StaffId = (sessionObj != null) ? (String) sessionObj.getAttribute("StaffId") : null;

    if (StaffId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp"); // Redirect to login if not logged in
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/Staff/dashboard.css">
</head>
<body>

<%@ include file="header.jsp" %>

<main class="dashboard-container">
    <div class="container">
        <h1 class="dashboard-title">Welcome to the Staff Dashboard</h1>
        <div class="row justify-content-center">
            <!-- Booking Management -->
            <div class="col-md-4 mb-4">
                <a href="StaffConfirmation.jsp" class="dashboard-card">
                    <div class="card custom-card shadow-lg">
                        <div class="card-body">
                            <h5 class="card-title">Booking Management</h5>
                            <p class="card-text">Manage and view all customer bookings</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Billing Management -->
            <div class="col-md-4 mb-4">
                <a href="generateBill.jsp" class="dashboard-card">
                    <div class="card custom-card shadow-lg">
                        <div class="card-body">
                            <h5 class="card-title">Billing Management</h5>
                            <p class="card-text">Set and manage Billing for services</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Fare Management -->
            <div class="col-md-4 mb-4">
                <a href="FareRatesStaff.jsp" class="dashboard-card">
                    <div class="card custom-card shadow-lg">
                        <div class="card-body">
                            <h5 class="card-title">Fare Management</h5>
                            <p class="card-text">Adjust and update fare rates for rides</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Car Management -->
            <div class="col-md-4 mb-4">
                <a href="AssignDriver.jsp" class="dashboard-card">
                    <div class="card custom-card shadow-lg">
                        <div class="card-body">
                            <h5 class="card-title">Assign Driver</h5>
                            <p class="card-text">Assign drivers to vehicles and bookings</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Pending Bills -->
            <div class="col-md-4 mb-4">
                <a href="confirmBill.jsp" class="dashboard-card">
                    <div class="card custom-card shadow-lg">
                        <div class="card-body">
                            <h5 class="card-title">Pending Bills</h5>
                            <p class="card-text">Manage and review all pending bills</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Driver Responses -->
            <div class="col-md-4 mb-4">
                <a href="StaffViewDriverResponses.jsp" class="dashboard-card">
                    <div class="card custom-card shadow-lg">
                        <div class="card-body">
                            <h5 class="card-title">Driver Responses</h5>
                            <p class="card-text">View responses from drivers for requests</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Cancelled Bookings -->
            <div class="col-md-4 mb-4">
                <a href="CancelledBookings.jsp" class="dashboard-card">
                    <div class="card custom-card shadow-lg">
                        <div class="card-body">
                            <h5 class="card-title">Cancelled Bookings</h5>
                            <p class="card-text">Manage all cancelled bookings</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Confirmed Bookings -->
            <div class="col-md-4 mb-4">
                <a href="ConfirmedBookings.jsp" class="dashboard-card">
                    <div class="card custom-card shadow-lg">
                        <div class="card-body">
                            <h5 class="card-title">Confirmed Bookings</h5>
                            <p class="card-text">View and manage confirmed bookings</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>
