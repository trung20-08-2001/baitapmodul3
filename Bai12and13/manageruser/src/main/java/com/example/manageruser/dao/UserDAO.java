package com.example.manageruser.dao;

import com.example.manageruser.model.User;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (NameUsers, EmailUsers, CountryUsers) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select IdUsers,NameUsers,EmailUsers,CountryUsers from users where IdUsers =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where IdUsers = ?";
    private static final String UPDATE_USERS_SQL = "update users set NameUsers = ?,EmailUsers= ?, CountryUsers =? where IdUsers = ?";


    public List<User> listUsers(ResultSet resultSet) throws SQLException {
        List<User> userList = new ArrayList<>();
        while (resultSet.next()) {
            int id = resultSet.getInt("IdUsers");
            String name = resultSet.getString("NameUsers");
            String email = resultSet.getString("EmailUsers");
            String country = resultSet.getString("CountryUsers");
            userList.add(new User(id, name, email, country));
        }
        return userList;
    }

    @Override
    public void insertUser(User user) {
        try (Connection connection = ConnectDAO.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try (Connection connection = ConnectDAO.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString(2);
                String email = rs.getString(3);
                String country = rs.getString(4);
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUser() {
        List<User> userList = new ArrayList<>();
        try (Connection connection = ConnectDAO.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = preparedStatement.executeQuery();
            userList = listUsers(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id) {
        boolean rowDeleted = false;
        try (Connection connection = ConnectDAO.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) {
        boolean rowUpdate = false;
        try (Connection connection = ConnectDAO.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            rowUpdate = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }

    @Override
    public List<User> sortByName() throws SQLException {
        List<User> userList = new ArrayList<>();
        try (Connection connection = ConnectDAO.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT *FROM Users ORDER BY NameUsers")) {
            ResultSet resultSet = preparedStatement.executeQuery();
            userList = listUsers(resultSet);
        }
        return userList;
    }

    @Override
    public List<User> findByCountry(String country) throws SQLException {
        List<User> userList = new ArrayList<>();
        try (Connection connection = ConnectDAO.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT *FROM Users WHERE CountryUsers=?")) {
            preparedStatement.setString(1, country);
            ResultSet resultSet = preparedStatement.executeQuery();
            userList = listUsers(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public User getUserById(int id) {
        User user = null;
        try (Connection connection = ConnectDAO.getConnection();
             CallableStatement callableStatement = connection.prepareCall("CALL GET_USER_BY_ID(?)")) {
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("NameUsers");
                String email = resultSet.getString("EmailUsers");
                String country = resultSet.getString("CountryUsers");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        try (Connection connection = ConnectDAO.getConnection();
             CallableStatement callableStatement = connection.prepareCall("CALL INSERT_USERS(?,?,?)")) {
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addUserTransaction(User user, int[] permission) {
        try (Connection connection = ConnectDAO.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);
             PreparedStatement preparedStatementAssignment = connection.prepareStatement("INSERT INTO  USER_PERMISION VALUES (?,?)")) {
            connection.setAutoCommit(false);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int rowAffected = preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            int idUsers = 0;
            if (resultSet.next()) {
                idUsers = resultSet.getInt(1);
                connection.commit();
            }
            if (rowAffected == 1) {
                for (int i = 0; i < permission.length; i++) {
                    preparedStatementAssignment.setInt(1, permission[i]);
                    preparedStatementAssignment.setInt(2, idUsers);
                    preparedStatementAssignment.executeUpdate();
                    connection.commit();
                }
            } else {
                connection.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertUpdateWithoutTransaction(User user1, User user2) {
        try (Connection connection = ConnectDAO.getConnection();
             PreparedStatement preparedStatement1 = connection.prepareStatement("INSERT INTO Users(NameUsers,EmailUsers,CountryUsers) VALUES (?,?,?)");
             PreparedStatement preparedStatement2 = connection.prepareStatement("UPDATE Users SET CountryUsers=?WHERE IdUsers=?")) {
            preparedStatement1.setString(1, user1.getName());
            preparedStatement1.setString(2, user1.getEmail());
            preparedStatement1.setString(3, user1.getCountry());

            preparedStatement2.setString(1, user2.getCountry());
            preparedStatement2.setInt(2, user2.getId());
            preparedStatement1.executeUpdate();
            preparedStatement2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> selectAllUserWithProcedure() throws SQLException {
        List<User> userList=new ArrayList<>();
        try(Connection connection=ConnectDAO.getConnection();
        CallableStatement callableStatement=connection.prepareCall("CALL SELECT_ALL_USER()")){
          ResultSet resultSet=callableStatement.executeQuery();
          userList=listUsers(resultSet);
        }
        return userList;
    }

    @Override
    public boolean editUsersWithProcedure(User user) throws SQLException {
        boolean rowEdit;
        try (Connection connection = ConnectDAO.getConnection();
             CallableStatement callableStatement = connection.prepareCall("CALL EDIT_USERS(?,?,?,?)")) {
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            rowEdit = callableStatement.executeUpdate() > 0;
        }
        return rowEdit;
    }

    @Override
    public boolean deleteUsersWithProcedure(int id) throws SQLException {
        boolean rowDelete;
        try (Connection connection = ConnectDAO.getConnection();
             CallableStatement callableStatement = connection.prepareCall("CALL DELETE_USERS(?)")) {
            callableStatement.setInt(1, id);
            rowDelete = callableStatement.executeUpdate() > 0;
        }
        return rowDelete;
    }


////    public static void main(String[] args) {
////        UserDAO userDAO = new UserDAO();
////        User user1 = new User(1, "Dương", "duong@gmail.com", "TQ");
////        User user2 = new User(-9, "Dương", "duong@gmail.com", "KL");
////        userDAO.insertUpdateWithoutTransaction(user1, user2);
////    }
}
