package com.controller.staff;

import com.dao.customer.BillingDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Staff/ConfirmBillServlet")
public class ConfirmBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNumber = request.getParameter("orderNumber");

        BillingDAO BillingDAO = new BillingDAO();
        boolean success = BillingDAO.confirmBill(orderNumber);

        if (success) {
            response.sendRedirect("confirmBill.jsp?message=Bill Approved Successfully");
        } else {
            response.sendRedirect("confirmBill.jsp?error=Failed to Approve Bill");
        }
    }
}
