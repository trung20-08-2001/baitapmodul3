package com.example.controller;

import com.example.model.Product;
import com.example.service.ManagerProduct;
import com.example.service.ProductService;

import java.io.*;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/displayAllProduct")
public class DisplayAllProductServlet extends HttpServlet {
    ProductService productService = new ManagerProduct();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        List<Product> productList = productService.displayAllProduct();
        req.setAttribute("listProduct",productList);
        dispatcher.forward(req,resp);
    }
}