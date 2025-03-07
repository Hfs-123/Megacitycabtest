<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.customer.BillingDAO, com.dao.admin.RateDAO, com.dao.customer.BookingDAO, com.model.admin.FareRate, com.model.customer.Billing, com.model.customer.Booking, java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>

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
    <title>Generate Bill - Staff</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/Staff/generateBill.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="main-content">
    <div class="container">
        <h2 class="text-center">Generate Customer Bill</h2>

        <!-- Search Form -->
        <form method="get" action="generateBill.jsp" class="search-form">
            <div class="mb-3">
                <label for="orderNumber" class="form-label">Enter Order Number:</label>
                <input type="text" class="form-control" name="orderNumber" required>
            </div>
            <button type="submit" class="btn btn-primary">Search Booking</button>
        </form>

        <%
            String orderNumber = request.getParameter("orderNumber");
            Booking booking = null;

            if (orderNumber != null && !orderNumber.isEmpty()) {
                BookingDAO bookingDAO = new BookingDAO();
                booking = bookingDAO.getBookingByOrderNumber(orderNumber);

                if (booking != null) {
        %>

        <!-- Booking Details Card -->
        <div class="booking-card mt-4">
            <h4>Booking Details</h4>
            <table class="table">
                <tr><th>Order Number</th><td><%= booking.getOrderNumber() %></td></tr>
                <tr><th>Customer Name</th><td><%= booking.getCustomerName() %></td></tr>
                <tr><th>Distance</th><td><%= booking.getDistance() %> km</td></tr>
                <tr><th>Date/Time</th><td><%= booking.getPickupDateTime() %></td></tr>
                <tr><th>Car Type</th><td><%= booking.getCarType() %></td></tr>
                <tr>
                    <th>Location</th>
                    <td>
                        <button class="btn btn-info" onclick="showDetails('<%= booking.getPickupLocation() %>', '<%= booking.getDestination() %>')">See More</button>
                    </td>
                </tr>
            </table>

            <!-- Generate Bill Form -->
            <form method="post" action="GenerateBillServlet" class="generate-bill-form">
                <input type="hidden" name="orderNumber" value="<%= booking.getOrderNumber() %>">

                <div class="mb-3">
                    <label for="fareId" class="form-label">Select Fare ID:</label>
                    <select class="form-control" name="fareId" required>
                        <%
                            RateDAO RateDAO = new RateDAO();
                            List<FareRate> fareRates = RateDAO.getAllFareRates();
                            for (FareRate fare : fareRates) {
                        %>
                        <option value="<%= fare.getId() %>">
                            <%= fare.getCarType() %> - Base: $<%= fare.getBaseFare() %>, Per Km: $<%= fare.getPerKmRate() %>
                        </option>
                        <% } %>
                    </select>
                </div>

                <button type="submit" class="btn btn-success">Generate Bill</button>
            </form>
        </div>

        <% 
                } else { 
        %>
            <p class="text-danger text-center">No booking found for Order Number: <%= orderNumber %></p>
        <%
                }
            }
        %>
    </div>
</div>

<!-- Modal for Pickup Location & Destination -->
<div class="modal fade" id="locationModal" tabindex="-1" aria-labelledby="locationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="locationModalLabel">Booking Locations</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><strong>Pickup Location:</strong> <span id="pickup"></span></p>
                <p><strong>Destination:</strong> <span id="destination"></span></p>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    function showDetails(pickup, destination) {
        document.getElementById('pickup').innerText = pickup;
        document.getElementById('destination').innerText = destination;
        new bootstrap.Modal(document.getElementById('locationModal')).show();
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
