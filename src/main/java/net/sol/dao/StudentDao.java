package net.sol.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.Learner;


public class StudentDao {
	public void saveStudent(Learner student) {
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
	
	public List<Learner> getAllStudents(){
		List<Learner> applicants = new ArrayList<Learner>();
		Session session = FactoryManager.getSessionFactory().openSession();
		 applicants = session.createQuery("FROM Learner").list();
	  	session.close();
	  	return applicants;		
	}
	
	public Learner getStudentById(int Id) {
		Learner applicant = null;
		try {
			Session session = FactoryManager.getSessionFactory().openSession();
			applicant = (Learner) session.get(Learner.class, Id);
			return applicant;
		} catch (Exception e) {
			e.printStackTrace();
		}
				return applicant;
	}
}
