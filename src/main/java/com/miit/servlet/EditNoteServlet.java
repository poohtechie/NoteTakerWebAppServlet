package com.miit.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.miit.entities.Note;
import com.miit.helper.HibernateUtil;

public class EditNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditNoteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			/* Get Parameter from edit_note.jsp */
			String getNoteTitle = request.getParameter("edit_title");
			String getNoteContent = request.getParameter("edit_content");
			int getNoteId = Integer.parseInt(request.getParameter("note_id").trim());

			/* Update Data using Hibernate */
			Session session = HibernateUtil.getSessionFactory("hibernate.cfg.xml").openSession();
			Transaction tx = session.beginTransaction();

			Note note = session.get(Note.class, getNoteId);
			note.setTitle(getNoteTitle);
			note.setContent(getNoteContent);
			note.setAddedDate(new Date());

			tx.commit();
			session.close();

			response.sendRedirect("all_notes.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
