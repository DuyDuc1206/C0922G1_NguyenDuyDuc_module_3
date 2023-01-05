package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet",value = "/user")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        } switch (action){
            case "search":
                searchUser(request,response);
                break;
            case "delete":
                deleteUser(request,response);
                break;
            case "edit":
                editUser(request,response);
                break;
            case "add":
                addUser(request,response);
                break;
            case "addCall":
                addCallUser(request,response);
            default:
        }
    }

    private void addCallUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        boolean check = userService.addUser(user);
        String mess = "Create Successfully";
        if (check) {
            mess = "Create Failed";
        }

        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("user/createCall.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email= request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name,email,country);
        boolean check = userService.addUser(user);
        String mess = "Add Successfully!";
        if (!check){
            mess = "Add Failed";
        }
         request.setAttribute("mess",mess);
        showList(request,response);
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email  = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id,name,email,country);
        boolean check = userService.editUser(user);
        String mess = "Edit Successfully";
        if (!check){
            mess = "Edit Failed!";
        }
        request.setAttribute("mess",mess);
        showList(request,response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = userService.deleteUser(id);
        String mess = "Delete Successfully!";
        if (!check){
            mess ="Delete Failed!";
        }
        request.setAttribute("mess",mess);
        showList(request,response);
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> userList = userService.selectUserCountry(country);
        request.setAttribute("userList",userList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action="";
        } switch (action){
            case "testUseTran":
                testUseTran(request, response);
                break;
            case "addCall":
                ShowInputFormCall(request,response);
                break;
            default:
                showList(request,response);
                break;
        }
    }

    private void ShowInputFormCall(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("user/createCall.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void testUseTran(HttpServletRequest request, HttpServletResponse response) {
        userService.addUserTransaction();
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.selectAllUser();
        request.setAttribute("userList",userList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
