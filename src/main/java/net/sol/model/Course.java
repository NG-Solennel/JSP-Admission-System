package net.sol.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import com.google.gson.annotations.Expose;

@Entity
public class Course {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Expose
    private int id;
	
	@ManyToOne
	@Expose
	private CourseDefinition courseDefinition;
	
	@ManyToOne
	@Expose
	private Semester semester;
	
	@ManyToMany
	@Expose
	private List<Teacher> tutors;
	
	@ManyToMany
	@Expose
	private List<AcademicUnit> departments;
	
	@Column(name = "credits", columnDefinition = "INT DEFAULT 3")
	private int credits;

	public Course() {
		// TODO Auto-generated constructor stub
	}

	public Course(int id, CourseDefinition courseDefinition, Semester semester, List<Teacher> tutors,List<AcademicUnit> departments,int credits) {
		this.id = id;
		this.courseDefinition = courseDefinition;
		this.semester = semester;
		this.tutors = tutors;
		this.departments = departments;
		this.credits = credits;
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

	public int getCredits() {
		return credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}
	
	
	
}