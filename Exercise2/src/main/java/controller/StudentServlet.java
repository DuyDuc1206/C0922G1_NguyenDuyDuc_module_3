package controller;

import model.Class;
import model.Student;
import repository.IClassRepository;
import repository.impl.ClassRepository;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet",value = "/student")
public class StudentServlet extends HttpServlet {
    private static IStudentService studentService = new StudentService();
    private static IClassRepository classRepository = new ClassRepository();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "search":
                searchStudent(request,response);
                break;
            case "delete":
                deleteStudent(request,response);
                break;
        }
    }

    private void searchStudent(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        String classId = request.getParameter("searchClass");
        List<Student> studentList = studentService.searchStudent(name,classId);
        request.setAttribute("studentList",studentList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = studentService.deleteStudent(id);
        String mess = "Delete Successfully";
        if (!check){
            mess = "Delete Failed";
        }
        request.setAttribute("mess",mess);
        showList(request,response);
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
        List<Student> studentList =  studentService.selectAllStudent();
        request.setAttribute("studentList",studentList);
        List<Class> classList = classRepository.selectAllClass();
        request.setAttribute("classList",classList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
