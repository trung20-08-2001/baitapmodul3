package com.example.manageruser.controller;

import com.example.manageruser.dao.IUserDAO;
import com.example.manageruser.dao.PermissionDAO;
import com.example.manageruser.dao.UserDAO;
import com.example.manageruser.model.Permission;
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

@WebServlet("/displayAll")
public class DisplayAllUsersAndPermissionServlet extends HttpServlet {
    IUserDAO iUserDAO=new UserDAO();
    PermissionDAO permissionDAO=new PermissionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userList= null;
        try {
            userList = iUserDAO.selectAllUserWithProcedure();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<Permission> permissionList=permissionDAO.getAllPermission();
        RequestDispatcher dispatcher=req.getRequestDispatcher("index.jsp");
        req.setAttribute("listAccount",userList);
        req.setAttribute("listPermission",permissionList);
        dispatcher.forward(req,resp);
    }
}
