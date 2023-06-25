package com.example.crudlistcustomer;

import com.example.crudlistcustomer.controller.ManagerCustomer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editCustomer")
public class EditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ManagerCustomer managerCustomer = new ManagerCustomer();
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String img = req.getParameter("img");
        managerCustomer.editCustomer(id, name, age, img);
        resp.sendRedirect("/display");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher=req.getRequestDispatcher("edit.jsp");
        req.setAttribute("id",req.getParameter("id"));
        dispatcher.forward(req,resp);
    }
}
