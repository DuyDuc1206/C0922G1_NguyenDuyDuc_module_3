package repository;

import model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> selectAllStudent();
    boolean deleteStudent(int id);
    List<Student> searchStudent(String name,String classId);
}
