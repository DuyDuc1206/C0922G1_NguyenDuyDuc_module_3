package service.impl;

import model.MedicalRecord;
import repository.IMedicalRecordRepository;
import repository.impl.MedicalRecordRepository;
import service.IMedicalRecordService;

import java.util.List;

public class MedicalRecordService implements IMedicalRecordService {
    private static IMedicalRecordRepository medicalRecordRepository = new MedicalRecordRepository();
    @Override
    public List<MedicalRecord> selectAllMedicalRecord() {
        return medicalRecordRepository.selectAllMedicalRecord();
    }

    @Override
    public boolean deleteMedicalRecord(int id) {
        return medicalRecordRepository.deleteMedicalRecord(id);
    }

    @Override
    public boolean editMedicalRecord(MedicalRecord medicalRecord) {
        return medicalRecordRepository.editMedicalRecord(medicalRecord);
    }

    @Override
    public boolean addMedicalRecord(MedicalRecord medicalRecord) {
        return medicalRecordRepository.addMedicalRecord(medicalRecord);
    }

    @Override
    public List<MedicalRecord> searchMedicalRecord(String name) {
        return medicalRecordRepository.searchMedicalRecord(name);
    }
}
