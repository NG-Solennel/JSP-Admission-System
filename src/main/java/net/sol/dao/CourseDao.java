package net.sol.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.Course;
import net.sol.model.Semester;

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
		 for (Course course : courses) {
		        // Initialize the collections before returning
		        Hibernate.initialize(course.getDepartments());
		        Hibernate.initialize(course.getTutors());
		        Hibernate.initialize(course.getStudentCourses());
		    }
	  	session.close();
	  	return courses;		
	}
	public List<Course> getCoursesBySemester(Semester semester){
		Session session = FactoryManager.getSessionFactory().openSession();
		Query query = session.createQuery("FROM Course C WHERE C.semester = :semester");
		query.setParameter("semester", semester);
		List<Course> courses = query.list();
		 for (Course course : courses) {
		        // Initialize the collections before returning
		        Hibernate.initialize(course.getDepartments());
		        Hibernate.initialize(course.getStudentCourses());
		        Hibernate.initialize(course.getTutors());
		    }
		 session.close();
		 return courses;
	}
}
