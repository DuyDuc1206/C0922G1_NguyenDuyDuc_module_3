package repository.impl;

import model.MedicalRecord;
import model.Patient;
import repository.BaseRepository;
import repository.IMedicalRecordRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MedicalRecordRepository implements IMedicalRecordRepository {
    private static final String SELECT_MEDICAL_RECORD = "call get_all_medical_record();";
    private static final String DELETE_MEDICAL_RECORD = "call delete_medical_record(?);";
    private static final String EDIT_MEDICAL_RECORD = " call edit_medical_record(?,?,?,?,?,?);";
    private static final String ADD_MEDICAL_RECORD = "call add_medical_record(?,?,?,?,?);";
    private static final String SEARCH_MEDICAL_RECORD = "call search_medical_record (?);";

    @Override
    public List<MedicalRecord> selectAllMedicalRecord() {
        List<MedicalRecord> medicalRecordList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectionDB();
        try {
            CallableStatement cs = connection.prepareCall(SELECT_MEDICAL_RECORD);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("medical_record_id");
                String name = rs.getString("medical_record_name");
                int patientId = rs.getInt("patient_id");
                String patientName = rs.getString("patient_name");
                Patient patient = new Patient(patientId, patientName);
                String hospitalizedDate = rs.getString("hospitalized_date");
                String dischargedDate = rs.getString("discharged_date");
                String reason = rs.getString("reason");
                MedicalRecord medicalRecord = new MedicalRecord(id, name, patient, hospitalizedDate, dischargedDate, reason);
                medicalRecordList.add(medicalRecord);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return medicalRecordList;
    }

    @Override
    public boolean deleteMedicalRecord(int id) {
        Connection connection = BaseRepository.getConnectionDB();
        try {
            CallableStatement cs = connection.prepareCall(DELETE_MEDICAL_RECORD);
            cs.setInt(1, id);
            return cs.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editMedicalRecord(MedicalRecord medicalRecord) {
        Connection connection = BaseRepository.getConnectionDB();
        try {
            CallableStatement cs = connection.prepareCall(EDIT_MEDICAL_RECORD);
            cs.setString(1,medicalRecord.getName());
            cs.setInt(2,medicalRecord.getPatient().getId());
            cs.setString(3,medicalRecord.getHospitalizedDate());
            cs.setString(4,medicalRecord.getDischargedDate());
            cs.setString(5,medicalRecord.getReason());
            cs.setInt(6,medicalRecord.getId());
            return cs.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean addMedicalRecord(MedicalRecord medicalRecord) {
        Connection connection= BaseRepository.getConnectionDB();
        try {
            CallableStatement cs = connection.prepareCall(ADD_MEDICAL_RECORD);
            cs.setString(1,medicalRecord.getName());
            cs.setInt(2,medicalRecord.getPatient().getId());
            cs.setString(3,medicalRecord.getHospitalizedDate());
            cs.setString(4,medicalRecord.getDischargedDate());
            cs.setString(5,medicalRecord.getReason());
            return cs.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<MedicalRecord> searchMedicalRecord(String name) {
        List<MedicalRecord> medicalRecordList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectionDB();
        try {
            CallableStatement cs = connection.prepareCall(SEARCH_MEDICAL_RECORD);
            cs.setString(1,name + "%");
            ResultSet rs = cs.executeQuery();
            while (rs.next()){
                int id = rs.getInt("medical_record_id");
                String nameSearch = rs.getString("medical_record_name");
                int patientId = rs.getInt("patient_id");
                String patientName = rs.getString("patient_name");
                Patient patient = new Patient(patientId, patientName);
                String hospitalizedDate = rs.getString("hospitalized_date");
                String dischargedDate = rs.getString("discharged_date");
                String reason = rs.getString("reason");
                MedicalRecord medicalRecord = new MedicalRecord(id, nameSearch, patient, hospitalizedDate, dischargedDate, reason);
                medicalRecordList.add(medicalRecord);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return medicalRecordList;
    }
}
