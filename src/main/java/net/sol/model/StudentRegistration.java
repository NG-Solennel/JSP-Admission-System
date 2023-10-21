package net.sol.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

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
	
	public StudentRegistration() {
		this.date = LocalDate.now();
	}

	public StudentRegistration(Learner student, ERegistrationStatus status, Semester semester) {
		this.student = student;
		this.date = LocalDate.now();
		this.status = status;
		this.semester = semester;
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
	
	
}
