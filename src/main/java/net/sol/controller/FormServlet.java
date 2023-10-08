package net.sol.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

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
		String program = request.getParameter("program");
		String status = request.getParameter("status");
		String faculty = request.getParameter("admission-form-faculty");
		String department = request.getParameter("admission-form-department");
		String suggestions = request.getParameter("admission-form-suggestions");
		Part filePart = request.getPart("diploma");
		 if (filePart != null) {
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());  
	        }
		
		
		System.out.println(name);
		System.out.println(email);
		System.out.println(guardianName);
		System.out.println(guardianEmail);
		System.out.println(age);
		System.out.println(program);
		System.out.println(status);
		System.out.println(faculty);
		System.out.println(department);
		System.out.println(suggestions);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.sendRedirect("index.jsp");
	}
}
