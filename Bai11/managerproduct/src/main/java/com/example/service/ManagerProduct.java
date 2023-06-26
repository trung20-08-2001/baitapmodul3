package com.example.service;

import com.example.model.Product;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ManagerProduct implements ProductService {
    static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product("Sam sung A70", 1000000, "https://th.bing.com/th/id/R.6bd9d984b7f3f63eee96816f960a8286?rik=g7b%2bwU9iUm3DEA&pid=ImgRaw&r=0", "Hàn Quốc"));
        productList.add(new Product("Sam sung A9", 1000000, "https://th.bing.com/th/id/R.85acb91dbc033bcbf7330d15c5f3963e?rik=8X6qXp2E9yGEIQ&pid=ImgRaw&r=0", "Hàn Quốc"));
        productList.add(new Product("Iphone 14 pro max", 1000000, "https://lh3.googleusercontent.com/-4BhTAbSj9Yk/YCAO-qMCYJI/AAAAAAAAJdE/aIJkLokMiaoWHva5KHLFXfm0e7H4hOTkACLcBGAsYHQ/s16000/1.jpg", "Mỹ"));
        productList.add(new Product("Iphone 13 pro max", 1000000, "https://www.airlinkcommunication.com/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/i/p/iphone-13-pro.jpg", "Mỹ"));
    }

    @Override
    public List<Product> displayAllProduct() {
        return productList;
    }

    @Override
    public void addProduct(String name, float price, String img, String producingCountry) {
        productList.add(new Product(name, price, img, producingCountry));
    }

    @Override
    public void editProduct(int id, String name, float price, String img, String producingCountry) {
        Product product = findProductById(id);
        product.setName(name);
        product.setPrice(price);
        product.setImg(img);
        product.setWhereProduction(producingCountry);
    }

    @Override
    public void deleteProduct(int id) {
        Product product = findProductById(id);
        productList.remove(product);
    }

    @Override
    public Product findProductById(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id) {
                return productList.get(i);
            }
        }
        return null;
    }

    @Override
    public List<Product> findProductByName(String name) {
        List<Product> listProductSameName = new ArrayList<>();
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getName().equals(name.trim())) {
                listProductSameName.add(productList.get(i));
            }
        }
        return listProductSameName;
    }
}
