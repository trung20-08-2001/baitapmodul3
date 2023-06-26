package com.example.service;

import com.example.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImplement implements CustomerService{
    static List<Customer> customers=new ArrayList<>();
    static {
        customers.add(new Customer( "John", "john@codegym.vn", "Hanoi","https://img2.thuthuatphanmem.vn/uploads/2019/01/04/anh-gai-dep-han-quoc_025059504.jpg"));
        customers.add( new Customer( "Bill", "bill@codegym.vn", "Danang","https://th.bing.com/th/id/OIP.G9-KOhrzNXL6AQoXNob1JQHaHf?pid=ImgDet&rs=1"));
        customers. add(new Customer( "Alex", "alex@codegym.vn", "Saigon","https://32asb.itocd.net/images/girl/1210401-1210600/5bb284e5-c309-40c7-8e3d-3ae19f8b54c4.jpg"));
        customers.add( new Customer("Adam", "adam@codegym.vn", "Beijin","https://th.bing.com/th/id/OIP.-wDAS920FaOi_uxdiCXp4AHaHa?pid=ImgDet&rs=1"));
        customers.add( new Customer( "Sophia", "sophia@codegym.vn", "Miami","https://th.bing.com/th/id/R.8a7b5aa383b72e87663a6ed50f6e7868?rik=8ZUAQD4ka4szAg&riu=http%3a%2f%2fwww.sinaimg.cn%2fqc%2fmodel_lib%2fphoto%2f109%2f21%2f24%2f87233_src.jpg&ehk=UqWjubvefmuwpWthsPmpEBDjdmGOny0yW%2bL8Pre1RUo%3d&risl=&pid=ImgRaw&r=0"));
        customers.add (new Customer( "Yumi", "rose@codegym.vn", "Newyork","https://th.bing.com/th/id/OIP.sXle3OUocQRYZdS6zkk0hgHaLK?pid=ImgDet&w=637&h=960&rs=1"));
    }
        @Override
    public List<Customer> displayAllCustomer() {
        return customers;
    }

    @Override
    public void addCustomer(String name, String email, String address,String img) {
        Customer newCustomer=new Customer(name,email,address,img);
        customers.add(newCustomer);
    }

    @Override
    public void editCustomer(int id,String name, String email, String address,String img) {
        Customer customer=findCustomerById(id);
        if(customer!=null) {
            customer.setName(name);
            customer.setEmail(email);
            customer.setAddress(address);
            customer.setImg(img);
        }
    }

    @Override
    public void deleteCustomer(int id) {
        Customer customer=findCustomerById(id);
        if(customer!=null){
            customers.remove(customer);
        }
    }

    @Override
    public Customer displayDetailCustomer(int id) {
        return findCustomerById(id);
    }

    public Customer findCustomerById(int id){
        for(int i=0;i<customers.size();i++){
            if(customers.get(i).getId()==id){
                return customers.get(i);
            }
        }
        return null;
    }
}
