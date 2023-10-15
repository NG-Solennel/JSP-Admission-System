package net.sol.util;

import net.sol.dao.AcademicUnitDao;
import net.sol.model.AcademicUnit;
import net.sol.model.EAcademicUnit;

public class UtilFunctions {
	public static String getMessage (String status, String names) {
		if(status.equalsIgnoreCase("accept")) {
			return "Hey "+ names +", \n We are pleased to inform you that your application to our university has been accepted, We'll reach out for what comes next.";
		}else if(status.equalsIgnoreCase("reject")) {
			return "Hey "+ names +", \n Due to not enough places being available in our institution, we regret to inform you that your application has been denied \n, Good luck in your future endeavors";
		}
		return "Sorry to bother you " + names;
	}
	
	public static void SeedAcademicUnit() {
		AcademicUnitDao dao = new AcademicUnitDao();
		AcademicUnit program1 = new AcademicUnit(1,null,"Undergraduate programmes",EAcademicUnit.PROGRAMME);
		AcademicUnit program2 = new AcademicUnit(2,null,"Masters programmes",EAcademicUnit.PROGRAMME);
		AcademicUnit faculty1 = new AcademicUnit(3,program1.getId(),"Faculty of Information Technology",EAcademicUnit.FACULTY);
		AcademicUnit faculty2 = new AcademicUnit(4,program1.getId(),"Faculty of Business Administration ",EAcademicUnit.FACULTY);
		AcademicUnit faculty3 = new AcademicUnit(5,program1.getId(),"Faculty of Theology",EAcademicUnit.FACULTY);
		AcademicUnit faculty4 = new AcademicUnit(6, program1.getId(),"Faculty of Education",EAcademicUnit.FACULTY);
		AcademicUnit faculty5 = new AcademicUnit(7,program1.getId(),"Faculty of Health Sciences",EAcademicUnit.FACULTY);
		AcademicUnit department1 = new AcademicUnit(8,faculty1.getId(),"Information Management",EAcademicUnit.DEPARTMENT);
		AcademicUnit department2 = new AcademicUnit(9,faculty1.getId(),"Network and Communication Systems Major",EAcademicUnit.DEPARTMENT);
		AcademicUnit department3 = new AcademicUnit(10,faculty1.getId(),"Software Engineering Major",EAcademicUnit.DEPARTMENT);
		AcademicUnit department4 = new AcademicUnit(11,faculty2.getId(),"Management Major",EAcademicUnit.DEPARTMENT);
		AcademicUnit department5 = new AcademicUnit(12,faculty2.getId(),"Marketing Major",EAcademicUnit.DEPARTMENT);
		AcademicUnit department6 = new AcademicUnit(13,faculty3.getId(),"Theology",EAcademicUnit.DEPARTMENT);
		AcademicUnit department7 = new AcademicUnit(14,faculty4.getId(),"History (Major) and Geography (Minor)",EAcademicUnit.DEPARTMENT);
		AcademicUnit department8 = new AcademicUnit(15,faculty4.getId(),"English and French Literature Major/Minor",EAcademicUnit.DEPARTMENT);
		AcademicUnit department9 = new AcademicUnit(16,faculty4.getId(),"Economics (Major) and Mathematics (Minor)",EAcademicUnit.DEPARTMENT);
		AcademicUnit department10 = new AcademicUnit(17,faculty4.getId(),"Information Technology (Major) and Accounting (Minor)",EAcademicUnit.DEPARTMENT);
		AcademicUnit department11 = new AcademicUnit(18,faculty4.getId(),"Accounting (Major) and Information Technology (Minor)",EAcademicUnit.DEPARTMENT);
		AcademicUnit department12 = new AcademicUnit(19,faculty5.getId(),"Nursing & Midwifery",EAcademicUnit.DEPARTMENT);
		AcademicUnit department13 = new AcademicUnit(20,faculty5.getId(),"Nursing & Midwifery Entry Requirements",EAcademicUnit.DEPARTMENT);
		AcademicUnit department14 = new AcademicUnit(21,faculty5.getId(),"Nursing & Midwifery Fee Structure",EAcademicUnit.DEPARTMENT);
		AcademicUnit faculty6 = new AcademicUnit(22,program2.getId(),"MSc in Big Data Analytics",EAcademicUnit.FACULTY);
		AcademicUnit faculty7 = new AcademicUnit(23,program2.getId(),"Masters of Business Administration (MBA)",EAcademicUnit.FACULTY);
		AcademicUnit faculty8 = new AcademicUnit(24,program2.getId(),"Masters of Arts in Education",EAcademicUnit.FACULTY);
		dao.saveAcademicUnit(program1);
		dao.saveAcademicUnit(program2);
		dao.saveAcademicUnit(faculty1);
		dao.saveAcademicUnit(faculty2);
		dao.saveAcademicUnit(faculty3);
		dao.saveAcademicUnit(faculty4);
		dao.saveAcademicUnit(faculty5);
		dao.saveAcademicUnit(faculty6);
		dao.saveAcademicUnit(faculty7);
		dao.saveAcademicUnit(faculty8);
		dao.saveAcademicUnit(department1);
		dao.saveAcademicUnit(department2);
		dao.saveAcademicUnit(department3);
		dao.saveAcademicUnit(department4);
		dao.saveAcademicUnit(department5);
		dao.saveAcademicUnit(department6);
		dao.saveAcademicUnit(department7);
		dao.saveAcademicUnit(department8);
		dao.saveAcademicUnit(department9);
		dao.saveAcademicUnit(department10);
		dao.saveAcademicUnit(department11);
		dao.saveAcademicUnit(department12);
		dao.saveAcademicUnit(department13);
		dao.saveAcademicUnit(department14);
	}
}
