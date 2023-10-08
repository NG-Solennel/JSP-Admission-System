package net.sol.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.Applicant;

public class ApplicantDao {
	public void saveApplicant(Applicant applicant) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(applicant);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
