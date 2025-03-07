<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.admin.EmployeeDAO, com.dao.customer.BookingDAO" %>
<%@ page import="com.model.admin.Employee, com.model.customer.Booking" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ include file="header.jsp" %>

<%
    HttpSession sessionObj = request.getSession(false);
    String StaffId = (sessionObj != null) ? (String) sessionObj.getAttribute("StaffId") : null;

    if (StaffId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Assign Driver</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/Staff/assignDriver.css">
</head>
<body>

<div class="main-container">
    <div class="content">
        <h2>Assign Driver</h2>

        <!-- Input Fields -->
        <div class="input-section">
            <div class="input-group">
                <label for="driverId">Driver Employee ID</label>
                <input type="text" id="driverId" placeholder="">
            </div>
            <div class="input-group">
                <label for="orderNumber">Order Number</label>
                <input type="text" id="orderNumber" placeholder="">
            </div>
            <button class="btn-search" onclick="getDetails()">Get Details</button>
        </div>

        <!-- Details Cards -->
        <div class="card-container">
            <!-- Driver Details -->
            <div class="card hidden" id="driverDetails">
                <h4>Driver Information</h4>
                <p><strong>Name:</strong> <span id="driverName"></span></p>
                <p><strong>Email:</strong> <span id="driverEmail"></span></p>
            </div>

            <!-- Booking Details -->
            <div class="card hidden" id="bookingDetails">
                <h4>Booking Information</h4>
                <p><strong>Customer:</strong> <span id="customerName"></span></p>
                <p><strong>Address:</strong> <span id="address"></span></p>
                <p><strong>Phone:</strong> <span id="telephone"></span></p>
                <p><strong>Pickup:</strong> <span id="pickupLocation"></span></p>
                <p><strong>Destination:</strong> <span id="destination"></span></p>
                <p><strong>Time:</strong> <span id="pickupDatetime"></span></p>
            </div>
        </div>

        <!-- Assign Button -->
        <form action="<%= request.getContextPath() %>/Staff/AssignDriverServlet" method="post">
            <input type="hidden" name="driverId" id="hiddenDriverId">
            <input type="hidden" name="orderNumber" id="hiddenOrderNumber">
            <button type="submit" class="btn-assign hidden" id="assignBtn">Assign Driver</button>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
function getDetails() {
    const driverId = document.getElementById('driverId').value.trim();
    const orderNumber = document.getElementById('orderNumber').value.trim();

    if (!driverId || !orderNumber) {
        alert("Please enter both Driver Employee ID and Order Number.");
        return;
    }

    Promise.all([
        fetch('<%= request.getContextPath() %>/Staff/FetchDriverServlet?driverId=' + driverId).then(res => res.json()),
        fetch('<%= request.getContextPath() %>/Staff/FetchBookingServlet?orderNumber=' + orderNumber).then(res => res.json())
    ])
    .then(([driverData, bookingData]) => {
        let driverFound = false, bookingFound = false;

        if (driverData && driverData.username) {
            document.getElementById('driverName').textContent = driverData.username;
            document.getElementById('driverEmail').textContent = driverData.email;
            document.getElementById('driverDetails').classList.remove('hidden');
            document.getElementById('hiddenDriverId').value = driverId;
            driverFound = true;
        }

        if (bookingData && bookingData.customerName) {
            document.getElementById('customerName').textContent = bookingData.customerName;
            document.getElementById('address').textContent = bookingData.address || 'N/A';
            document.getElementById('telephone').textContent = bookingData.telephone || 'N/A';
            document.getElementById('pickupLocation').textContent = bookingData.pickupLocation;
            document.getElementById('destination').textContent = bookingData.destination;
            document.getElementById('pickupDatetime').textContent = bookingData.pickupDatetime;
            document.getElementById('bookingDetails').classList.remove('hidden');
            document.getElementById('hiddenOrderNumber').value = orderNumber;
            bookingFound = true;
        }

        document.getElementById('assignBtn').classList.toggle('hidden', !(driverFound && bookingFound));
    })
    .catch(() => alert("Failed to fetch details. Please try again."));
}
</script>

</body>
</html>
