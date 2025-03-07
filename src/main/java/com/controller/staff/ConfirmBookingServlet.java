package com.controller.staff;

import com.dao.customer.BookingDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Staff/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO BookingDAO = new BookingDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNumber = request.getParameter("orderNumber");
        boolean isConfirmed = BookingDAO.confirmBooking(orderNumber);

        if (isConfirmed) {
            response.sendRedirect(request.getContextPath() + "/Staff/StaffConfirmation.jsp?message=Booking confirmed!");
        } else {
            response.sendRedirect(request.getContextPath() + "/Staff/StaffConfirmation.jsp?error=Failed to confirm Booking.");
        }
    }
}
