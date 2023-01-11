package repository.impl;

import model.Patient;
import repository.BaseRepository;
import repository.IPatientRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PatientRepository implements IPatientRepository {
    private static final String SELECT_PATIENT = "call get_all_patient();";
    @Override
    public List<Patient> selectAllPatient() {
        List<Patient> patientList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectionDB();
        try {
            CallableStatement cs = connection.prepareCall(SELECT_PATIENT);
            ResultSet rs = cs.executeQuery();
            while (rs.next()){
                int id = rs.getInt("patient_id");
                String name = rs.getString("patient_name");
                Patient patient = new Patient(id,name);
                patientList.add(patient);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return patientList;
    }
}
