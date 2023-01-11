package model;

public class MedicalRecord {
    private int id;
    private String name;
    private Patient patient;
    private String hospitalizedDate;
    private String dischargedDate;
    private String reason;

    public MedicalRecord(String name, Patient patient, String hospitalizedDate, String dischargedDate, String reason) {
        this.name = name;
        this.patient = patient;
        this.hospitalizedDate = hospitalizedDate;
        this.dischargedDate = dischargedDate;
        this.reason = reason;
    }

    public MedicalRecord(int id, String name, Patient patient, String hospitalizedDate, String dischargedDate, String reason) {
        this.id = id;
        this.name = name;
        this.patient = patient;
        this.hospitalizedDate = hospitalizedDate;
        this.dischargedDate = dischargedDate;
        this.reason = reason;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public String getHospitalizedDate() {
        return hospitalizedDate;
    }

    public void setHospitalizedDate(String hospitalizedDate) {
        this.hospitalizedDate = hospitalizedDate;
    }

    public String getDischargedDate() {
        return dischargedDate;
    }

    public void setDischargedDate(String dischargedDate) {
        this.dischargedDate = dischargedDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
