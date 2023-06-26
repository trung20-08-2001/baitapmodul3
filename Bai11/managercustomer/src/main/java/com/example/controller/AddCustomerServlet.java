package com.example.controller;

import com.example.service.CustomerService;
import com.example.service.CustomerServiceImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addCustomer")
public class AddCustomerServlet extends HttpServlet {
    CustomerService customerService=new CustomerServiceImplement();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String address=req.getParameter("address");
        String img=req.getParameter("img");
        customerService.addCustomer(name,email,address,img);
        resp.sendRedirect("/displayAllCustomer");
    }
}