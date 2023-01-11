package service.contract.impl;

import model.contract.Contract;
import repository.contract.IContractRepository;
import repository.contract.impl.ContractRepository;
import service.contract.IContractService;

import java.util.List;

public class ContractService implements IContractService {
    private IContractRepository contractRepository = new ContractRepository();
    @Override
    public List<Contract> selectAllContract() {
        return contractRepository.selectAllContract();
    }
}
