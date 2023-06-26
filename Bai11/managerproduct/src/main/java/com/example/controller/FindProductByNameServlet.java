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
import java.util.List;

@WebServlet("/findProductByName")
public class FindProductByNameServlet extends HttpServlet {
    ProductService productService = new ManagerProduct();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("findProductByName.jsp");
        String name = req.getParameter("name");
        List<Product> productList = productService.findProductByName(name);
        req.setAttribute("listProductSameName",productList);
        req.setAttribute("nameProduct",name);
        dispatcher.forward(req,resp);
    }
}
