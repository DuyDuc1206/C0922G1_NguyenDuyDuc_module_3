package controller;

import model.Customer;
import model.CustomerType;
import repository.customer.ICustomerTypeRepository;
import repository.customer.impl.CustomerTypeRepository;
import service.customer.ICustomerService;
import service.customer.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    private ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "insert":
                insertCustomer(request, response);
                break;
            case "search" :
                searchCustomer(request,response);
                break;
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        request.setAttribute("name",name);
        request.setAttribute("address",address);
        request.setAttribute("email",email);
        List<Customer> customerList = customerService.selectCustomerByEdition(name,address,email);
        request.setAttribute("customerList",customerList);
        try {
            request.getRequestDispatcher("/view/customer/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String customerTypeName = request.getParameter("customerTypeName");
        CustomerType customerType = new CustomerType(customerTypeName);
        Customer customer = new Customer(name, dateOfBirth, gender, idCard, phoneNumber, address, email, customerType);
        Map<String, String> errorMap = customerService.insertCustomer(customer);
        String mess = "Added Successfully!";
        if (!errorMap.isEmpty()) {
            mess = "Add Failed!";
        }
        request.setAttribute("mess",mess);
        request.setAttribute("errorMap",errorMap);
        request.setAttribute("customer", customer);
        showList(request, response);

    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        CustomerType customerType = new CustomerType(customerTypeId);
        Customer customer = new Customer(id, name, dateOfBirth, gender, idCard, phoneNumber, address, email, customerType);
        boolean check = customerService.editCustomer(customer);
        String mess = "Edit Successfully!";
        if (!check) {
            mess = "Edit Failed!";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int deleteId = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = customerService.deleteCustomer(deleteId);
        String mess = "Deleted Successfully!";
        if (!check) {
            mess = "Delete Failed";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                showList(request, response);
                break;
            default:
                request.getRequestDispatcher("/view/interface/home.jsp").forward(request,response);

        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        List<CustomerType> customerTypeList = customerTypeRepository.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("/view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
