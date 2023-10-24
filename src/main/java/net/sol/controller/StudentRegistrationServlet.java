package net.sol.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.AcademicUnitDao;
import net.sol.dao.SemesterDao;
import net.sol.dao.StudentDao;
import net.sol.dao.StudentRegistrationDao;
import net.sol.model.AcademicUnit;
import net.sol.model.ERegistrationStatus;
import net.sol.model.Semester;
import net.sol.model.Learner;
import net.sol.model.StudentRegistration;

@WebServlet("/student-registration")
public class StudentRegistrationServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	public StudentRegistrationServlet(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		UtilFunctions.SeedAcademicUnit();
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/studentRegistration.jsp");
		dispatcherForm.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String semesterId = request.getParameter("semester");
		String departmentId = request.getParameter("department");
		StudentDao studentDao = new StudentDao();
		AcademicUnitDao academicUnitDao = new AcademicUnitDao();
		AcademicUnit department  = academicUnitDao.getAcademicUnitById(Integer.parseInt(departmentId));
		Learner student = studentDao.getStudentById(Integer.parseInt(id));
		SemesterDao semesterDao = new SemesterDao();
		Semester semester = semesterDao.getSemesterById(Integer.parseInt(semesterId));
		StudentRegistrationDao studentRegistrationDao = new StudentRegistrationDao();
		if(studentRegistrationDao.studentRegistrationExists(semester, student)) {
			doGet(request,response);
		}else {			
		StudentRegistration studentRegistration = new StudentRegistration(student,ERegistrationStatus.PENDING,semester,department);
		studentRegistrationDao.addStudentRegistration(studentRegistration);
		doGet(request, response);
		}
	}
}
