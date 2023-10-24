package net.sol.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.google.gson.annotations.Expose;

@Entity
public class Course implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
	
	@ManyToOne
	private CourseDefinition courseDefinition;
	
	@ManyToOne
	private Semester semester;
	
	@ManyToMany
	private List<Teacher> tutors;
	
	@ManyToMany
	private List<AcademicUnit> departments;
	
	@OneToMany(mappedBy="course")
	private List<StudentCourse> studentCourses;
	
	
	public Course() {
		// TODO Auto-generated constructor stub
	}

	public Course(int id, CourseDefinition courseDefinition, Semester semester, List<Teacher> tutors,List<AcademicUnit> departments,int credits) {
		this.id = id;
		this.courseDefinition = courseDefinition;
		this.semester = semester;
		this.tutors = tutors;
		this.departments = departments;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public CourseDefinition getCourseDefinition() {
		return courseDefinition;
	}

	public void setCourseDefinition(CourseDefinition courseDefinition) {
		this.courseDefinition = courseDefinition;
	}

	public Semester getSemester() {
		return semester;
	}

	public void setSemester(Semester semester) {
		this.semester = semester;
	}

	public List<Teacher> getTutors() {
		return tutors;
	}

	public void setTutors(List<Teacher> tutors) {
		this.tutors = tutors;
	}

	public List<AcademicUnit> getDepartments() {
		return departments;
	}

	public void setDepartments(List<AcademicUnit> departments) {
		this.departments = departments;
	}

	public List<StudentCourse> getStudentCourses() {
		return studentCourses;
	}

	public void setStudentCourses(List<StudentCourse> studentCourses) {
		this.studentCourses = studentCourses;
	}	
	
}