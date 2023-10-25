package net.sol.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.AcademicUnitDao;
import net.sol.model.AcademicUnit;
import net.sol.model.Course;
import net.sol.model.CourseDefinition;
import net.sol.model.Semester;
import net.sol.model.Teacher;
import net.sol.util.Serializers;

@WebServlet("/filterByDepartment")
public class FilterByDepartmentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public FilterByDepartmentServlet() {
	        super();
	    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("coursesByDepartment");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String departmentIdStr = request.getParameter("id");
	    int id = Integer.parseInt(departmentIdStr);
	    AcademicUnitDao academicUnitDao = new AcademicUnitDao();
	    AcademicUnit department = academicUnitDao.getAcademicUnitById(id);

	    if (department != null) {
	        List<Course> courses = department.getCourses();
	        Gson gson = new GsonBuilder()
	        		.registerTypeAdapter(Course.class, new Serializers.CourseSerializer())
	        		.create();
	        String coursesJson = gson.toJson(courses);
	        response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	       out.print(coursesJson);
	    } else {
	        // Handle the case where the department is not found
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Set an appropriate HTTP status code
	        // You can also return an error JSON message
	        PrintWriter out = response.getWriter();
	        out.print("{\"error\": \"Department not found\"}");
	    }
	}
}
