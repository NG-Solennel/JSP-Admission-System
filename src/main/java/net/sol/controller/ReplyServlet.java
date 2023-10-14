package net.sol.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sol.dao.ApplicantDao;
import net.sol.model.Applicant;
import net.sol.pojo.MailObj;
import net.sol.util.SendMail;

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
		System.out.println(id);
		System.out.println(answer);
		Applicant applicant = applicantDao.getApplicantById(id);
		SendMail mailer = new SendMail();
		MailObj mailObj = new MailObj(applicant.getEmail(),"Testing");
		boolean mailSent = mailer.sendMail(mailObj);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./pages/applications.jsp?status=" + Boolean.toString(mailSent));
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
