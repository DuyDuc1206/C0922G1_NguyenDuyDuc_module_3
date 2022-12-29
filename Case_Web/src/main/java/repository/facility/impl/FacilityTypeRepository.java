package repository.facility.impl;

import model.facility.FacilityType;
import repository.BaseRepository;
import repository.facility.IFacilityTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository implements IFacilityTypeRepository {
    private final String SELECT_FACILITY_TYPE = "select * from facility_type;";

    @Override
    public List<FacilityType> selectAllFacilityType() {
        List<FacilityType> facilityTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_FACILITY_TYPE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("facility_type_id");
                String name = rs.getString("facility_type_name");
                FacilityType facilityType = new FacilityType(id,name);
                facilityTypeList.add(facilityType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityTypeList;
    }
}
