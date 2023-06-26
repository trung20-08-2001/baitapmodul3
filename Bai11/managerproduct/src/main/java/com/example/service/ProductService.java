package com.example.service;

import com.example.model.Product;

import java.util.Date;
import java.util.List;

public interface ProductService {
    List<Product> displayAllProduct();
    void addProduct(String name, float price, String describe, String producingCountry);
    void editProduct(int id,String name, float price, String img, String producingCountry);
    void deleteProduct(int id);
    Product findProductById(int id);
    List<Product> findProductByName(String name);
}
