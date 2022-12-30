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
            case "delete":
                deleteFacility(request,response);
                break;
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {

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
//        List<RentType> rentTypeList = rentTypeRepository.selectAllRentType();
//        List<FacilityType> facilityTypeList = facilityTypeRepository.selectAllFacilityType();
        request.setAttribute("facilityList", facilityList);
//        request.setAttribute("rentTypeList",rentTypeList);
//        request.setAttribute("facilityTypeList",facilityTypeList);
        try {
            request.getRequestDispatcher("/view/facility/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
