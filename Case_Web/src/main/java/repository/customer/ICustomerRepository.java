package repository.customer;

import model.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerRepository {
    List<Customer> selectAllCustomer();
    Customer selectCustomerById(int id);
    boolean deleteCustomer(int id);
    boolean editCustomer(Customer customer);
    boolean insertCustomer(Customer customer);
}
