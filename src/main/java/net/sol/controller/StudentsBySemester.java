package net.sol.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.AcademicUnitDao;
import net.sol.dao.SemesterDao;
import net.sol.model.AcademicUnit;
import net.sol.model.EAcademicUnit;
import net.sol.model.Semester;
import net.sol.model.StudentRegistration;
import net.sol.util.Serializers;
@WebServlet("/studentsBySemester")
public class StudentsBySemester extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 
    public StudentsBySemester() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/studentsSemester.jsp");
		dispatcherForm.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String semesterId = request.getParameter("id");
		SemesterDao semesterDao = new SemesterDao();
		Semester semester = semesterDao.getSemesterById(Integer.parseInt(semesterId));
		List<StudentRegistration> regs = semester.getRegistrations();
		Gson gson = new GsonBuilder()
				.registerTypeAdapter(StudentRegistration.class, new Serializers.StudentRegistrationSerializer())
				.create();
		String regsJson = gson.toJson(regs);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
       out.print(regsJson);
	}
}
