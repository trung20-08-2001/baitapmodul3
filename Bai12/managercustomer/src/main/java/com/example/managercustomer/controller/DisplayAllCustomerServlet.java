package com.example.managercustomer.controller;

import com.example.managercustomer.model.Customer;
import com.example.managercustomer.service.ManagerCustomer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/displayAllCustomer")
public class DisplayAllCustomerServlet extends HttpServlet {
    ManagerCustomer managerCustomer=new ManagerCustomer();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher=req.getRequestDispatcher("index.jsp");
        List<Customer> customerList=managerCustomer.selectAllCustomer();
        req.setAttribute("customerList",customerList);
        dispatcher.forward(req,resp);
    }
}
