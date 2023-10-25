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
import net.sol.dao.CourseDao;
import net.sol.model.Course;
import net.sol.model.StudentCourse;
import net.sol.util.Serializers;
@WebServlet("/studentsByCourse")
public class StudentsByCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 
    public StudentsByCourse() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/studentsByCourse.jsp");
		dispatcherForm.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String courseId = request.getParameter("id");
		CourseDao courseDao = new CourseDao();
		Course course = courseDao.getCourseById(Integer.parseInt(courseId));
		List<StudentCourse> stCourses = course.getStudentCourses();
		Gson gson = new GsonBuilder()
				.registerTypeAdapter(StudentCourse.class, new Serializers.StudentCourseSerializer())
				.create();
		String regsJson = gson.toJson(stCourses);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
       out.print(regsJson);
	}
}
