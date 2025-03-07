package com.controller.staff;

import com.dao.customer.BookingDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Staff/AssignDriverServlet")
public class AssignDriverServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverId = request.getParameter("driverId");
        String orderNumber = request.getParameter("orderNumber");

        BookingDAO BookingDAO = new BookingDAO();
        boolean assigned = BookingDAO.AssignDriverToOrder(driverId, orderNumber);

        if (assigned) {
            response.sendRedirect("AssignDriver.jsp?success=1");
        } else {
            response.sendRedirect("AssignDriver.jsp?error=1");
        }
    }
}
