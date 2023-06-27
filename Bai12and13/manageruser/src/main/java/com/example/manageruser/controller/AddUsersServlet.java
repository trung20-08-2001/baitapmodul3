package com.example.manageruser.controller;

import com.example.manageruser.dao.IUserDAO;
import com.example.manageruser.dao.UserDAO;
import com.example.manageruser.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addUsers")
public class AddUsersServlet extends HttpServlet {
    IUserDAO iUserDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        int[] permission = {1, 2, 3, 4};
        iUserDAO.addUserTransaction(new User(1, name, email, country), permission);
        resp.sendRedirect("/displayAll");
    }
}
