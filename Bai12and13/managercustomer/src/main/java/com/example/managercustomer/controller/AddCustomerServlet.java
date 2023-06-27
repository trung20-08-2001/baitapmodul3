package com.example.managercustomer.controller;

import com.example.managercustomer.model.Customer;
import com.example.managercustomer.service.ManagerCustomer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addCustomer")
public class AddCustomerServlet extends HttpServlet {
    ManagerCustomer managerCustomer=new ManagerCustomer();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("name");
        int age=Integer.parseInt(req.getParameter("age"));
        String img=req.getParameter("img");
        managerCustomer.insertCustomer(new Customer(0,name,age,img));
        resp.sendRedirect("/displayAllCustomer");
    }
}
