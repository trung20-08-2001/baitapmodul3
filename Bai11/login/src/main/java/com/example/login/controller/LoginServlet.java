package com.example.login.controller;

import com.example.login.manager.ManagerAccount;
import com.example.login.model.Account;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    ManagerAccount managerAccount = new ManagerAccount();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Account account = managerAccount.findAccount(email, password);
        if (account != null) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/login.jsp");
            req.setAttribute("account", account);
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect("/accountnotfound.jsp");
        }
    }
}