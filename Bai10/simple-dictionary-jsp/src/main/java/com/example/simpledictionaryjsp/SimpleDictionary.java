package com.example.simpledictionaryjsp;

import java.io.*;
import java.util.TreeMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name="SimpleDictionary",value = "/dictionary")
public class SimpleDictionary extends HttpServlet {
    static TreeMap<String,String> dictionary=new TreeMap<>();
    static {
        dictionary.put("book","sách");
        dictionary.put("dictionary","từ điển");
        dictionary.put("chair","cái ghế");
        dictionary.put("branch","nhánh");
        dictionary.put("brand","thương hiệu");
        dictionary.put("table","cái bàn");
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher=request.getRequestDispatcher("/result.jsp");
        String search=request.getParameter("search");
        String result=dictionary.get(search);
        request.setAttribute("search",search);
        if(result!=null){
            request.setAttribute("result",result);
            dispatcher.forward(request,response);
        }else{
            request.setAttribute("result","Không tìm thấy");
            dispatcher.forward(request,response);
        }
    }


}