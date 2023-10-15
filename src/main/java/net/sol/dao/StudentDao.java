package net.sol.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.Student;

public class StudentDao {
	public void saveStudent(Student student) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(student);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
	
	public List<Student> getAllStudents(){
		List<Student> applicants = new ArrayList<Student>();
		Session session = FactoryManager.getSessionFactory().openSession();
		 applicants = session.createQuery("FROM Student").list();
	  	session.close();
	  	return applicants;		
	}
	
	public Student getStudentById(int Id) {
		Student applicant = null;
		try {
			Session session = FactoryManager.getSessionFactory().openSession();
			applicant = (Student) session.get(Student.class, Id);
			return applicant;
		} catch (Exception e) {
			e.printStackTrace();
		}
				return applicant;
	}
}
