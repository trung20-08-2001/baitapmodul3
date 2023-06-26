package com.example.model;


public class Product {
    private static int count=0;
    private int id;
    private String name;
    private float price;
    private String img;

    private String whereProduction;

    public Product() {
    }

    public Product(String name, float price, String img, String producingCountry) {
        this.id=++count;
        this.name = name;
        this.price = price;
        this.img = img;
        this.whereProduction = producingCountry;
    }

    public static int getCount() {
        return count;
    }

    public static void setCount(int count) {
        Product.count = count;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getWhereProduction() {
        return whereProduction;
    }

    public void setWhereProduction(String whereProduction) {
        this.whereProduction = whereProduction;
    }
}
