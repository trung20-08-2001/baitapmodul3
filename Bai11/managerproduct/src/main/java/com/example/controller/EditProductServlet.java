package com.example.controller;

import com.example.service.ManagerProduct;
import com.example.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet {
    ProductService productService=new ManagerProduct();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        String name=req.getParameter("name");
        float price=Float.parseFloat(req.getParameter("price"));
        String img=req.getParameter("img");
        String producingCountry=req.getParameter("producingCountry");
        productService.editProduct(id,name,price,img,producingCountry);
        resp.sendRedirect("/displayAllProduct");
    }
}
