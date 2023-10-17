package net.sol.controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/coursesByDepartment")
public class CoursesByDepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CoursesByDepartmentServlet() {
	        super();
	    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("coursesByDepartment");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/coursesByDepartment.jsp");
		dispatcherForm.forward(request, response);
	}
}
