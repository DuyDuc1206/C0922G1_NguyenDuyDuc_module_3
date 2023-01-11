package model.contract;

public class ContractDetail {
    private int id;
    private int quantity;
    private Contract contract;
    private AttachFacility attachFacility;

    public ContractDetail() {
    }

    public ContractDetail(int id, int quantity, Contract contract, AttachFacility attachFacility) {
        this.id = id;
        this.quantity = quantity;
        this.contract = contract;
        this.attachFacility = attachFacility;
    }

    public ContractDetail(int quantity, Contract contract, AttachFacility attachFacility) {
        this.quantity = quantity;
        this.contract = contract;
        this.attachFacility = attachFacility;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public AttachFacility getAttachFacility() {
        return attachFacility;
    }

    public void setAttachFacility(AttachFacility attachFacility) {
        this.attachFacility = attachFacility;
    }
}
