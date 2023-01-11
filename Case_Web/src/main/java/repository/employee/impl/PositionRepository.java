package repository.employee.impl;

import model.employee.Position;
import repository.BaseRepository;
import repository.employee.IPositionRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    private static final String SELECT_ALL_POSITION = "call get_all_position();";
    @Override
    public List<Position> selectAllPosition() {
        List<Position> positionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement cs = connection.prepareCall(SELECT_ALL_POSITION);
            ResultSet rs = cs.executeQuery();
            while (rs.next()){
                int id = rs.getInt("position_id");
                String name = rs.getString("position_name");
                Position position = new Position(id,name);
                positionList.add(position);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return positionList;
    }
}
