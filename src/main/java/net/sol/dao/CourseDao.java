package net.sol.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.Course;

public class CourseDao {
	public void saveCourse(Course course) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(course);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
	public Course getCourseById(Integer id) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Course course = (Course)session.get(Course.class, id);
            return course;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
		return null;
    }
	public List<Course> getCourses(){
		List<Course> courses;
		Session session = FactoryManager.getSessionFactory().openSession();
		 courses = session.createQuery("FROM Course").list();
	  	session.close();
	  	return courses;		
	}
}
