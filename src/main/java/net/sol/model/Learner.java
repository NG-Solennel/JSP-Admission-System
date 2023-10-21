package net.sol.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
public class Learner implements Serializable {
	
	private static final long serialVersionUID = 2L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="Id")
    private int id;	
	
	@Column(name="Name")
    private String name;
	
	@Column(name="Email")
    private String email;
    
	@Column(name="Guardian_name")
    private String guardianName;
    
	@Column(name="Guardian_Email")
    private String guardianEmail;
    
	@Column(name="Age")
    private int age;
 
	@ManyToOne
   private AcademicUnit department;
   
	@Column(name="Status")
   private String status;
   
	@Column(name="Suggestions")
   private String suggestions;
   
	@Lob
	@Column(name="Photo")
   private byte[] photo;
   
	@Lob
	@Column(name="Diploma")
   private char[] diploma;
	
	@OneToMany(mappedBy="student")
	private List<StudentRegistration> registrations;
	
	

	public Learner() {
	}



	public Learner( String name, String email, String guardianName, String guardianEmail, int age,
			AcademicUnit department, String status, String suggestions, byte[] photo, char[] diploma) {
		this.name = name;
		this.email = email;
		this.guardianName = guardianName;
		this.guardianEmail = guardianEmail;
		this.age = age;
		this.department = department;
		this.status = status;
		this.suggestions = suggestions;
		this.photo = photo;
		this.diploma = diploma;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getGuardianName() {
		return guardianName;
	}



	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
	}



	public String getGuardianEmail() {
		return guardianEmail;
	}



	public void setGuardianEmail(String guardianEmail) {
		this.guardianEmail = guardianEmail;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	public AcademicUnit getDepartment() {
		return department;
	}



	public void setDepartment(AcademicUnit department) {
		this.department = department;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getSuggestions() {
		return suggestions;
	}



	public void setSuggestions(String suggestions) {
		this.suggestions = suggestions;
	}



	public byte[] getPhoto() {
		return photo;
	}



	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}



	public char[] getDiploma() {
		return diploma;
	}



	public void setDiploma(char[] diploma) {
		this.diploma = diploma;
	}



	public List<StudentRegistration> getRegistrations() {
		return registrations;
	}



	public void setRegistrations(List<StudentRegistration> registrations) {
		this.registrations = registrations;
	}

	
	

}
