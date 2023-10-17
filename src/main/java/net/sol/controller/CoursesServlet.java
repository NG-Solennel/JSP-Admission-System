package net.sol.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.AcademicUnitDao;
import net.sol.dao.CourseDao;
import net.sol.dao.SemesterDao;
import net.sol.model.AcademicUnit;
import net.sol.model.Course;
import net.sol.model.Semester;
import net.sol.model.Teacher;

@WebServlet("/courses")
public class CoursesServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
    public CoursesServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseDao courseDao = new CourseDao();
		List<Course> courses = courseDao.getCourses();
//		for(Course course:courses) {
//			System.out.println(course.getCourseDefinition().getName());
//			System.out.println(course.getSemester().getAcademicYear());
//			List<AcademicUnit> departments = course.getDepartments();
//			for(AcademicUnit department:departments) {
//				System.out.println(department.getName());
//			}
//			List<Teacher> tutors = course.getTutors();
//			for(Teacher tutor:tutors) {
//				System.out.println(tutor.getNames());
//				System.out.println(tutor.getQualification());
//			}
//		}
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/courses.jsp");
		dispatcherForm.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("courses");
	}
}
