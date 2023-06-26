package com.example.managercustomer.controller;

import com.example.managercustomer.service.ManagerCustomer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteCustomer")
public class DeleteCustomerServlet extends HttpServlet {
    ManagerCustomer managerCustomer = new ManagerCustomer();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int rowDelete = managerCustomer.deleteCustomer(id);
        if(rowDelete!=0){
            resp.sendRedirect("/displayAllCustomer");
        }
    }
}
