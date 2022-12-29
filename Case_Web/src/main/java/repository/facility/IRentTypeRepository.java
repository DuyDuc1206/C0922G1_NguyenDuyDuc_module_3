package repository.facility;

import model.facility.RentType;

import java.util.List;

public interface IRentTypeRepository {
    List<RentType> selectAllRentType();
}
