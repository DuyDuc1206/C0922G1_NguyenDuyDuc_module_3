package controller;

import model.employee.Employee;
import service.employee.IEmployeeService;
import service.employee.impl.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet",value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action="";
        }
        switch (action){
            default:
                showList(request,response);
                break;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.selectAllEmployee();
        request.setAttribute("employeeList",employeeList);
        try {
            request.getRequestDispatcher("/view/employee/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
