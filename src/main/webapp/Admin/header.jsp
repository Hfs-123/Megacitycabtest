<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/Staff/header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
    <header class="header">
      
        <div class="logo-container">
            <img src="<%= request.getContextPath() %>/component/admin.png" alt="MegaCityCab Logo" class="logo">
            <h1 class="brand-name">
               <span class="white-text">Mega</span><span class="orange-text">City</span><span class="blue-text">Cab</span> 
                <span class="orange-text">| Welcome</span> <span class="blue-text">Back</span>
                
            </h1>
        </div>

      
        <nav class="nav-links">
            <a href="<%= request.getContextPath() %>/Admin/AdminDashboard.jsp" class="nav-item"><i class="fas fa-home"></i> Home</a>
            <a href="<%= request.getContextPath() %>/Admin/Employee.jsp" class="nav-item"><i class="fas fa-users"></i> Accounts</a>
            <a href="<%= request.getContextPath() %>/Admin/FareRates.jsp" class="nav-item"><i class="fas fa-dollar-sign"></i> Rates</a>
            <a href="<%= request.getContextPath() %>/Admin/Car.jsp" class="nav-item"><i class="fas fa-car"></i> Car</a>

        </nav>

       
        <div class="nav-icons">
           <a href="<%= request.getContextPath() %>/Admin/AdminDashboard.jsp" class="profile-icon" title="Profile">
                <i class="fas fa-user"></i>
            </a>
            <a href="<%= request.getContextPath() %>/landing.jsp" class="exit-icon" title="Logout">
                <i class="fas fa-sign-out-alt"></i>
            </a>
        </div>
    </header>
</body>
</html>
