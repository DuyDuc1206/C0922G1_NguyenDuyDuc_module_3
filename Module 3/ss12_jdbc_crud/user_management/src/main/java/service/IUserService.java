package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> selectAllUser();
    boolean deleteUser(int id);
    List<User> selectUserCountry(String country);
    boolean editUser(User user);
    boolean addUser(User user);
}
