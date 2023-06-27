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

    User getUserById(int id);
    void insertUserStore(User user) throws SQLException;
    void addUserTransaction(User user,int[] permission);
     void insertUpdateWithoutTransaction(User user1,User user2);
     List<User> selectAllUserWithProcedure() throws SQLException;
     boolean editUsersWithProcedure(User user) throws SQLException;
     boolean deleteUsersWithProcedure(int id) throws SQLException;

}
