package com.example.manageruser.controller;

import com.example.manageruser.dao.IUserDAO;
import com.example.manageruser.dao.UserDAO;
import com.example.manageruser.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/displayAllUsers")
public class DisplayAllUsersServlet extends HttpServlet {
    IUserDAO iUserDAO=new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userList=iUserDAO.selectAllUser();
        RequestDispatcher dispatcher=req.getRequestDispatcher("index.jsp");
        req.setAttribute("listAccount",userList);
        dispatcher.forward(req,resp);
    }
}
