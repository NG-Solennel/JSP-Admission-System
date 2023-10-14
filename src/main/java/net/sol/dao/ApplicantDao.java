package net.sol.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.Applicant;

public class ApplicantDao {
	public void saveApplicant(Applicant applicant) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(applicant);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
	
	public List<Applicant> getAllApplicants(){
		List<Applicant> applicants = new ArrayList<Applicant>();
		Session session = FactoryManager.getSessionFactory().openSession();
		 applicants = session.createQuery("FROM Applicant").list();
	  	session.close();
	  	return applicants;		
	}
	
	public Applicant getApplicantById(int Id) {
		Applicant applicant = null;
		try {
			Session session = FactoryManager.getSessionFactory().openSession();
			applicant = (Applicant) session.get(Applicant.class, Id);
			return applicant;
		} catch (Exception e) {
			e.printStackTrace();
		}
				return applicant;
	}
}
