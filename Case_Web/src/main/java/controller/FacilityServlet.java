package controller;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import repository.facility.IFacilityTypeRepository;
import repository.facility.IRentTypeRepository;
import repository.facility.impl.FacilityTypeRepository;
import repository.facility.impl.RentTypeRepository;
import service.facility.IFacilityService;
import service.facility.impl.FacilityService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityService();
    private IRentTypeRepository rentTypeRepository = new RentTypeRepository();
    private IFacilityTypeRepository facilityTypeRepository = new FacilityTypeRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                searchFacility(request,response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
            case "edit":
                updateFacility(request, response);
                break;
            case "insert":
                insertFacility(request, response);
                break;
        }
    }

    private void searchFacility(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        String rentTypeId = request.getParameter("searchRentType");
        String facilityTypeId = request.getParameter("searchFacilityType");
        List<Facility> facilityList = facilityService.searchFacility(name,rentTypeId,facilityTypeId);
        request.setAttribute("facilityList",facilityList);
        List<RentType> rentTypeList = rentTypeRepository.selectAllRentType();
        request.setAttribute("rentTypeList",rentTypeList);
        List<FacilityType> facilityTypeList = facilityTypeRepository.selectAllFacilityType();
        request.setAttribute("facilityTypeList",facilityTypeList);
        try {
            request.getRequestDispatcher("/view/facility/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertFacility(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String standardRoom = request.getParameter("standardRoom");
        String description = request.getParameter("description");
        int poolArea = 0;
        String poolAreaStr = request.getParameter("poolArea");
        if (poolAreaStr != "") {
            poolArea = Integer.parseInt(poolAreaStr);
        }
        int numberOfFloor = 0;
        String numberOfFloorStr = request.getParameter("numberOfFloor");
        if (numberOfFloorStr != "") {
            numberOfFloor = Integer.parseInt(numberOfFloorStr);
        }
        String facilityFree = request.getParameter("facilityFree");

        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        RentType rentType = new RentType(rentTypeId);
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityIdType"));
        FacilityType facilityType = new FacilityType(facilityTypeId);
        Facility facility = new Facility(name,area,cost,maxPeople,standardRoom,description,poolArea,numberOfFloor,facilityFree,rentType,facilityType);
        boolean check = facilityService.insertFacility(facility);
        String mess = "Added Successfully!";
        if (!check){
            mess="Add Failed!";
        }
        request.getSession().setAttribute("mess",mess);
        //showList(request,response);
        response.sendRedirect("/facility");

    }

    private void updateFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String standardRoom = request.getParameter("standardRoom");
        String description = request.getParameter("description");
        int poolArea = Integer.parseInt(request.getParameter("poolArea"));
        int numberOfFloor = Integer.parseInt(request.getParameter("numberOfFloor"));
        String facilityFree = request.getParameter("facilityFree");
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        RentType rentType = new RentType(rentTypeId);
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        FacilityType facilityType = new FacilityType(facilityTypeId);
        Facility facility = new Facility(id, name, area, cost, maxPeople, standardRoom, description, poolArea, numberOfFloor, facilityFree, rentType, facilityType);
        boolean check = facilityService.updateFacilityById(facility);
        String mess = "Edited Successfully!";
        if (!check) {
            mess = "Edited Failed!";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = facilityService.deleteFacilityById(id);
        String mess = "Deleted Successfully!";
        if (!check) {
            mess = "Delete Failed!";
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
            case "add":
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.selectAllFacility();
        request.setAttribute("facilityList", facilityList);
        List<RentType> rentTypeList = rentTypeRepository.selectAllRentType();
        List<FacilityType> facilityTypeList = facilityTypeRepository.selectAllFacilityType();
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("facilityTypeList", facilityTypeList);
        try {
            request.getRequestDispatcher("/view/facility/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
