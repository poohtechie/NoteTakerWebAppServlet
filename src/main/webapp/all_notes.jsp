<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.miit.helper.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.miit.entities.Note"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note Taker : All Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<!-- <div class="container-fluid p-0 m-0"> -->
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes</h1>

		<div class="raw">
			<div class="col-12">
				<%
					Session s = HibernateUtil.getSessionFactory("hibernate.cfg.xml").openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note note : list) {
				%>

				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto" style="max-width: 50px;"
						src="img/notes.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title">
							<%=note.getTitle()%>
						</h5>
						<p class="card-text"><%=note.getContent()%></p>

						<%
							DateFormat fmt = new SimpleDateFormat("dd MMMM yyyy");
						String nowDate = fmt.format(note.getAddedDate());
						%>
						<p class="text-primary"><%=nowDate%></p>

						<div class="container text-center mt-2">
							<a href="edit_note.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary">Edit</a> <a
								href="DeleteNoteServlet?note_id=<%=note.getId()%>"
								class="btn btn-danger">Delete</a>
						</div>
					</div>
				</div>

				<%
					}
				s.close();
				%>
			</div>
		</div>
	</div>
</body>
</html>