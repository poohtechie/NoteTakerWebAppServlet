package com.miit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.miit.entities.Note;
import com.miit.helper.HibernateUtil;

public class AddNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddNoteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			/* Get Parameter from add_note.jsp */
			String getNoteTitle = request.getParameter("add_title");
			String getNoteContent = request.getParameter("add_content");

			Note note = new Note(getNoteTitle, getNoteContent, new Date());

			/* Save Data using Hibernate */
			Session session = HibernateUtil.getSessionFactory("hibernate.cfg.xml").openSession();
			Transaction tx = session.beginTransaction();
			session.save(note);
			tx.commit();
			session.close();

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 styler = 'text-align:center;'>Note is added successfully!</h1>");
			out.println("<h1 styler = 'text-align:center;'><a href='all_notes.jsp'>View All Notes</a></h1>");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
