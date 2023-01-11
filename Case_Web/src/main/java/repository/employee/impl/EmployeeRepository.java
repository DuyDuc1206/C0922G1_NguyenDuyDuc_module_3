package repository.employee.impl;

import model.employee.*;
import repository.BaseRepository;
import repository.employee.IEmployeeRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private static final String SELECT_ALL_EMPLOYEE = "call get_all_employee();";
    private static final String DELETE_EMPLOYEE = "call delete_employee(?);";
    private static final String EDIT_EMPLOYEE = "call edit_employee( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?);";
    private static final String ADD_EMPLOYEE = " call add_employee ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
    private static final String SEARCH_EMPLOYEE = "call search_employee(?,?,?);";

    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement cs = connection.prepareCall(SELECT_ALL_EMPLOYEE);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("employee_id");
                String name = rs.getString("employee_name");
                String dateOfBirth = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                double salary = rs.getDouble("salary");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int positionId = rs.getInt("position_id");
                String positionName = rs.getString("position_name");
                Position position = new Position(positionId, positionName);
                int educationDegreeId = rs.getInt("education_degree_id");
                String educationDegreeName = rs.getString("education_degree_name");
                EducationDegree educationDegree = new EducationDegree(educationDegreeId, educationDegreeName);
                int divisionId = rs.getInt("division_id");
                String divisionName = rs.getString("division_name");
                Division division = new Division(divisionId, divisionName);
                String username = rs.getString("username");
                String password = rs.getString("password");
                User user = new User(username, password);
                Employee employee = new Employee(id, name, dateOfBirth, idCard, salary, phoneNumber, email, address, position, educationDegree, division, user);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public boolean deleteEmployee(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement cs = connection.prepareCall(DELETE_EMPLOYEE);
            cs.setInt(1, id);
            return cs.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement cs = connection.prepareCall(EDIT_EMPLOYEE);
            cs.setString(1, employee.getName());
            cs.setString(2, employee.getDateOfBirth());
            cs.setString(3, employee.getIdCard());
            cs.setDouble(4, employee.getSalary());
            cs.setString(5, employee.getPhoneNumber());
            cs.setString(6, employee.getEmail());
            cs.setString(7, employee.getAddress());
            cs.setInt(8, employee.getPosition().getId());
            cs.setInt(9, employee.getEducationDegree().getId());
            cs.setInt(10, employee.getDivision().getId());
            cs.setString(11, employee.getUser().getUserName());
            cs.setInt(12, employee.getId());
            return cs.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean addEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement cs = connection.prepareCall(ADD_EMPLOYEE);
            cs.setString(1, employee.getName());
            cs.setString(2, employee.getDateOfBirth());
            cs.setString(3, employee.getIdCard());
            cs.setDouble(4, employee.getSalary());
            cs.setString(5, employee.getPhoneNumber());
            cs.setString(6, employee.getEmail());
            cs.setString(7, employee.getAddress());
            cs.setInt(8, employee.getPosition().getId());
            cs.setInt(9, employee.getEducationDegree().getId());
            cs.setInt(10, employee.getDivision().getId());
            cs.setString(11, employee.getUser().getUserName());
            return cs.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Employee> searchEmployee(String name, String address, String position) {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement cs = connection.prepareCall(SEARCH_EMPLOYEE);
            cs.setString(1, "%" + name + "%");
            cs.setString(2, "%" + address + "%");
            cs.setString(3, "%" + position + "%" );
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                String newName = rs.getString("employee_name");
                String dateOfBirth = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                double salary = rs.getDouble("salary");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String newAddress = rs.getString("address");
                int positionId = rs.getInt("position_id");
                String positionName = rs.getString("position_name");
                Position newPosition = new Position(positionId, positionName);
                int educationDegreeId = rs.getInt("education_degree_id");
                String educationDegreeName = rs.getString("education_degree_name");
                EducationDegree educationDegree = new EducationDegree(educationDegreeId, educationDegreeName);
                int divisionId = rs.getInt("division_id");
                String divisionName = rs.getString("division_name");
                Division division = new Division(divisionId, divisionName);
                String username = rs.getString("username");
                String password = rs.getString("password");
                User user = new User(username, password);
                Employee employee = new Employee(newName, dateOfBirth, idCard, salary, phoneNumber, email, newAddress, newPosition, educationDegree, division, user);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }
}
