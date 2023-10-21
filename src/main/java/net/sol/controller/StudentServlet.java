package net.sol.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import net.sol.dao.UserDao;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {
		 
		 private static final long serialVersionUID = 1L;
//	private UserDao userDao;

//	public void init() {
//		userDao = new UserDao();
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, jakarta.servlet.ServletException {
//		HttpSession session = request.getSession();
//		String email = (String) session.getAttribute("email");
//		Boolean isAdmin = userDao.isAdmin(email);
//		if(isAdmin) {			
			RequestDispatcher dispatcher = request.getRequestDispatcher("./pages/students.jsp");
			dispatcher.forward(request, response);
//		}
//		else {
//			RequestDispatcher dispatcherForm = request.getRequestDispatcher("./pages/home.jsp");
//			dispatcherForm.forward(request, response);
//		}
	}


}
