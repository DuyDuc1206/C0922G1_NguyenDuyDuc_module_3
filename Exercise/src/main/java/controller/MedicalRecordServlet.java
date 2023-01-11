package controller;

import model.MedicalRecord;
import model.Patient;
import repository.IPatientRepository;
import repository.impl.PatientRepository;
import service.IMedicalRecordService;
import service.impl.MedicalRecordService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MedicalRecordServlet", value = "/medicalRecord")
public class MedicalRecordServlet extends HttpServlet {
    private static IMedicalRecordService medicalRecordService = new MedicalRecordService();
    private static IPatientRepository patientRepository = new PatientRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                searchMedicalRecord(request,response);
                break;
            case "add":
                addMedicalRecord(request,response);
                break;
            case "edit":
                editMedicalRecord(request, response);
                break;
            case "delete":
                deleteMedicalRecord(request, response);
                break;
        }
    }

    private void searchMedicalRecord(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<MedicalRecord> medicalRecordList = medicalRecordService.searchMedicalRecord(name);
        request.setAttribute(" medicalRecordList", medicalRecordList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addMedicalRecord(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        Patient patient = new Patient(patientId);
        String hospitalizedDate = request.getParameter("hospitalizedDate");
        String dischargedDate = request.getParameter("dischargedDate");
        String reason = request.getParameter("reason");
        MedicalRecord medicalRecord = new MedicalRecord(name,patient,hospitalizedDate,dischargedDate,reason);
        boolean check = medicalRecordService.addMedicalRecord(medicalRecord);
        String mess = "Added Successfully!";
        if (!check){
            mess = "Add Failed!";
        }
        request.getSession().setAttribute("mess",mess);
        response.sendRedirect("/medicalRecord");
    }

    private void editMedicalRecord(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        Patient patient = new Patient(patientId);
        String hospitalizedDate = request.getParameter("hospitalizedDate");
        String dischargedDate = request.getParameter("dischargedDate");
        String reason = request.getParameter("reason");
        MedicalRecord medicalRecord = new MedicalRecord(id, name, patient, hospitalizedDate, dischargedDate, reason);
        boolean check = medicalRecordService.editMedicalRecord(medicalRecord);
        String mess = "Edited Successfully!";
        if (!check) {
            mess = "Edit Failed";
        }
        request.setAttribute("mess", mess);
        showListMedicalRecord(request, response);
    }

    private void deleteMedicalRecord(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = medicalRecordService.deleteMedicalRecord(id);
        String mess = "Added Successfully!";
        if (!check) {
            mess = "Add Failed!";
        }
        request.setAttribute("mess", mess);
        showListMedicalRecord(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showListMedicalRecord(request, response);
                break;
        }
    }

    private void showListMedicalRecord(HttpServletRequest request, HttpServletResponse response) {
        List<MedicalRecord> medicalRecordList = medicalRecordService.selectAllMedicalRecord();
        request.setAttribute("medicalRecordList", medicalRecordList);
        List<Patient> patientList = patientRepository.selectAllPatient();
        request.setAttribute("patientList", patientList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
