package com.example.crudlistcustomer.model;

public class Customer {
   private static int count=0;
   private int id;
    private String name;
    private int age;
    private String img;

    public Customer() {
    }

    public Customer( String name, int age, String img) {
        this.id = ++count;
        this.name = name;
        this.age = age;
        this.img = img;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", img='" + img + '\'' +
                '}';
    }
}
