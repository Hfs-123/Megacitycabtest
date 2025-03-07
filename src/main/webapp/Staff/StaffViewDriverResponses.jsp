<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.dao.customer.BookingDAO" %>
<%@ page import="com.model.customer.Booking" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    String StaffId = (sessionObj != null) ? (String) sessionObj.getAttribute("StaffId") : null;

    if (StaffId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<%
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> driverResponses = bookingDAO.getAllDriverResponses();
    List<Booking> driverAvailability = bookingDAO.getAllDriversAvailability();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Driver Responses & Availability</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/Staff/driver_responses.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="main-container">
    <h2 class="page-title">Driver Responses</h2>

    <div class="cards-container">
        <%
            if (driverResponses.isEmpty()) {
        %>
            <p class="no-data-message">No responses yet.</p>
        <%
            } else {
                for (Booking booking : driverResponses) {
        %>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Order #: <%= booking.getOrderNumber() %></h5>
                    <p><strong>Driver:</strong> <%= booking.getDriverName() %> (ID: <%= booking.getDriverId() %>)</p>
                    <p><strong>Response:</strong> <%= booking.getDriverResponse() != null ? booking.getDriverResponse() : "Pending" %></p>
                    <p><strong>Payment:</strong> 
                        <%
                            if ("Completed".equals(booking.getDriverResponse())) {
                                if ("Cash".equals(booking.getPaymentMethod())) {
                                    out.print("Cashed Out");
                                } else if ("Card".equals(booking.getPaymentMethod())) {
                                    out.print("Online Pay");
                                } else {
                                    out.print("Payment Not Recorded");
                                }
                            } else {
                                out.print("-");
                            }
                        %>
                    </p>
                </div>
            </div>
        <%
                }
            }
        %>
    </div>
</div>

<div class="main-container">
    <h2 class="page-title">Driver Availability</h2>

    <div class="cards-container">
        <%
            if (driverAvailability.isEmpty()) {
        %>
            <p class="no-data-message">No drivers available.</p>
        <%
            } else {
                for (Booking booking : driverAvailability) {
        %>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Driver: <%= booking.getDriverName() %></h5>
                    <p><strong>Employee ID:</strong> <%= booking.getDriverId() %></p>
                    <p><strong>Email:</strong> <%= booking.getDriverEmail() %></p>
                    <p><strong>Status:</strong> <%= booking.getDriverStatus() != null ? booking.getDriverStatus() : "N/A" %></p>
                </div>
            </div>
        <%
                }
            }
        %>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
