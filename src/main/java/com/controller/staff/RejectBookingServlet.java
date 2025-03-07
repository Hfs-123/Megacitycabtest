package com.controller.staff;

import com.dao.customer.BookingDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/Staff/RejectBookingServlet")
public class RejectBookingServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private final BookingDAO BookingDAO = new BookingDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNumber = request.getParameter("orderNumber");

        if (orderNumber != null && !orderNumber.isEmpty()) {
            boolean rejected = BookingDAO.rejectBooking(orderNumber);
            if (rejected) {
                request.setAttribute("successMessage", "Booking rejected successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to reject the Booking.");
            }
        }
        response.sendRedirect(request.getContextPath() + "/Staff/StaffBookingConfirmation.jsp");
    }
}
