package repository.customer.impl;

import model.Customer;
import model.CustomerType;
import repository.BaseRepository;
import repository.customer.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL_CUSTOMER = "select * from customer;";
    private final String SELECT_CUSTOMER_BY_ID = "select * from customer where customer_id = ?;";
    private final String DELETE_CUSTOMER_BY_ID = "delete from customer where customer_id = ?;";

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("customer_id");
                String name = rs.getString("customer_name");
                String dateOfBirth = rs.getString("date_of_birth");
                String gender = rs.getString("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String customerType = rs.getString("customer_type_id");
                CustomerType customerTypeName = new CustomerType(customerType);
                Customer customer = new Customer(id, name, dateOfBirth, gender, idCard, phoneNumber, address, email, customerTypeName);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer selectCustomerById(int id) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id_new = rs.getInt("customer_id");
                String name = rs.getString("customer_name");
                String dateOfBirth = rs.getString("date_of_birth");
                String gender = rs.getString("gender");
                String idCCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String customerType = rs.getString("customer_type_id");
                CustomerType customerTypeName = new CustomerType(customerType);
                customer = new Customer(id_new, name, dateOfBirth, gender, idCCard, phoneNumber, address, email, customerTypeName);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean deleteCustomer(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
