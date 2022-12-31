package repository.facility.impl;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import repository.BaseRepository;
import repository.facility.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String SELECT_FACILITY = "select f.*, rt.*,ft.* from facility as f \n" +
            "join facility_type as ft on ft.facility_type_id = f.facility_type_id\n" +
            "join rent_type as rt on rt.rent_type_id = f.rent_type_id;";
    private final String DELETE_FACILITY = "delete from facility where facility_id = ?;";

    @Override
    public List<Facility> selectAllFacility() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_FACILITY);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("facility_id");
                String name = rs.getString("facility_name");
                int area = rs.getInt("area");
                double cost = rs.getDouble("cost");
                int maxPeople = rs.getInt("max_people");
                String standardRoom = rs.getString("standard_room");
                String description = rs.getString("description_other_convenience");
                int poolArea = rs.getInt("pool_area");
                int numberOfFloor = rs.getInt("number_of_floor");
                String facilityFree = rs.getString("facility_free");
                int rentTypeId = rs.getInt("rent_type_id");
                String renTypeName = rs.getString("rent_type_name");
                int facilityTypeId = rs.getInt("facility_type_id");
                String facilityTypeName = rs.getString("facility_type_name");
                RentType rentType = new RentType(rentTypeId, renTypeName);
                FacilityType facilityType = new FacilityType(facilityTypeId, facilityTypeName);
                Facility facility = new Facility(id, name, area, cost, maxPeople, standardRoom, description, poolArea, numberOfFloor, facilityFree, rentType, facilityType);
                facilityList.add(facility);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public boolean deleteFacilityById(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_FACILITY);
            ps.setInt(1, id);
            return ps.executeUpdate() >0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
