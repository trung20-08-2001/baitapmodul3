package com.example.crudlistcustomer.controller;

import com.example.crudlistcustomer.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class ManagerCustomer {
    public static List<Customer> customerList = new ArrayList<>();

    static  {
        customerList.add(new Customer("A", 18, "https://i.pinimg.com/originals/34/bd/4d/34bd4dfd13499e0fdca21fa353290cd2.jpg"));
        customerList.add(new Customer("B", 19, "https://i.pinimg.com/originals/7f/16/37/7f1637fb5b6be000ac1c43985e8d5a78.jpg"));
        customerList.add(new Customer("C", 20, "https://i.pinimg.com/originals/67/83/11/678311a8ed5dbb926f6059d3ecaa73ea.jpg"));
    }

    public void addCustomer(String name, int age, String img) {
        customerList.add(new Customer(name, age, img));
    }

    public int findById(int id) {
        for (int i = 0; i < customerList.size(); i++) {
            if (customerList.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }

    public void deleteCustomer(int id) {
        customerList.remove(findById(id));
    }

    public void editCustomer(int id, String name, int age, String img) {
        for(Customer customer:customerList) {
            if (customer.getId() == id) {
                customer.setName(name);
                customer.setAge(age);
                customer.setImg(img);
                break;
            }
        }
    }

}
