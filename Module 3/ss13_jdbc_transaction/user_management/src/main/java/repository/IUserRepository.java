package repository;


import model.User;

import java.util.List;

public interface IUserRepository {
       List<User> selectAllUser();
       List<User> selectUserCountry(String country);
       boolean deleteUser(int id);
       boolean editUser(User user);
       boolean addUser(User user);
       void addUserTransaction();
}
