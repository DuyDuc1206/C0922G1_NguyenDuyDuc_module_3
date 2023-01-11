package model;

public class Student {
    private int id;
    private String name;
    private String gender;
    private String email;
    private float point;
    private Class classStudent;

    public Student(String name, String gender, String email, float point, Class classStudent) {
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.point = point;
        this.classStudent = classStudent;
    }

    public Student(int id, String name, String gender, String email, float point, Class classStudent) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.point = point;
        this.classStudent = classStudent;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public float getPoint() {
        return point;
    }

    public void setPoint(float point) {
        this.point = point;
    }

    public Class getClassStudent() {
        return classStudent;
    }

    public void setClassStudent(Class classStudent) {
        this.classStudent = classStudent;
    }
}
