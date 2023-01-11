package service;

import model.MedicalRecord;

import java.util.List;

public interface IMedicalRecordService {
    List<MedicalRecord> selectAllMedicalRecord();
    boolean deleteMedicalRecord(int id);
    boolean editMedicalRecord(MedicalRecord medicalRecord);
    boolean addMedicalRecord(MedicalRecord medicalRecord);
    List<MedicalRecord> searchMedicalRecord(String name);
}
