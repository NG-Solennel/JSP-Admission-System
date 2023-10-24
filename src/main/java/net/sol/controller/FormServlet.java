package net.sol.controller;

import java.io.ByteArrayOutputStream;
import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import net.sol.dao.AcademicUnitDao;
import net.sol.dao.StudentDao;
import net.sol.model.AcademicUnit;
import net.sol.model.Learner;
import net.sol.util.Mail;
import net.sol.util.UtilFunctions;

@WebServlet("/submit-form")
@MultipartConfig(maxFileSize = 16177215)
public class FormServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String guardianName = request.getParameter("guardian-name");
		String guardianEmail = request.getParameter("guardian-email");
		int age = Integer.parseInt(request.getParameter("age"));
		int programParam = Integer.parseInt(request.getParameter("program"));
		String status = request.getParameter("status");
		String suggestions = request.getParameter("admission-form-suggestions");
		Part diplomaPart = request.getPart("diploma");
		Part photoPart = request.getPart("photo");
		InputStream diplomaStream = diplomaPart.getInputStream();
		InputStream photoStream = photoPart.getInputStream();
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		int nRead;
		byte[] data = new byte[1024];
		while ((nRead = photoStream.read(data, 0, data.length)) != -1) {
		  buffer.write(data, 0, nRead);
		}
		buffer.flush();
		byte[] photoBytes = buffer.toByteArray();
		InputStreamReader reader = new InputStreamReader(diplomaStream);
		CharArrayWriter writer = new CharArrayWriter();
		char[] buffer1 = new char[1024];
		int read;
		while ((read = reader.read(buffer1)) != -1) {
		    writer.write(buffer1, 0, read);
		}
		char[] charArray = writer.toCharArray();
		AcademicUnitDao academicUnitDao = new AcademicUnitDao();	
		AcademicUnit program = academicUnitDao.getAcademicUnitById(programParam);
		Learner student = new Learner();
		student.setName(name);
		student.setEmail(email);
		student.setGuardianName(guardianName);
		student.setGuardianEmail(guardianEmail);
		student.setAge(age);
		student.setStatus(status);
		student.setProgram(program);
		student.setSuggestions(suggestions);
		student.setPhoto(photoBytes);
		student.setDiploma(charArray);
		
		StudentDao studentDao = new StudentDao();
		studentDao.saveStudent(student);
		
		try {
			String message = UtilFunctions.getMessage("applied", name);
			Mail.sendMail(email, message, "Applied Successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("./pages/form.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/form.jsp");
		dispatcherForm.forward(request, response);
	}
}
