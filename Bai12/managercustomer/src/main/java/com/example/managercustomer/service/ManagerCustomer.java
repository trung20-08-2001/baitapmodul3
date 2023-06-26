package com.example.managercustomer.service;

import com.example.managercustomer.model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ManagerCustomer {
    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bai12_QL_Customer", "root", "08gnurt20");

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT *FROM Customer")) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("Id");
                String name = resultSet.getString("Name");
                int age = resultSet.getInt("Age");
                String img = resultSet.getString("Img");
                customerList.add(new Customer(id, name, age, img));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    public void insertCustomer(Customer customer) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Customer(Name,Age,Img) VALUES (?,?,?)")) {
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setInt(2, customer.getAge());
            preparedStatement.setString(3, customer.getImg());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int updateCustomer(Customer customer) {
        int rowUpdate = 0;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE  Customer SET Name=?,Age=?,Img=? WHERE Id=?")) {
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setInt(2, customer.getAge());
            preparedStatement.setString(3, customer.getImg());
            preparedStatement.setInt(4, customer.getId());
            rowUpdate = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }

    public int deleteCustomer(int id) {
        int rowDelete = 0;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE  FROM Customer WHERE Id=?")) {
            preparedStatement.setInt(1,id);
            rowDelete = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }
}
