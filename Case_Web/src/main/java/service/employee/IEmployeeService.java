package service.employee;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> selectAllEmployee();
    boolean deleteEmployee(int id);
    boolean editEmployee(Employee employee);
    boolean addEmployee(Employee employee);
    List<Employee> searchEmployee(String name, String address, String position);
}
