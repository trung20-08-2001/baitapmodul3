package com.example.login.controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/login")
public class HelloServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("email");
        String password = req.getParameter("password");

        PrintWriter writer = resp.getWriter();
        writer.println("<html><head>\n" +
                "    <title>JSP - Hello World</title>\n" +
                "    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\"\n" +
                "          integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n" +
                "</head>\n" +
                "<body>");

        if ("admin".equals(username) && "admin".equals(password)) {
            writer.println("<h1 class='text-center text-primary'>Welcome " + username + " to website</h1>");
        } else {
            writer.println("<h1 class='text-center text-danger'>Account does not exist</h1>");
        }

        writer.println("</body></html>");
    }
}