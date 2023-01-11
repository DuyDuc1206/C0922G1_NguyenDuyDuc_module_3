package repository.impl;

import model.Class;
import repository.BaseRepository;
import repository.IClassRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassRepository implements IClassRepository {
    private static final String GET_ALL_CLASS = " select * from class;";
    @Override
    public List<Class> selectAllClass() {
        List<Class> classList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectionDB();
        try {
            PreparedStatement ps = connection.prepareStatement(GET_ALL_CLASS);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("class_id");
                String name = rs.getString("class_name");
                Class classStudent = new Class(id,name);
                classList.add(classStudent);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return classList;
    }
}
