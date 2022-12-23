package repository.customer;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> selectAllCustomer();
    Customer selectCustomerById(int id);
    boolean deleteCustomer(int id);
}
