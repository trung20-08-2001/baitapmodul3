package com.example.service;

import com.example.model.Customer;

import java.util.List;

public interface CustomerService{
    List<Customer> displayAllCustomer();
    void addCustomer(String name, String email, String address,String img);
    void editCustomer(int id,String name, String email, String address,String img);
    void deleteCustomer(int id);
    Customer displayDetailCustomer(int id);
}
