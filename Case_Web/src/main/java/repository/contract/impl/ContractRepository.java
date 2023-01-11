package repository.contract.impl;

import model.contract.Contract;
import model.customer.Customer;
import model.employee.Employee;
import model.facility.Facility;
import repository.BaseRepository;
import repository.contract.IContractRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    private static final String SELECT_ALL_CONTRACT = "call get_contract;";

    @Override
    public List<Contract> selectAllContract() {
        List<Contract> contractList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement cs = connection.prepareCall(SELECT_ALL_CONTRACT);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("contract_id");
                String startDate = rs.getString("start_date");
                String endDate = rs.getString("end_date");
                double deposit = rs.getDouble("deposit");
                int employeeId = rs.getInt("employee_id");
                String employeeName = rs.getString("employee_name");
                Employee employee = new Employee(employeeId, employeeName);
                int customerId = rs.getInt("customer_id");
                String customerName = rs.getString("customer_name");
                Customer customer = new Customer(customerId,customerName);
                int facilityId = rs.getInt("facility_id");
                String facilityName = rs.getString("facility_name");
                Facility facility = new Facility(facilityId,facilityName);
                Contract contract = new Contract(id,startDate,endDate,deposit,employee,customer,facility);
                contractList.add(contract);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return contractList;
    }
}
