package net.sol.controller;

import java.io.IOException;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.CourseDao;
import net.sol.dao.StudentCourseDao;
import net.sol.dao.StudentRegistrationDao;
import net.sol.model.Course;
import net.sol.model.StudentCourse;
import net.sol.model.StudentRegistration;

@WebServlet("/add-student-course")
public class AddStudentCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddStudentCourseServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/addStudentCourse.jsp");
		dispatcherForm.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			StudentRegistrationDao studentRegistrationDao = new StudentRegistrationDao();
			CourseDao courseDao = new CourseDao();
			StudentRegistration stReg = studentRegistrationDao.getStudentRegistrationById(Integer.parseInt(request.getParameter("regId")));
			Course course = courseDao.getCourseById(Integer.parseInt(request.getParameter("courses")));
			StudentCourse stCourse = new StudentCourse();
			stCourse.setCourse(course);
			stCourse.setStudentRegistration(stReg);
			stCourse.setCredits(Integer.parseInt(request.getParameter("credits")));
			StudentCourseDao studentCourseDao = new StudentCourseDao();
		   boolean exists = studentCourseDao.studentCourseExists(stReg, course);
		   if(exists) {
			   RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/addStudentCourse.jsp");
				dispatcherForm.forward(request, response);
		   }else {			   
			   studentCourseDao.saveStudentCourse(stCourse);
			   RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/studentCourse.jsp");
			   dispatcherForm.forward(request, response);
		   }
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
}
