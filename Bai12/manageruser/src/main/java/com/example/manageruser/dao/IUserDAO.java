package com.example.manageruser.dao;

import com.example.manageruser.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    void insertUser(User user) throws SQLException;
    User selectUser(int id);
    List<User> selectAllUser();
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
    List<User> sortByName() throws SQLException;

    List<User> findByCountry(String country) throws SQLException;

}
