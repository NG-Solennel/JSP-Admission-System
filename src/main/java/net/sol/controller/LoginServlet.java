package net.sol.controller;


import java.io.IOException;

import javax.servlet.ServletException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.sol.dao.UserDao;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

	public void init() {
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, jakarta.servlet.ServletException {
		try {
			validate(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.sendRedirect("index.jsp");
	}

	private void validate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, jakarta.servlet.ServletException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Boolean validated = userDao.validate(email, password);
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = request.getRequestDispatcher("./pages/home.jsp");
		if(validated) {
			session.setAttribute("isAuth", true);
			session.setAttribute("email", email);
			dispatcher.forward(request, response);
		}else {			
			response.sendRedirect("index.jsp");
		}
	}
}
