package com.example.controller;

import com.example.service.CustomerService;
import com.example.service.CustomerServiceImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteCustomer")

public class DeleteCustomerServlet extends HttpServlet {
    CustomerService customerService=new CustomerServiceImplement();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        customerService.deleteCustomer(id);
        resp.sendRedirect("/displayAllCustomer");
    }
}
