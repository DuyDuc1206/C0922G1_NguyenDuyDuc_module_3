package repository;

import model.MedicalRecord;

import java.beans.Customizer;
import java.util.List;

public interface IMedicalRecordRepository {
    List<MedicalRecord> selectAllMedicalRecord();

    boolean deleteMedicalRecord(int id);

    boolean editMedicalRecord(MedicalRecord medicalRecord);
    boolean addMedicalRecord(MedicalRecord medicalRecord);
    List<MedicalRecord> searchMedicalRecord(String name);
}
