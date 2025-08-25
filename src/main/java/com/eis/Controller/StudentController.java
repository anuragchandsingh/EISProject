package com.eis.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eis.Connection.DBConnection;
import com.eis.DAO.StudentDao;
import com.eis.Model.Student;

@WebServlet("/StudentController")
public class StudentController extends HttpServlet {

	StudentDao dao = new StudentDao();

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String className = req.getParameter("className");
		
		String action = req.getParameter("action");
		
		if("INSERT".equals(action))
		{
		dao.insert(new Student(0,name,email,gender,className));
		
		RequestDispatcher dispatcher =  req.getRequestDispatcher("student.jsp");
		dispatcher.forward(req, res);
		}else {
			int id = Integer.parseInt(req.getParameter("id"));
			dao.update(new Student(id, name, email, gender, className));
			RequestDispatcher dispatcher = req.getRequestDispatcher("viewstudent.jsp");
			dispatcher.forward(req, res);
		}
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		if ("DELETE".equals(action)) {
			dao.delete(Integer.parseInt(req.getParameter("id"))); 
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("viewstudent.jsp");
			dispatcher.forward(req, res);
		}
	} 
}
