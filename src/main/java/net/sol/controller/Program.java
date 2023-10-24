package net.sol.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.AcademicUnitDao;
import net.sol.model.AcademicUnit;
import net.sol.model.EAcademicUnit;

import java.io.IOException;

@WebServlet("/program")
public class Program extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Program() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/program.jsp");
		dispatcherForm.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String program = request.getParameter("name");
		AcademicUnitDao academicUnitDao = new AcademicUnitDao();
		AcademicUnit academicUnit = new AcademicUnit();
		academicUnit.setName(program);
		academicUnit.setUnit(EAcademicUnit.PROGRAMME);
		academicUnitDao.saveAcademicUnit(academicUnit);
		doGet(request, response);
	}

}
