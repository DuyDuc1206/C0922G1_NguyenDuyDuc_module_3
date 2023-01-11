package controller;

import model.employee.*;
import repository.employee.IDivisionRepository;
import repository.employee.IEducationDegreeRepository;
import repository.employee.IPositionRepository;
import repository.employee.IUserRepository;
import repository.employee.impl.DivisionRepository;
import repository.employee.impl.EducationDegreeRepository;
import repository.employee.impl.PositionRepository;
import repository.employee.impl.UserRepository;
import service.employee.IEmployeeService;
import service.employee.impl.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();
    private IUserRepository userRepository = new UserRepository();
    private IPositionRepository positionRepository = new PositionRepository();
    private IEducationDegreeRepository educationDegreeRepository = new EducationDegreeRepository();
    private IDivisionRepository divisionRepository = new DivisionRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                searchEmployee(request,response);
                break;
            case "add":
                addEmployee(request,response);
                break;
            case "edit":
                editEmployee(request,response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String positionId = request.getParameter("positionId");
        List<Employee> employeeList = employeeService.searchEmployee(name,address,positionId);
        request.setAttribute("employeeList",employeeList);
        List<Position> positionList = positionRepository.selectAllPosition();
        request.setAttribute("positionList",positionList);
        try {
            request.getRequestDispatcher("/view/employee/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name =  request.getParameter("name");
        String dob = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        Position position = new Position(positionId);
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        EducationDegree educationDegree = new EducationDegree(educationDegreeId);
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Division division = new Division(divisionId);
        String username = request.getParameter("username");
        User user = new User(username);
        Employee employee = new Employee(name,dob,idCard,salary,phoneNumber,email,address,position,educationDegree,division,user);
        boolean check = employeeService.addEmployee(employee);
        String mess = "Add Successfully!";
        if (!check){
            mess = "add Failed!";
        }
        request.getSession().setAttribute("mess",mess);
        response.sendRedirect("/employee");
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name =  request.getParameter("name");
        String dob = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        Position position = new Position(positionId);
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        EducationDegree educationDegree = new EducationDegree(educationDegreeId);
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Division division = new Division(divisionId);
        String username = request.getParameter("username");
        User user = new User(username);
        Employee employee = new Employee(id,name,dob,idCard,salary,phoneNumber,email,address,position,educationDegree,division,user);
        boolean check = employeeService.editEmployee(employee);
        String mess = "Edit Successfully!";
        if(!check){
            mess = "Edit Failed!";
        }
        request.setAttribute("mess",mess);
        showList(request,response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = employeeService.deleteEmployee(id);
        String mess = "Deleted Successfully!";
        if (!check){
            mess = "Delete Failed!";
        }
        request.setAttribute("mess",mess);
        showList(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showList(request, response);
                break;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        List<Position> positionList = positionRepository.selectAllPosition();
        request.setAttribute("positionList",positionList);
        List<EducationDegree> educationDegreeList = educationDegreeRepository.selectAllEducationDegree();
        request.setAttribute("educationDegreeList",educationDegreeList);
        List<Division> divisionList = divisionRepository.selectAllDivision();
        request.setAttribute("divisionList",divisionList);
        List<User> userList = userRepository.selectAllUser();
        request.setAttribute("userList",userList);
        try {
            request.getRequestDispatcher("/view/employee/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
