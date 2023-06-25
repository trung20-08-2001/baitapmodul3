package com.example.crudlistcustomer;

import com.example.crudlistcustomer.controller.ManagerCustomer;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/display")
public class DisplayServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
        request.setAttribute("customerList",ManagerCustomer.customerList);
        dispatcher.forward(request,response);
    }
}