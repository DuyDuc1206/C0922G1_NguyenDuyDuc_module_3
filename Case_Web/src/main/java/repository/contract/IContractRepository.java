package repository.contract;

import model.contract.Contract;

import java.util.List;

public interface IContractRepository {
    List<Contract> selectAllContract();
}
