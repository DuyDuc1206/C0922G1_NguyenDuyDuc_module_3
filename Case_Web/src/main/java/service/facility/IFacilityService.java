package service.facility;

import model.facility.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> selectAllFacility();
    boolean deleteFacilityById(int id);
    boolean updateFacilityById(Facility facility);
    boolean insertFacility(Facility facility);
}
