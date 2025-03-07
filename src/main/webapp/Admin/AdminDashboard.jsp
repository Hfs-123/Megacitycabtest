<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Main_css/admin/dashboard.css">
</head>
<body>

<%@ include file="header.jsp" %>

<%

    String adminId = (String) session.getAttribute("adminId");

    if (adminId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<main class="dashboard-container">
    <div class="container text-center">
        <h1 class="dashboard-title">Admin Dashboard</h1>

        <div class="row justify-content-center">
            <div class="col-md-3">
                <a href="Checkuser.jsp" class="dashboard-card">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title">User Management</h5>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3">
                <a href="Employee.jsp" class="dashboard-card">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title">Employee</h5>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3">
                <a href="Car.jsp" class="dashboard-card">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title">Car Management</h5>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3">
                <a href="ViewInquiries.jsp" class="dashboard-card">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title">Customer Inquiries</h5>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3">
                <a href="Fare.jsp" class="dashboard-card">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title"> Add Fare</h5>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3">
                <a href="Assigning.jsp" class="dashboard-card">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title">Assign Car</h5>
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
