<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MegaCityCab - Your Ride, Your Way</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #eaf6ff, #d0eaff);
            margin: 0;
            padding: 0;
        }

        
        .navbar {
            background: #1a1a2e;
            padding: 15px 0;
        }

        .navbar-brand {
            font-size: 2.5rem;
            font-weight: bold;
            color: #f64c72;
        }

        .nav-link {
            color: #ffffff !important;
            margin: 0 10px;
            font-size: 1.1rem;
        }

        .nav-link:hover {
            color: #f64c72 !important;
        }

        /* Hero Section */
        .hero-section {
            background: linear-gradient(to right, #1a1a2e, #16213e);
            color: #ffffff;
            text-align: center;
            padding: 100px 0;
        }

        .hero-section h1 {
            font-size: 4rem;
            font-weight: bold;
        }

        .hero-section p {
            font-size: 1.2rem;
            margin: 20px 0;
        }

        .btn-custom {
            background: #f64c72;
            color: #ffffff;
            font-size: 1.2rem;
            padding: 12px 40px;
            border: none;
            transition: 0.3s ease-in-out;
            display: inline-block;
            margin-top: 20px;
        }

        .btn-custom:hover {
            background: #ff7b9c;
        }

        /* Car Image with Smooth Shake Animation */
        .car-container {
            text-align: center;
            margin-top: 50px;
        }

        .car-image {
            width: 100%;
            max-width: 400px;
            display: inline-block;
            animation: gentle-shake 4s infinite ease-in-out;
        }
        .btn-custom {
    text-decoration: none;
}
        

        @keyframes gentle-shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-3px) rotate(-1deg); }
            50% { transform: translateX(3px) rotate(1deg); }
            75% { transform: translateX(-3px) rotate(-1deg); }
        }

        /* Booking Section */
        .booking-section {
            background: #f2f8ff;
            padding: 60px 20px;
            border-radius: 50px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            margin-top: -50px;
        }

        .booking-section h3 {
            font-size: 2rem;
            margin-bottom: 30px;
            color: #1a1a2e;
        }

        .form-label {
            font-weight: bold;
            color: #1a1a2e;
        }

        .btn-search {
            background: #1a1a2e;
            color: #ffffff;
            font-weight: bold;
            font-size: 1.1rem;
            padding: 12px 30px;
        }

        .btn-search:hover {
            background: #f64c72;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">MegaCityCab</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link btn-custom" href="<%= request.getContextPath() %>/register.jsp">Sign Up</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <h1>Safe, Fast, and Reliable Rides</h1>
    <p>Experience the comfort and convenience of MegaCityCab. Book your ride in just a few clicks.</p>
    <div class="text-center">
        <a href="<%= request.getContextPath() %>/register.jsp" class="btn-custom">Book Now</a>
    </div>
</section>

<!-- Car Image -->
<div class="car-container">
    <img src="<%= request.getContextPath() %>/component/pictures/car7.png" alt="Luxury Car" class="car-image">
</div>

<!-- Booking Form Section -->
<section class="container booking-section">
    <h3>Book Your Ride</h3>
    <form class="row g-4">
        <div class="col-md-3">
            <label for="location" class="form-label">Location</label>
            <input type="text" class="form-control" id="location" placeholder="Enter your location" required>
        </div>
        <div class="col-md-3">
            <label for="carType" class="form-label">Car Type</label>
            <select class="form-select" id="carType" required>
                <option selected>Choose Car</option>
                <option value="City Car">City Car</option>
                <option value="SUV">SUV</option>
                <option value="Sedan">Sedan</option>
            </select>
        </div>
        <div class="col-md-3">
            <label for="pickUp" class="form-label">Pick Up Date</label>
            <input type="date" class="form-control" id="pickUp" required>
        </div>
        <div class="col-md-3">
            <label for="return" class="form-label">Return Date</label>
            <input type="date" class="form-control" id="return" required>
        </div>
        <div class="col-12 text-center">
            <button type="submit" class="btn btn-search">Search Rides</button>
        </div>
    </form>
</section>

<%@ include file="/customer/footer.jsp" %>

<!-- Bootstrap JS Bundle -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>
