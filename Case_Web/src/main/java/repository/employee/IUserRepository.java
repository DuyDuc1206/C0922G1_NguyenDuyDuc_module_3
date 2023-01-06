package repository.employee;

import model.employee.User;

import java.util.List;

public interface IUserRepository {
    List<User> selectAllUser();
}
