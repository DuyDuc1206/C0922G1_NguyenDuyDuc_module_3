package service.contract;

import model.contract.Contract;

import java.util.List;

public interface IContractService {
    List<Contract> selectAllContract();
}
