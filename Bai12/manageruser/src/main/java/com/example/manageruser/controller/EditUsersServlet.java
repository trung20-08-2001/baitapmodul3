package com.example.manageruser.controller;

import com.example.manageruser.dao.IUserDAO;
import com.example.manageruser.dao.UserDAO;
import com.example.manageruser.model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/editUsers")
public class EditUsersServlet extends HttpServlet {
    IUserDAO iUserDAO=new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String country=req.getParameter("country");
        try {
            iUserDAO.updateUser(new User(id,name,email,country));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect("/displayAllUsers");
    }
}
