package com.example.login.controller;

import com.example.login.manager.ManagerAccount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    ManagerAccount managerAccount=new ManagerAccount();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fistName=req.getParameter("fistName");
        String lastName=req.getParameter("lastName");
        String gender=req.getParameter("gender");
        String phone=req.getParameter("phone");
        String email=req.getParameter("email");
        String password=req.getParameter("password");
        if(!managerAccount.checkEmail(email)) {
            managerAccount.addAccount(fistName,lastName,gender,phone,email,password);
            resp.sendRedirect("/index.jsp");
        }else{
            resp.sendRedirect("/register.jsp");
        }
    }
}
