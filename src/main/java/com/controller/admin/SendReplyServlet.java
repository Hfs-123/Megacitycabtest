package com.controller.admin;

import com.dao.customer.InquiryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Admin/SendReplyServlet")
public class SendReplyServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int inquiryId = Integer.parseInt(request.getParameter("inquiryId"));
        String reply = request.getParameter("reply");

        InquiryDAO inquiryDAO = new InquiryDAO();
        boolean isReplied = inquiryDAO.sendReply(inquiryId, reply);

        if (isReplied) {
            response.sendRedirect("ViewInquiries.jsp?success=1");
        } else {
            response.sendRedirect("Inquries.jsp?inquiryId=" + inquiryId + "&error=1");
        }
    }
}
