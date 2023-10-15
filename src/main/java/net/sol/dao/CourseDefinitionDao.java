package net.sol.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.CourseDefinition;
import net.sol.model.Student;

public class CourseDefinitionDao {
	public void saveCourseDefinition(CourseDefinition courseDefinition) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(courseDefinition);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
	public List<CourseDefinition> getCourseDefinitions(){
		List<CourseDefinition> courses;
		Session session = FactoryManager.getSessionFactory().openSession();
		 courses = session.createQuery("FROM CourseDefinition").list();
	  	session.close();
	  	return courses;		
	}
}
