package net.sol.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.AcademicUnit;
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
	public Semester getSemesterById(Integer id) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Semester semester = (Semester)session.get(Semester.class, id);
            return semester;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
		return null;
    }
	public List<Semester> getAllSemesters(){
		List<Semester> semesters;
		Session session = FactoryManager.getSessionFactory().openSession();
		 semesters = session.createQuery("FROM Semester").list();
	  	session.close();
	  	return semesters;		
	}
}
