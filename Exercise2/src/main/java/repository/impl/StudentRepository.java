package repository.impl;

import model.Class;
import model.Student;
import repository.BaseRepository;
import repository.IStudentRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private static final String GET_ALL_STUDENT = "select s.*,c.* from student as s join class as c on c.class_id = s.class_id;";
    private static final String DELETE_STUDENT = "delete from student where student_id = ?;";
    private static final String SEARCH_STUDENT = " select s.*,c.* from student as s join class as c on c.class_id = s.class_id\n" +
            "   where c.class_id like ? and s.student_name like ?;";
    @Override
    public List<Student> selectAllStudent() {
        List<Student> studentList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectionDB();
        try {
            PreparedStatement ps = connection.prepareStatement(GET_ALL_STUDENT);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("student_id");
                String name = rs.getString("student_name");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                float point = rs.getFloat("point");
                int classId = rs.getInt("class_id");
                String className = rs.getString("class_name");
                Class classStudent =new Class(classId,className);
                Student student = new Student(id,name,gender,email,point,classStudent);
                studentList.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentList;
    }

    @Override
    public boolean deleteStudent(int id) {
        Connection connection = BaseRepository.getConnectionDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_STUDENT);
            ps.setInt(1,id);
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Student> searchStudent(String name, String classId) {
        List<Student> studentList = new ArrayList<>();
        Connection connection =BaseRepository.getConnectionDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_STUDENT);
            ps.setString(1,"%" + name + "%");
            ps.setString(1,"%" + classId + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("student_id");
                String nameSearch = rs.getString("student_name");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                float point = rs.getFloat("point");
                int classIdSearch = rs.getInt("class_id");
                String className = rs.getString("class_name");
                Class classStudent =new Class(classIdSearch,className);
                Student student = new Student(id,nameSearch,gender,email,point,classStudent);
                studentList.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentList;
    }
}
