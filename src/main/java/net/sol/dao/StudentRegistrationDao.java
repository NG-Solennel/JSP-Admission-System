package net.sol.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.StudentRegistration;

public class StudentRegistrationDao {
	public void addStudentRegistration(StudentRegistration studentRegistration) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(studentRegistration);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
	public StudentRegistration getStudentRegistrationById(int id) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            StudentRegistration studentRegistration = (StudentRegistration)session.get(StudentRegistration.class, id);
            return studentRegistration;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
		return null;
    }
	public List<StudentRegistration> getAllRegistrations(){
		List<StudentRegistration> registrations;
		Session session = FactoryManager.getSessionFactory().openSession();
		 registrations = session.createQuery("FROM StudentRegistration").list();
	  	session.close();
	  	return registrations;		
	}
}
