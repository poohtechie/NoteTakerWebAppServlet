package com.miit.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.miit.entities.Note;
import com.miit.helper.HibernateUtil;

public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteNoteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			/* Get Parameter from all_notes.jsp */
			int getNoteId = Integer.parseInt(request.getParameter("note_id").trim());

			/* Delete Data using Hibernate */
			Session session = HibernateUtil.getSessionFactory("hibernate.cfg.xml").openSession();
			Transaction tx = session.beginTransaction();
			Note note = session.get(Note.class, getNoteId);
			session.delete(note);
			tx.commit();

			session.close();

			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
