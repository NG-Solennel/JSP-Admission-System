package net.sol.controller;


import java.io.IOException;

import javax.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import net.sol.dao.UserDao;
import net.sol.model.User;


@WebServlet("/register")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

	public void init() {
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		try {
			register(request, response);
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
		response.sendRedirect("register.jsp");
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String email = request.getParameter("firstName");
		String names = request.getParameter("names");
		String password = request.getParameter("password");

		User user = new User();
		user.setEmail(email);
		user.setNames(names);
		user.setPassword(password);

		userDao.saveUser(user);
		 response.setContentType("text/html;charset=UTF-8");
		response.getWriter().append("<center><h1>Success</h1></center>");
	}
}
