package com.example.crudlistcustomer;

import com.example.crudlistcustomer.controller.ManagerCustomer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteCustomer")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ManagerCustomer managerCustomer=new ManagerCustomer();
        int id=Integer.parseInt(req.getParameter("id"));
        managerCustomer.deleteCustomer(id);
        resp.sendRedirect("/display");
    }
}
