package repository.customer;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> selectAllCustomer();
    Customer selectCustomerById(int id);
    boolean deleteCustomer(int id);
    boolean editCustomer(Customer customer);
    boolean insertCustomer(Customer customer);
    List<Customer> selectCustomerByCondition(String name,String address, String email);
}
