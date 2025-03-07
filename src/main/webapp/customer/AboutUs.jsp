<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MegaCityCab - Your Ride, Your Way</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/customer/about.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
    <!-- Main Hero Section -->
    <header class="hero">
        <div class="hero-content">
            <h1 class="brand-name">Mega<span class="highlight">City</span>Cab</h1>
            <p class="slogan">Ride with comfort, travel with trust.</p>
            <a href="#services" class="cta-btn">Explore Our Services</a>
        </div>
        <img src="<%= request.getContextPath() %>/component/pictures/car4.jpg" alt="Hero Image" class="hero-img">
    </header>

    <!-- Services Section -->
    <section id="services" class="services">
        <h2>Our Services</h2>
        <div class="services-container">
            <div class="service-card">
                <i class="fas fa-car-side"></i>
                <h3>City Rides</h3>
                <p>Fast, reliable rides across the city with top-rated drivers.</p>
            </div>
            <div class="service-card">
                <i class="fas fa-shuttle-van"></i>
                <h3>Airport Transfers</h3>
                <p>Stress-free transfers to and from the airport with ease.</p>
            </div>
            <div class="service-card">
                <i class="fas fa-people-carry"></i>
                <h3>Group Travel</h3>
                <p>Comfortable rides for groups with enough space for everyone.</p>
            </div>
        </div>
    </section>

    <!-- Why Choose Us? Section -->
    <section class="why-choose-us">
        <h2>Why Choose MegaCityCab?</h2>
        <div class="benefits-container">
            <div class="benefit-card">
                <i class="fas fa-tachometer-alt"></i>
                <h3>Fast & Efficient</h3>
                <p>We value your time. Our routes are optimized for the quickest rides.</p>
            </div>
            <div class="benefit-card">
                <i class="fas fa-lock"></i>
                <h3>Safe & Secure</h3>
                <p>Travel with peace of mind with our background-checked drivers.</p>
            </div>
            <div class="benefit-card">
                <i class="fas fa-star"></i>
                <h3>Customer-Centered</h3>
                <p>Your satisfaction is our priority. We're committed to serving you better.</p>
            </div>
        </div>
    </section>

    <!-- Testimonial Section -->
    <section class="testimonials">
        <h2>What Our Riders Say</h2>
        <div class="testimonial-container">
            <div class="testimonial-card">
                <p>"The best cab service I've ever used. Always on time and affordable!"</p>
                <footer>John Dason.</footer>
            </div>
            <div class="testimonial-card">
                <p>"The ride was so smooth, and the driver was very professional. Highly recommend!"</p>
                <footer>Sarah Deron.</footer>
            </div>
            <div class="testimonial-card">
                <p>"Affordable and reliable. I trust MegaCityCab for all my rides."</p>
                <footer>Amith.</footer>
            </div>
        </div>
    </section>

    <!-- Contact Us Section with Image Inside -->
    <section class="contact">
        <h2>Get in Touch</h2>
        <div class="contact-form-container">
            <!-- Image Added Here -->
            <div class="contact-image">
                <img src="<%= request.getContextPath() %>/component/pictures/bg_2.png" alt="Contact Background" class="contact-image-img">
            </div>
            
            <form action="<%= request.getContextPath() %>/ContactServlet" method="post">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <textarea name="message" placeholder="Your Message" required></textarea>
                <button type="submit" class="cta-btn">Send Message</button>
            </form>
        </div>
    </section>

    <%@ include file="footer.jsp" %>

</body>
</html>
