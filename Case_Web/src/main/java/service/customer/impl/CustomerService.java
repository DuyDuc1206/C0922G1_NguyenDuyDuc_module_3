package service.customer.impl;

import model.Customer;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import service.customer.ICustomerService;
import validation.RegexCheck;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepository.selectAllCustomer();
    }

    @Override
    public Customer selectCustomerById(int id) {
        return customerRepository.selectCustomerById(id);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public boolean editCustomer(Customer customer) {
        return customerRepository.editCustomer(customer);
    }

    @Override
    public Map<String, String> insertCustomer(Customer customer) {
        Map<String, String> errorMap = new HashMap<>();
        if ("".equals(customer.getName())) {
            errorMap.put("name", "Name is required");
        } else if (!RegexCheck.checkName(customer.getName())) {
            errorMap.put("name", "Name doesn't match");
        }
        if ("".equals(customer.getDateOfBirth())) {
            errorMap.put("dateOfBirth", "Date of birth is required");
        }
        if ("".equals(customer.getGender())) {
            errorMap.put("gender", "Gender is required");
        }
        if ("".equals(customer.getIdCard())) {
            errorMap.put("idCard", "ID card is required");
        } else if (!RegexCheck.checkIdCard(customer.getIdCard())) {
            errorMap.put("idCard", "ID card doesn't match");
        }
        if("".equals(customer.getPhoneNumber())){
            errorMap.put("phoneNumber","Phone number is required");
        } else if(!RegexCheck.checkPhoneNumber(customer.getPhoneNumber())){
            errorMap.put("phoneNumber","Phone number doesn't match");
        }
        if("".equals(customer.getAddress())){
            errorMap.put("address","Address is required");
        }
        if ("".equals(customer.getEmail())){
            errorMap.put("email","Email is required");
        } else if (!RegexCheck.checkEmail(customer.getEmail())){
            errorMap.put("email","Email doesn't match");
        }
        if("".equals(customer.getCustomerType().getName())){
            errorMap.put("cusotmerTypeName","Cusmtomer type name is required");
        }
        if (errorMap.isEmpty()){
            customerRepository.insertCustomer(customer);
        }
        return errorMap;
    }

    @Override
    public List<Customer> selectCustomerByEdition(String name, String address, String email) {
        return customerRepository.selectCustomerByCondition(name,address,email);
    }
}
