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
}
