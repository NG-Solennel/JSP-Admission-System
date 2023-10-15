package net.sol.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.CourseDefinitionDao;
import net.sol.dao.StudentDao;
import net.sol.model.CourseDefinition;


@WebServlet("/allcourses")
public class AllCoursesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CourseDefinitionDao courseDefinitionDao;

	public void init() {
		courseDefinitionDao = new CourseDefinitionDao();
	}
	
    public AllCoursesServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/allcourses.jsp");
		dispatcherForm.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String courseName = request.getParameter("name");
		String courseCode = request.getParameter("code");
		String courseDescription = request.getParameter("description");
		CourseDefinition course = new CourseDefinition(courseCode,courseName,courseDescription);
		courseDefinitionDao.saveCourseDefinition(course);
		response.sendRedirect("allcourses");
	}
}
