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
	public List<AcademicUnit> getFacultiesByProgramme(Integer parentId) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
           Query query = session.createQuery("from AcademicUnit where unit = :unit and parentId = :parentId");
           query.setString("unit", EAcademicUnit.FACULTY.toString());
           query.setInteger("parentId", parentId);
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
	public List<AcademicUnit> getDepartmentsByFaculty(Integer parentId) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
           Query query = session.createQuery("from AcademicUnit where unit = :unit and parentId = :parentId");
           query.setString("unit", EAcademicUnit.DEPARTMENT.toString());
           query.setInteger("parentId", parentId);
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
	public List<AcademicUnit> getDepartments() {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
           Query query = session.createQuery("from AcademicUnit where unit = :unit");
           query.setString("unit", EAcademicUnit.DEPARTMENT.toString());
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
	public List<AcademicUnit> getFaculties() {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
           Query query = session.createQuery("from AcademicUnit where unit = :unit");
           query.setString("unit", EAcademicUnit.FACULTY.toString());
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
	public List<AcademicUnit> getPrograms() {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
           Query query = session.createQuery("from AcademicUnit where unit = :unit");
           query.setString("unit", EAcademicUnit.PROGRAMME.toString());
           List<AcademicUnit> programs = query.list();
           return programs;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
		return null;
    }
	public AcademicUnit getAcademicUnitById(Integer id) {
        Transaction transaction = null;
        try {
        	Session session = FactoryManager.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            AcademicUnit unit = (AcademicUnit)session.get(AcademicUnit.class, id);
            return unit;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
		return null;
    }
}
