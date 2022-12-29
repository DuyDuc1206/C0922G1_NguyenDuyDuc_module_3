package repository.facility;

import model.facility.FacilityType;

import java.util.List;

public interface IFacilityTypeRepository {
    List<FacilityType> selectAllFacilityType();

}
