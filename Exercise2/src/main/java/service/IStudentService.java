package service;

import model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> selectAllStudent();
    boolean deleteStudent(int id);
    List<Student> searchStudent(String name,String classId);
}
