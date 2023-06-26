package com.example.controller;

import com.example.service.ManagerProduct;
import com.example.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
    ProductService productService=new ManagerProduct();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("name");
        float price=Float.parseFloat(req.getParameter("price"));
        String img=req.getParameter("img");
        String producingCountry=req.getParameter("producingCountry");
        productService.addProduct(name,price,img,producingCountry);
        resp.sendRedirect("/displayAllProduct");
    }
}
