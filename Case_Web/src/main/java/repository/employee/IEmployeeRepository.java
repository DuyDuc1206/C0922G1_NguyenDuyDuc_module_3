package repository.employee;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> selectAllEmployee();

    boolean deleteEmployee(int id);

    boolean editEmployee(Employee employee);

    boolean addEmployee(Employee employee);

    List<Employee> searchEmployee(String name, String address, String position);
}
