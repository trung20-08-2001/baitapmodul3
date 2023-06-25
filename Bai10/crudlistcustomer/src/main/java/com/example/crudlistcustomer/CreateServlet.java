package com.example.crudlistcustomer;

import com.example.crudlistcustomer.controller.ManagerCustomer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createCustomer")
public class CreateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher=req.getRequestDispatcher("create.jsp");
        req.setAttribute("id",req.getParameter("id"));
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ManagerCustomer managerCustomer = new ManagerCustomer();
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String img = req.getParameter("img");
        managerCustomer.addCustomer(name, age, img);
        resp.sendRedirect("/display");
    }
}
