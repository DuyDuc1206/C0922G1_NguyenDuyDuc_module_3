package controller;

import model.contract.Contract;
import service.contract.IContractService;
import service.contract.impl.ContractService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractServlet",value = "/contract")
public class ContractServlet extends HttpServlet {
    private IContractService iContractService = new ContractService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action ==null){
            action ="";
        }
        switch (action){
            default:
                showListContract(request,response);
                break;
        }
    }

    private void showListContract(HttpServletRequest request, HttpServletResponse response) {
        List<Contract> contractList = iContractService.selectAllContract();
        request.setAttribute("contractList",contractList);
        try {
            request.getRequestDispatcher("/view/contract/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
