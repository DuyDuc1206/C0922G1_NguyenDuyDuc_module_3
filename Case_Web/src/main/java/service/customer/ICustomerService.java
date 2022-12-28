package service.customer;

import model.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> selectAllCustomer();
    Customer selectCustomerById(int id);
    boolean deleteCustomer(int id);
    boolean editCustomer(Customer customer);
    Map<String,String> insertCustomer(Customer customer);
    List<Customer> selectCustomerByEdition(String name,String address,String email);
}
