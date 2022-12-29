package repository.facility.impl;

import model.facility.RentType;
import repository.BaseRepository;
import repository.facility.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {
    private final String SELECT_ALL_RENT_TYPE = "select * from rent_type;";

    @Override
    public List<RentType> selectAllRentType() {
        List<RentType> rentTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_RENT_TYPE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("rent_type_id");
                String name = rs.getString("rent_type_name");
                RentType rentType = new RentType(id,name);
                rentTypeList.add(rentType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rentTypeList;
    }
}
