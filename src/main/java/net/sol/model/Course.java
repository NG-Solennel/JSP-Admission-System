package net.sol.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Course {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
	
	@ManyToOne
	private CourseDefinition courseDefinition;
	
	@ManyToOne
	private Semester semester;
	
	@ManyToMany
	private List<Teacher> tutor;

	public Course() {
		// TODO Auto-generated constructor stub
	}

	public Course(int id, CourseDefinition courseDefinition, Semester semester, List<Teacher> tutor) {
		this.id = id;
		this.courseDefinition = courseDefinition;
		this.semester = semester;
		this.tutor = tutor;
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

	public List<Teacher> getTutor() {
		return tutor;
	}

	public void setTutor(List<Teacher> tutor) {
		this.tutor = tutor;
	}
	
}