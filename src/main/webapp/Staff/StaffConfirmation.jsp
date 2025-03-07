<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List"%>
<%@ page import="com.model.customer.Booking"%>
<%@ page import="com.dao.customer.BookingDAO"%>
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
    <title>Confirm Bookings - Staff Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/Staff/booking.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="main-content">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Confirm Bookings</h2>

        <div class="table-responsive">
            <table class="table table-striped table-bordered align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Order No</th>
                        <th>Customer Name</th>
                        <th>Telephone</th>
                        <th>Location</th>
                        <th>Date/Time</th>
                        <th>Car Type</th>
                        <th>Status</th>
                        <th>Distance (km)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        BookingDAO bookingDAO = new BookingDAO();
                        List<Booking> pendingBookings = bookingDAO.getPendingBookings();
                        for (Booking booking : pendingBookings) {
                    %>
                    <tr>
                        <td><%= booking.getOrderNumber() %></td>
                        <td><%= booking.getCustomerName() %></td>
                        <td><%= booking.getTelephone() %></td>
                        <td>
                            <button class="btn btn-info btn-sm" onclick="showLocation('<%= booking.getPickupLocation() %>', '<%= booking.getDestination() %>')">
                                See More
                            </button>
                        </td>
                        <td><%= booking.getPickupDateTime() %></td>
                        <td><%= booking.getCarType() %></td>
                        <td>
                            <span class="badge bg-warning text-dark"><%= booking.getStatus() %></span>
                        </td>
                        <td><%= booking.getDistance() %> KM</td>
                        <td>
                            <div class="action-buttons">
                                <form action="<%= request.getContextPath() %>/Staff/ConfirmBookingServlet" method="POST">
                                    <input type="hidden" name="orderNumber" value="<%= booking.getOrderNumber() %>">
                                    <button type="submit" class="btn btn-success action-btn">Confirm</button>
                                </form>
                                <form action="<%= request.getContextPath() %>/Staff/RejectBookingServlet" method="POST">
                                    <input type="hidden" name="orderNumber" value="<%= booking.getOrderNumber() %>">
                                    <button type="submit" class="btn btn-danger action-btn"
                                            onclick="return confirm('Are you sure you want to reject this booking?');">
                                        Reject
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal for Showing Pickup and Destination -->
<div class="modal fade" id="locationModal" tabindex="-1" aria-labelledby="locationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="locationModalLabel">Location Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><strong>Pickup Location:</strong> <span id="pickupLocation"></span></p>
                <p><strong>Destination:</strong> <span id="destination"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function showLocation(pickup, destination) {
        document.getElementById('pickupLocation').innerText = pickup;
        document.getElementById('destination').innerText = destination;
        new bootstrap.Modal(document.getElementById('locationModal')).show();
    }
</script>

</body>
</html>
