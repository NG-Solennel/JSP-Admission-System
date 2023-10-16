package net.sol.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.AcademicUnitDao;
import net.sol.dao.CourseDao;
import net.sol.dao.CourseDefinitionDao;
import net.sol.dao.SemesterDao;
import net.sol.dao.TeacherDao;
import net.sol.model.AcademicUnit;
import net.sol.model.Course;
import net.sol.model.CourseDefinition;
import net.sol.model.Semester;
import net.sol.model.Teacher;

@WebServlet("/addcourses")
public class AddCoursesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddCoursesServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/addcourses.jsp");
		dispatcherForm.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuilder sb = new StringBuilder();
	    String line;
	    try (BufferedReader reader = request.getReader()) {
	        while ((line = reader.readLine()) != null) {
	            sb.append(line);
	        }
	        String body = sb.toString();
	        
	        // parse JSON
	        JSONObject jsonObject = new JSONObject(body);
	        String semesterId = jsonObject.getString("semesterId");
	        String courseDefinitionCode = jsonObject.getString("courseDefinitionId");
	        JSONArray teacherArray = jsonObject.getJSONArray("teacherArray");
	        JSONArray departmentArray = jsonObject.getJSONArray("departmentArray");
	        List<JSONObject> teacherList = new ArrayList<>();
	        for (int i = 0; i < teacherArray.length(); i++) {
	            teacherList.add(teacherArray.getJSONObject(i));
	        }
	        List<JSONObject> departmentList = new ArrayList<>();
	        for (int i = 0; i < departmentArray.length(); i++) {
	            departmentList.add(departmentArray.getJSONObject(i));
	        }
	       SemesterDao semesterDao = new SemesterDao();
	       AcademicUnitDao academicUnitDao = new AcademicUnitDao();
	       CourseDefinitionDao courseDefinitionDao = new CourseDefinitionDao();
	       TeacherDao teacherDao = new TeacherDao();
	       CourseDao courseDao = new CourseDao();
	       Semester semester = semesterDao.getSemesterById(Integer.parseInt(semesterId));
	       CourseDefinition courseDefinition = courseDefinitionDao.getCourseDefinitionByCode(courseDefinitionCode);
	       List<Teacher> tutors = new ArrayList<>();
	       for(JSONObject teacherObj:teacherList) {
	    	   String teacherCode = teacherObj.getString("id");
	    	   Teacher teacher = teacherDao.getTeacherByCode(teacherCode);
	    	   tutors.add(teacher);
	       }
	       List<AcademicUnit> departments = new ArrayList<>();
	       for(JSONObject departmentObj: departmentList) {
	    	   Integer departmentId = Integer.parseInt(departmentObj.getString("id"));
	    	   System.out.println(departmentId);
	    	   AcademicUnit department = academicUnitDao.getAcademicUnitById(departmentId);
	    	   departments.add(department);
	       }
	      Course course = new Course();
	      course.setCourseDefinition(courseDefinition);
	      course.setDepartments(departments);
	      course.setSemester(semester);
	      course.setTutors(tutors);
	      courseDao.saveCourse(course);
	      response.sendRedirect("allcourses");
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
}
