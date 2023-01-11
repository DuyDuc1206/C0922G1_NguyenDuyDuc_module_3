package repository.employee.impl;

import com.sun.org.apache.xpath.internal.operations.Div;
import model.employee.Division;
import repository.BaseRepository;
import repository.employee.IDivisionRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {
    private static final String SELECT_ALL_DIVISION = "call get_all_division();";
    @Override
    public List<Division> selectAllDivision() {
        List<Division> divisionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement cs = connection.prepareCall(SELECT_ALL_DIVISION);
            ResultSet rs = cs.executeQuery();
            while (rs.next()){
                int id = rs.getInt("division_id");
                String name = rs.getString("division_name");
                Division division = new Division(id,name);
                divisionList.add(division);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return divisionList;
    }
}
