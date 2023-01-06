package service.employee.impl;

import model.employee.Employee;
import repository.employee.IEmployeeRepository;
import repository.employee.impl.EmployeeRepository;
import service.employee.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepository.selectAllEmployee();
    }

    @Override
    public boolean deleteEmployee(int id) {
        return employeeRepository.deleteEmployee(id);
    }
}
