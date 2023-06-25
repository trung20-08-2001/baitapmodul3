package com.example.calculator;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/calculator")
public class Calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        try {
            float fistNumber = Float.parseFloat(req.getParameter("fistNumber"));
            float secondNumber = Float.parseFloat(req.getParameter("secondNumber"));
            String operator = req.getParameter("operator");
            if (operator.equals("+")) {
                req.setAttribute("result", (fistNumber + secondNumber));
            } else if (operator.equals("-")) {
                req.setAttribute("result", (fistNumber - secondNumber));
            } else if (operator.equals("*")) {
                req.setAttribute("result", (fistNumber * secondNumber));
            } else {
                req.setAttribute("result", (fistNumber / secondNumber));
            }
        } catch (Exception e) {
            req.setAttribute("result", "Error");
        }
        dispatcher.forward(req, resp);
    }

}