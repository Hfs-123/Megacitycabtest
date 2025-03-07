 <%@ page language="java" contentType="text/html; charset=UTF-8" %> 
<%@ page import="com.dao.customer.BookingDAO" %>
<%@ page import="com.model.customer.Booking" %>
<%@ page import="java.util.List" %>

<% 
 
    String driverId = (String) session.getAttribute("driverId");

   
    if (driverId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }


    BookingDAO ReseravtionDAO = new BookingDAO();
    List<Booking> assignedBookings = ReseravtionDAO.getBookingsByDriverId(driverId);

  
    String statusUpdated = request.getParameter("statusUpdated");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Assigned Bookings</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/driver/view.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h2 class="text-center mb-4 text-primary">My Assigned Bookings</h2>

    <%
    if ("true".equals(statusUpdated)) {
    %>
        <div class="alert alert-success text-center">Availability status updated successfully!</div>
    <%
    } else if ("false".equals(statusUpdated)) {
    %>
        <div class="alert alert-danger text-center">Failed to update availability status. Please try again.</div>
    <%
    }
    %>


    <%
    if (assignedBookings.isEmpty()) {
    %>
        <p class="text-center text-danger">No bookings assigned yet.</p>
    <%
    } else {
    %>
        <div class="table-responsive">
            <table class="table table-hover table-striped table-bordered">
                <thead class="table-light">
                    <tr>
                        <th>Order Number</th>
                        <th>Customer Name</th>
                        <th>Pickup Location</th>
                        <th>Destination</th>
                        <th>Pickup Date & Time</th>
                        <th>Action</th>
                        <th>Payment Method</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for (Booking booking : assignedBookings) {
                    %>
                        <tr>
                            <td><%= booking.getOrderNumber() %></td>
                            <td><%= booking.getCustomerName() %></td>
                            <td><%= booking.getPickupLocation() %></td>
                            <td><%= booking.getDestination() %></td>
                            <td><%= booking.getPickupDateTime() != null ? booking.getPickupDateTime() : "N/A" %></td>
                            <td>
                                <form method="post" action="<%= request.getContextPath() %>/DriverResponseServlet" class="d-inline">
                                    <input type="hidden" name="orderNumber" value="<%= booking.getOrderNumber() %>">
                                    <input type="hidden" name="driverId" value="<%= driverId %>">
                                    <button type="submit" name="action" value="accept" class="btn btn-success btn-sm"><i class="fas fa-check"></i> Accept</button>
                                    <button type="submit" name="action" value="decline" class="btn btn-danger btn-sm"><i class="fas fa-times"></i> Decline</button>
                                    <button type="submit" name="action" value="completed" class="btn btn-warning btn-sm"><i class="fas fa-flag-checkered"></i> Completed</button>
                                </form>
                            </td>
                            <td>
                                <% if ("Completed".equals(booking.getDriverResponse())) { %>
                                    <form method="post" action="<%= request.getContextPath() %>/PaymentServlet" class="d-inline">
                                        <input type="hidden" name="orderNumber" value="<%= booking.getOrderNumber() %>">
                                        <input type="hidden" name="driverId" value="<%= driverId %>">
                                        <button type="submit" name="paymentMethod" value="Cash" class="btn btn-outline-success btn-sm"><i class="fas fa-money-bill-wave"></i> Cash</button>
                                        <button type="submit" name="paymentMethod" value="Card" class="btn btn-outline-primary btn-sm"><i class="fas fa-credit-card"></i> Card</button>
                                    </form>
                                <% } else { %>
                                    <span class="text-muted">Complete ride first</span>
                                <% } %>
                            </td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    <%
        }
    %>
</div>


<div class="container mt-5">
    <h3 class="text-center mb-4 text-secondary">Update Availability Status</h3>
    <form method="post" action="<%= request.getContextPath() %>/UpdateDriverStatusServlet">
        <input type="hidden" name="driverId" value="<%= driverId %>">
        <div class="mb-3">
            <label for="status" class="form-label">Select Availability Status:</label>
            <select class="form-select" name="status" id="status" required>
                <option value="Available">Available</option>
                <option value="On a Ride">On a Ride</option>
                <option value="Off Duty">Off Duty</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-sync-alt"></i> Update Status</button>
    </form>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
