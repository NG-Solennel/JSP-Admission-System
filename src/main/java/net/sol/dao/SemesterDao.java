package net.sol.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.Semester;

public class SemesterDao {
	public void saveSemester(Semester semester) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(semester);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
	public List<Semester> getAllSemesters(){
		List<Semester> semesters;
		Session session = FactoryManager.getSessionFactory().openSession();
		 semesters = session.createQuery("FROM Semester").list();
	  	session.close();
	  	return semesters;		
	}
}
