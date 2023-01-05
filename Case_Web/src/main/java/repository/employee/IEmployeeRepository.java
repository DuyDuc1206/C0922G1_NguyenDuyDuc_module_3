package repository.employee;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> selectAllEmployee();
}
