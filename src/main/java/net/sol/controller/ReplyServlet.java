package net.sol.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.ApplicantDao;
import net.sol.model.Applicant;
import net.sol.util.Mail;
import net.sol.util.UtilFunctions;

import java.io.IOException;

@WebServlet("/reply")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicantDao applicantDao;

	public void init() {
		applicantDao = new ApplicantDao();
	}
 
    public ReplyServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		String answer = request.getParameter("answer");
		Applicant applicant = applicantDao.getApplicantById(id);
		System.out.println(answer);
		String message = UtilFunctions.getMessage(answer, applicant.getName());
	
		try {		
			Mail.sendMail(applicant.getEmail(), message,"Application response");
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
