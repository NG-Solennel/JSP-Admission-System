package net.sol.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.CourseDao;
import net.sol.dao.StudentCourseDao;
import net.sol.dao.StudentRegistrationDao;
import net.sol.model.AcademicUnit;
import net.sol.model.Course;
import net.sol.model.CourseDefinition;
import net.sol.model.Semester;
import net.sol.model.StudentCourse;
import net.sol.model.StudentRegistration;
import net.sol.model.Teacher;
import net.sol.util.Serializers;

@WebServlet("/get-student-course")
public class GetStudentCourse extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
	 
    public GetStudentCourse() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentRegistrationDao studentRegistrationDao = new StudentRegistrationDao();
   StudentRegistration studentRegistration = studentRegistrationDao.getStudentRegistrationById(Integer.parseInt(request.getParameter("regId")));
   StudentCourseDao studentCourseDao = new StudentCourseDao();
   List<StudentCourse> courses = studentCourseDao.getStudentCoursesByStudentRegistration(studentRegistration);
   Gson gson = new GsonBuilder()
   		.registerTypeAdapter(StudentCourse.class, new Serializers.StudentCourseSerializer())
   		.create();
   String coursesJson = gson.toJson(courses);
   response.setContentType("application/json");
   PrintWriter out = response.getWriter();
   out.print(coursesJson);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
