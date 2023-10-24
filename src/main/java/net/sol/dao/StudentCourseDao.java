package net.sol.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.Course;
import net.sol.model.Semester;
import net.sol.model.StudentCourse;
import net.sol.model.StudentRegistration;

public class StudentCourseDao {
	public void saveStudentCourse(StudentCourse studentCourse) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(studentCourse);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
	public StudentCourse getStudentCourseById(Integer id) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            StudentCourse studentCourse = (StudentCourse)session.get(StudentCourse.class, id);
            return studentCourse;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
		return null;
    }
	public List<StudentCourse> getStudentCoursesByStudentRegistration(StudentRegistration registration){
		List<StudentCourse> studentCourses;
		Session session = FactoryManager.getSessionFactory().openSession();
		 Query query = session.createQuery("FROM StudentCourse C WHERE C.studentRegistration = :registration");
		 query.setParameter("registration", registration);
		 studentCourses = query.list();
		 for (StudentCourse studentCourse : studentCourses) {
		        Hibernate.initialize(studentCourse.getCourse());
		        Hibernate.initialize(studentCourse.getStudentRegistration());
		        Hibernate.initialize(studentCourse.getCourse().getTutors());
		        Hibernate.initialize(studentCourse.getCourse().getDepartments());
		    }

	  	session.close();
	  	return studentCourses;		
	}
	public Boolean studentCourseExists(StudentRegistration stReg,Course course){
		Session session = FactoryManager.getSessionFactory().openSession();
		Query query = session.createQuery("FROM StudentCourse C WHERE C.studentRegistration = :studentRegistration AND C.course = :course");
		query.setParameter("studentRegistration", stReg);
		query.setParameter("course", course);
		List<StudentCourse> studentCourses = query.list();
//		 for (StudentCourse studentCourse : studentCourses) {
//		        Hibernate.initialize(studentCourse.getCourse());
//		        Hibernate.initialize(studentCourse.getStudentRegistration());
//		        Hibernate.initialize(studentCourse.getCourse().getTutors());
//		        Hibernate.initialize(studentCourse.getCourse().getDepartments());
//		    }
		session.close();
		 if(studentCourses.size() > 0) {
			 return true;
		 }else {
			 return false;
		 }
	
	}
}
