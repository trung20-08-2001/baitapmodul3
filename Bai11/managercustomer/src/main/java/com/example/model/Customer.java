package com.example.model;

public class Customer {
    private static int count=0;
    private int id;
    private String name;
    private String email;
    private String address;
    private String img;

    public Customer() {
    }

    public Customer(String name, String email, String address,String img) {
        this.id = ++count;
        this.name = name;
        this.email = email;
        this.address = address;
        this.img=img;
    }

    public static int getCount() {
        return count;
    }

    public static void setCount(int count) {
        Customer.count = count;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {

        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
