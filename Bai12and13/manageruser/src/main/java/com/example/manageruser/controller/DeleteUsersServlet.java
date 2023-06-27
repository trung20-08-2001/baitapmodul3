package com.example.manageruser.controller;

import com.example.manageruser.dao.IUserDAO;
import com.example.manageruser.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteUsers")
public class DeleteUsersServlet extends HttpServlet {
    IUserDAO iUserDAO=new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        try {
            if(iUserDAO.deleteUsersWithProcedure(id)){
                resp.sendRedirect("/displayAll");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
