package com.controller.customer;

import com.dao.customer.BookingDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO BookingDAO = new BookingDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNumber = request.getParameter("orderNumber");

        boolean success = BookingDAO.cancelBooking(orderNumber);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/customer/viewBookings.jsp?message=Booking canceled successfully!");
        } else {
            response.sendRedirect(request.getContextPath() + "/customer/viewBookings.jsp?error=Failed to cancel Booking! Booking may already be completed.");
        }
    }
}
