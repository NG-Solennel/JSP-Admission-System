package net.sol.dao;


import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.Admin;
import net.sol.model.User;


public class UserDao {

    public void saveUser(User user) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(user);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public boolean validate(String email, String password) {

        Transaction transaction = null;
        User user = null;
        try  {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            user = (User) session.createQuery("FROM User U WHERE U.email = :email").setParameter("email", email)
                .uniqueResult();
            if (user != null && user.getPassword().equals(password)) {
                return true;
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean isAdmin(String email) {
    	Transaction transaction = null;
        Admin admin = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            admin = (Admin) session.createQuery("FROM Admin U WHERE U.email = :email").setParameter("email", email)
                    .uniqueResult();
            if (admin != null) {
                return true;
            }
            transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
		}
        return false;
    }

}

