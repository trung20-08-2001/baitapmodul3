package com.example.manageruser.dao;

import com.example.manageruser.model.Permission;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PermissionDAO {
    public List<Permission> getAllPermission(){
        List<Permission> permissionList=new ArrayList<>();
        try(Connection connection=ConnectDAO.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM PERMISION")){
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("IDPERMISION");
                String permission=resultSet.getString("NAMEPERMISION");
                permissionList.add(new Permission(id,permission));
            }
        }   catch (SQLException e){
            e.printStackTrace();
        }
        return permissionList;
    }
}
