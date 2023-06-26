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

@WebServlet("/displayDetailCustomer")

public class DisplayDetailCustomerServlet extends HttpServlet {
    CustomerService customerService=new CustomerServiceImplement();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        Customer customer=customerService.displayDetailCustomer(id);
        RequestDispatcher dispatcher=req.getRequestDispatcher("detailcustomer.jsp");
        req.setAttribute("customer",customer);
        dispatcher.forward(req,resp);
    }
}
