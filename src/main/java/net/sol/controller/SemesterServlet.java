package net.sol.controller;
import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.SemesterDao;
import net.sol.model.Semester;

@WebServlet("/semester")
public class SemesterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SemesterDao semesterDao = null;

	public void init() {
		semesterDao = new SemesterDao();
	}
	
    public SemesterServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/semester.jsp");
		dispatcherForm.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String semesterName = request.getParameter("name");
		LocalDate startDate = LocalDate.parse(request.getParameter("start-date"));
		LocalDate endDate = LocalDate.parse(request.getParameter("end-date"));
		Semester semester = new Semester(semesterName,startDate,endDate);
		semesterDao.saveSemester(semester);
		response.sendRedirect("semester");
	}
}
