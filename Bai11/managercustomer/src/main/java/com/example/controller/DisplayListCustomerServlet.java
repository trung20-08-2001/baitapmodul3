package com.example.controller;

import com.example.model.Customer;
import com.example.service.CustomerService;
import com.example.service.CustomerServiceImplement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/displayAllCustomer")
public class DisplayListCustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceImplement();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        List<Customer> customerList = customerService.displayAllCustomer();
       req.setAttribute("listCustomer",customerList);
       dispatcher.forward(req,resp);
    }
}
