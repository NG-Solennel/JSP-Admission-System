package net.sol.controller;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.TeacherDao;
import net.sol.model.EQualification;
import net.sol.model.Teacher;


@WebServlet("/teacher")
public class TeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TeacherDao teacherDao = null;

	public void init() {
		teacherDao = new TeacherDao();
	}
	
    public TeacherServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/teacher.jsp");
		dispatcherForm.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String teacherName = request.getParameter("name");
		String teacherCode = request.getParameter("code");
		String qualificationParam = request.getParameter("qualification");
		EQualification qualification = EQualification.valueOf(qualificationParam);
		Teacher teacher = new Teacher(teacherCode,teacherName,qualification);
		teacherDao.saveTeacher(teacher);
		response.sendRedirect("teacher");
	}
}
