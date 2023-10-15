package net.sol.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import net.sol.model.AcademicUnit;
import net.sol.model.EAcademicUnit;


public class AcademicUnitDao {
	public void saveAcademicUnit(AcademicUnit academicUnit) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(academicUnit);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
	public List<AcademicUnit> getProgrammes() {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            List<AcademicUnit> programmes = session.createQuery("from AcademicUnit where unit = :unit").setString("unit", EAcademicUnit.PROGRAMME.toString()).list();
            return programmes;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
		return null;
    }
	public List<AcademicUnit> getFacultiesByProgramme(Integer parent_id) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
           Query query = session.createQuery("from AcademicUnit where unit = :unit and parent_id = :parent_id");
           query.setString("unit", EAcademicUnit.FACULTY.toString());
           query.setInteger("parent_id", parent_id);
           List<AcademicUnit> faculties = query.list();
           return faculties;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
		return null;
    }
	public List<AcademicUnit> getDepartmentsByFaculty(Integer parent_id) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
           Query query = session.createQuery("from AcademicUnit where unit = :unit and parent_id = :parent_id");
           query.setString("unit", EAcademicUnit.DEPARTMENT.toString());
           query.setInteger("parent_id", parent_id);
           List<AcademicUnit> departments = query.list();
           return departments;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
		return null;
    }
}
