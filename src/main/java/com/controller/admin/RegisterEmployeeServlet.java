package com.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.admin.EmployeeDAO;
import com.util.Password;

@WebServlet("/Admin/RegisterEmployeeServlet")
public class RegisterEmployeeServlet extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeID = request.getParameter("employeeID");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        // Hash the password before storing it
        String hashedPassword = Password.hashPassword(password);

        EmployeeDAO dao = new EmployeeDAO();
        boolean isAdded = dao.addEmployee(employeeID, username, hashedPassword, email, role);

        if (isAdded) {
            response.sendRedirect("Employee.jsp?success=true");
        } else {
            response.getWriter().println("Error: Could not register employee.");
        }
    }
}
