package com.example.currencyconverterjsp;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/converter")
public class Converter extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float rate=Float.parseFloat(req.getParameter("rate"));
        float usd=Float.parseFloat(req.getParameter("usd"));
        req.setAttribute("vnd",(rate*usd));
        RequestDispatcher dispatcher= req.getRequestDispatcher("/index.jsp");
        dispatcher.forward(req,resp);
    }
}