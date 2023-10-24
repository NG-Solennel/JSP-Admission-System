package net.sol.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class StudentCourse implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="Id")
    private int id;	
	@ManyToOne
	private Course course;
	@ManyToOne
	private StudentRegistration studentRegistration;
	
	@Column(name = "credits", columnDefinition = "INT DEFAULT 3")
	private int credits;

	private BigDecimal results;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public StudentRegistration getStudentRegistration() {
		return studentRegistration;
	}

	public void setStudentRegistration(StudentRegistration studentRegistration) {
		this.studentRegistration = studentRegistration;
	}

	public int getCredits() {
		return credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}

	public BigDecimal getResults() {
		return results;
	}

	public void setResults(BigDecimal results) {
		this.results = results;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
