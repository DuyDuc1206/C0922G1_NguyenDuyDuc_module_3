package repository.employee.impl;

import model.employee.EducationDegree;
import repository.BaseRepository;
import repository.employee.IEducationDegreeRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements IEducationDegreeRepository {
    private static final String SELECT_ALL_EDUCATION_DEGREE = "call get_all_education_degree();";
    @Override
    public List<EducationDegree> selectAllEducationDegree() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement cs = connection.prepareCall(SELECT_ALL_EDUCATION_DEGREE);
            ResultSet rs = cs.executeQuery();
            while (rs.next()){
                int id = rs.getInt("education_degree_id");
                String name = rs.getString("education_degree_name");
                EducationDegree educationDegree = new EducationDegree(id,name);
                educationDegreeList.add(educationDegree);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return educationDegreeList;
    }
}
