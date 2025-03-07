package com.controller.customer;

import com.dao.customer.BillingDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/ConfirmPaymentServlet")
public class ConfirmPaymentServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNumber = request.getParameter("orderNumber");
        String paymentMethod = request.getParameter("paymentMethod");

        BillingDAO BillingDAO = new BillingDAO();
        boolean success = BillingDAO.updatePaymentStatus(orderNumber, paymentMethod);

        if (success) {
            response.sendRedirect("Billing.jsp?orderNumber=" + orderNumber + "&message=Payment Successful");
        } else {
            response.sendRedirect("Billing.jsp?error=Payment Failed");
        }
    }
}
