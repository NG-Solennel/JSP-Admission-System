package net.sol.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.StudentDao;
import net.sol.model.Student;
import net.sol.util.Mail;
import net.sol.util.UtilFunctions;

import java.io.IOException;

@WebServlet("/reply")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentDao studentDao;

	public void init() {
		studentDao = new StudentDao();
	}
 
    public ReplyServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		String answer = request.getParameter("answer");
		Student student = studentDao.getStudentById(id);
		System.out.println(answer);
		String message = UtilFunctions.getMessage(answer, student.getName());
	
		try {		
			Mail.sendMail(student.getEmail(), message,"Application response");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
