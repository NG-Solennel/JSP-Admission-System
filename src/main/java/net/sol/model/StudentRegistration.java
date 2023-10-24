package net.sol.model;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class StudentRegistration {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="Id")
    private int id;	
	
	@ManyToOne
	private Learner student;
	private LocalDate date;
	private ERegistrationStatus status;
	@ManyToOne
	private Semester semester;
	
	@ManyToOne
	private AcademicUnit department;
	
	@OneToMany(mappedBy="studentRegistration")
	private List<StudentCourse> studentCourses;
	
	public StudentRegistration() {
		this.date = LocalDate.now();
	}

	public StudentRegistration(Learner student,  ERegistrationStatus status, Semester semester,
			AcademicUnit department) {
		this.student = student;
		this.date = LocalDate.now();;
		this.status = status;
		this.semester = semester;
		this.department = department;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Learner getStudent() {
		return student;
	}

	public void setStudent(Learner student) {
		this.student = student;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public ERegistrationStatus getStatus() {
		return status;
	}

	public void setStatus(ERegistrationStatus status) {
		this.status = status;
	}

	public Semester getSemester() {
		return semester;
	}

	public void setSemester(Semester semester) {
		this.semester = semester;
	}

	public AcademicUnit getDepartment() {
		return department;
	}

	public void setDepartment(AcademicUnit department) {
		this.department = department;
	}

	
	
	
	
}
