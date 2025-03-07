package com.controller;

import com.dao.UserDAO;
import com.model.User;
import com.util.UserFactory;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String ADMIN_EMAIL = "admin@megacitycab.com";
    private static final String ADMIN_PASSWORD = "1111";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        // Admin Login
        if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
            session.setAttribute("adminId", "EMP001"); 
            session.setAttribute("adminName", "Admin User");
            System.out.println("Admin logged in successfully!");

            response.sendRedirect(request.getContextPath() + "/Admin/AdminDashboard.jsp");
            return; 
        }

        // Regular User Login
        UserDAO userDAO = UserFactory.getUserDAO();
        User user = userDAO.loginUser(email, password);

        if (user != null) {
            session.setAttribute("user", user);
         

            String role = user.getRole().toLowerCase().trim();
            System.out.println("User Role: " + role);

            String redirectURL = request.getContextPath();
            switch (role) {
                case "staff":
                    session.setAttribute("StaffId", user.getEmployeeId());
                    redirectURL += "/Staff/StaffDashboard.jsp";
                    break;
                case "driver":
                    session.setAttribute("driverId", user.getEmployeeId());
                    redirectURL += "/driver/driverDashboard.jsp";
                    break;
                case "customer":
                    session.setAttribute("userId", user.getUserId());
                    redirectURL += "/customer/CustomerDashboard.jsp";
                    break;
                default:
                    request.setAttribute("error", "Unauthorized access!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
            }

            System.out.println("Redirecting to: " + redirectURL);
            response.sendRedirect(redirectURL);
        } else {
            session.setAttribute("errorMessage", "Invalid login! Please try again.");
            response.sendRedirect("login.jsp");
        }
    }
}
