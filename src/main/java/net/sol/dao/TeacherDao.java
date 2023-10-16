package net.sol.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.Teacher;

public class TeacherDao {
	public void saveTeacher(Teacher teacher) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(teacher);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
	public List<Teacher> getAllTeachers(){
		List<Teacher> courses;
		Session session = FactoryManager.getSessionFactory().openSession();
		 courses = session.createQuery("FROM Teacher").list();
	  	session.close();
	  	return courses;		
	}

}
