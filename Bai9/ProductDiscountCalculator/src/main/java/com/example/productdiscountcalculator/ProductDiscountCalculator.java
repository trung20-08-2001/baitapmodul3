package com.example.productdiscountcalculator;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/calculator")
public class ProductDiscountCalculator extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        float price=Float.parseFloat(request.getParameter("price"));
        float percent=Float.parseFloat(request.getParameter("percent"));
        float discountAmount= (float) (price*percent*0.01);
        PrintWriter printWriter=response.getWriter();
        printWriter.println("<html><body>");
        printWriter.println("<h1>Discount Amount: "+discountAmount+"</h1>");
        printWriter.println("<h1>Discount Price: "+(price-discountAmount)+"</h1>");
        printWriter.println("</body></html>");

    }


}