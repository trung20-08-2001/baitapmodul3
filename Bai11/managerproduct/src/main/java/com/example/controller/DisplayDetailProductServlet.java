package com.example.controller;

import com.example.model.Product;
import com.example.service.ManagerProduct;
import com.example.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/displayDetailProduct")
public class DisplayDetailProductServlet extends HttpServlet {
    ProductService productService=new ManagerProduct();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher= req.getRequestDispatcher("detailproduct.jsp");
        int id=Integer.parseInt(req.getParameter("id"));
        Product product=productService.findProductById(id);
        req.setAttribute("product",product);
        dispatcher.forward(req,resp);
    }
}
