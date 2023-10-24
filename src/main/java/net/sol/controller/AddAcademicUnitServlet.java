package net.sol.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.AcademicUnitDao;
import net.sol.model.AcademicUnit;


@WebServlet("/add-academicUnit")
public class AddAcademicUnitServlet extends HttpServlet {
	private AcademicUnitDao academicUnitDao;
	
	public void init() {
		academicUnitDao = new AcademicUnitDao();
	}
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/academicUnit.jsp");
		dispatcherForm.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private List<AcademicUnit> getUnit(String unit,int id ){
		
		if(unit.equalsIgnoreCase("FACULTY")) {
			return academicUnitDao.getFacultiesByProgramme(id);
		}else if(unit.equalsIgnoreCase("PROGRAMME")) {
			return academicUnitDao.getProgrammes();
		}else if(unit.equalsIgnoreCase("DEPARTMENT")) {
			return academicUnitDao.getDepartmentsByFaculty(id);
		}
		return null;
	}
}
