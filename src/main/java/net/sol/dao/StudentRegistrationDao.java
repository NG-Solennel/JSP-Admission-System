package net.sol.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.Learner;
import net.sol.model.Semester;
import net.sol.model.StudentCourse;
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
	
	public boolean studentRegistrationExists (Semester semester, Learner student) {
		Session session = FactoryManager.getSessionFactory().openSession();
		Query query = session.createQuery("FROM StudentRegistration C WHERE C.student = :student AND C.semester = :semester");
		query.setParameter("student", student);
		query.setParameter("semester", semester);
		List<StudentRegistration> registrations = query.list();
		if(registrations.size() > 0) {
			return true;
		}else {
			return false;
		}
	}
}
