package repository.facility;

import model.facility.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> selectAllFacility();
}
