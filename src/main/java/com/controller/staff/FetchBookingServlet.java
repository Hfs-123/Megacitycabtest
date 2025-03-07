package com.controller.staff;

import com.dao.customer.BookingDAO;
import com.model.customer.Booking;
import com.util.LocalDateTimeAdapter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.time.LocalDateTime;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/Staff/FetchBookingServlet")
public class FetchBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNumber = request.getParameter("orderNumber");
        System.out.println("Received orderNumber: " + orderNumber);

        BookingDAO BookingDAO = new BookingDAO();
        Booking Booking = BookingDAO.findSimpleBookingByOrderNumber(orderNumber);

        if (Booking != null) {
            System.out.println("Booking found: " + Booking.getOrderNumber());
        } else {
            System.out.println("No Booking found for order number: " + orderNumber);
        }

        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(Booking));
    }
}
