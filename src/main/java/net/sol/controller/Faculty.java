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

@WebServlet("/faculty")
public class Faculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Faculty() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/faculty.jsp");
		dispatcherForm.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String faculty = request.getParameter("name");
		String programId = request.getParameter("program");
		AcademicUnitDao academicUnitDao = new AcademicUnitDao();
		AcademicUnit academicUnit = new AcademicUnit();
		academicUnit.setName(faculty);
		academicUnit.setUnit(EAcademicUnit.FACULTY);
		academicUnit.setParentId(Integer.parseInt(programId));
		academicUnitDao.saveAcademicUnit(academicUnit);
		doGet(request, response);
	}

}
