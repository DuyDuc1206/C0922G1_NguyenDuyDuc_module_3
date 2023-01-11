package service.facility.impl;

import model.facility.Facility;

import repository.facility.IFacilityRepository;
import repository.facility.impl.FacilityRepository;

import service.facility.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<Facility> selectAllFacility() {
        return facilityRepository.selectAllFacility();
    }

    @Override
    public boolean deleteFacilityById(int id) {
        return facilityRepository.deleteFacilityById(id);
    }

    @Override
    public boolean updateFacilityById(Facility facility) {
        return facilityRepository.updateFacilityById(facility);
    }

    @Override
    public boolean insertFacility(Facility facility) {
        return facilityRepository.insertFacility(facility);
    }

    @Override
    public List<Facility> searchFacility(String name, String rentTypeId, String facilityTypeId) {
        return facilityRepository.searchFacility(name,rentTypeId,facilityTypeId);
    }

}
