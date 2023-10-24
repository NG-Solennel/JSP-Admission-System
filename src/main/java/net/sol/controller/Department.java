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

@WebServlet("/department")
public class Department extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Department() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/department.jsp");
		dispatcherForm.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String department = request.getParameter("name");
		String facultyId = request.getParameter("faculty");
		AcademicUnitDao academicUnitDao = new AcademicUnitDao();
		AcademicUnit academicUnit = new AcademicUnit();
		academicUnit.setName(department);
		academicUnit.setUnit(EAcademicUnit.DEPARTMENT);
		academicUnit.setParentId(Integer.parseInt(facultyId));
		academicUnitDao.saveAcademicUnit(academicUnit);
		doGet(request, response);
	}

}
