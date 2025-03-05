<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Main_css/customer/Customerdashboard.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="dashboard-container">
		<div class="dashboard-header">
			<h2>Welcome to MegaCityCab</h2>
			<p>Your one-stop platform for cab bookings and payments.</p>
		</div>

		<div class="dashboard-grid">
			<div class="dashboard-tile">
				<i class="fas fa-taxi tile-icon"></i>
				<h3>Book a Cab</h3>
				<a href="booking.jsp" class="btn btn-primary">Book Now</a>
			</div>

			<div class="dashboard-tile">
				<i class="fas fa-list-alt tile-icon"></i>
				<h3>View Bookings</h3>
				<a href="viewBookings.jsp" class="btn btn-secondary">Manage
					Bookings</a>
			</div>

			<div class="dashboard-tile">
				<i class="fas fa-file-invoice-dollar tile-icon"></i>
				<h3>Billing</h3>
				<a href="billing.jsp" class="btn btn-success">Go to Billing</a>
			</div>

			<div class="dashboard-tile">
				<i class="fas fa-receipt tile-icon"></i>
				<h3>Payment History</h3>
				<a href="paymentHistory.jsp" class="btn btn-info">View History</a>
			</div>

			<div class="dashboard-tile">
				<i class="fas fa-history tile-icon"></i>
				<h3>Booking History</h3>
				<a href="ConfirmedBookings.jsp" class="btn btn-warning">View
					Bookings</a>
			</div>
			<div class="dashboard-tile">
				<i class="fas fa-user-circle tile-icon"></i>
				<h3>View Profile</h3>
				<a href="customerProfile.jsp" class="btn btn-primary">Go to Profile</a>
			</div>

		</div>
	</div>


	<%@ include file="footer.jsp"%>

</body>
</html>