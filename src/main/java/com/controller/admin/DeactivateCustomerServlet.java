package com.controller.admin;

import com.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Admin/DeactivateCustomerServlet")
public class DeactivateCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String customerId = request.getParameter("id");
        UserDAO userDAO = new UserDAO();

        if (userDAO.deactivateCustomer(customerId)) {
            response.sendRedirect("Checkuser.jsp?message=Customer Deactivated Successfully");
        } else {
            response.sendRedirect("Checkuser.jsp?error=Failed to Deactivate Customer");
        }
    }
}
