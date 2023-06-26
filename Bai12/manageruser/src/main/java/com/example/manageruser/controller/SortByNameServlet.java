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
import java.sql.SQLException;
import java.util.List;

@WebServlet("/sortByName")
public class SortByNameServlet extends HttpServlet {
    IUserDAO iUserDAO=new UserDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher=req.getRequestDispatcher("/index.jsp");
        try {
            List<User> userList=iUserDAO.sortByName();
            req.setAttribute("listAccount",userList);
            dispatcher.forward(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
