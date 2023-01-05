package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> selectAllUser() {
        return userRepository.selectAllUser();
    }

    @Override
    public boolean deleteUser(int id) {
        return userRepository.deleteUser(id);
    }

    @Override
    public List<User> selectUserCountry(String country) {
        return userRepository.selectUserCountry(country);
    }

    @Override
    public boolean editUser(User user) {
        return userRepository.editUser(user);
    }

    @Override
    public boolean addUser(User user) {
        return userRepository.addUser(user);
    }

    @Override
    public void addUserTransaction() {
        userRepository.addUserTransaction();
    }
}
