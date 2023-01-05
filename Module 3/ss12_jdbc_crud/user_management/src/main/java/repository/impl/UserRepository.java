package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String SELECT_BY_COUNTRY = "select * from users where country like ?";
    //    private final String SELECT_ALL_USER = "select * from users ";
    private final String SELECT_ALL_USER = "call get_all_user(); ";
//    private final String DELETE_USER = "delete from users where id = ?;";
    private final String DELETE_USER = "call delete_user(?);";
    //    private final String EDIT_USER = "update users set name = ?,email= ?, country =? where id = ?;";
    private final String EDIT_USER = "call edit_user(?,?,?,?);";
    private final String ADD_USER = "insert into users(`name`,email,country) values(?,?,?);";

    @Override
    public List<User> selectAllUser() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
//            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_USER + "order by name");
            CallableStatement cs = connection.prepareCall(SELECT_ALL_USER);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public List<User> selectUserCountry(String country) {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_BY_COUNTRY);
            ps.setString(1, "%" + country + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country2 = rs.getString("country");
                User user = new User(id, name, email, country2);
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
//            PreparedStatement ps = connection.prepareStatement(DELETE_USER);
            CallableStatement cs = connection.prepareCall(DELETE_USER);
            cs.setInt(1, id);
            return cs.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editUser(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
//            PreparedStatement ps = connection.prepareStatement(EDIT_USER);
            CallableStatement cs = connection.prepareCall(EDIT_USER);
            cs.setString(1, user.getName());
            cs.setString(2, user.getEmail());
            cs.setString(3, user.getCountry());
            cs.setInt(4, user.getId());
            return cs.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean addUser(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(ADD_USER);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getCountry());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
