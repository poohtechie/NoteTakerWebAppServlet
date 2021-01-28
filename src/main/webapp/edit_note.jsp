<%@page import="com.miit.helper.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.miit.entities.Note"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<!-- <div class="container-fluid p-0 m-0"> -->
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit Note</h1>
		<br>

		<%
			int getNoteId = Integer.parseInt(request.getParameter("note_id").trim());

		/* Edit Data using Hibernate */
		Session s = HibernateUtil.getSessionFactory("hibernate.cfg.xml").openSession();
		Note note = s.get(Note.class, getNoteId);
		%>

		<!-- Edit Form : START -->
		<form action="EditNoteServlet" method="post">
			<input name="note_id" type="hidden" value="<%=note.getId()%>" />
			<div class="form-group">
				<label for="title">Note Title</label> <input required type="text"
					name="edit_title" id="title" class="form-control"
					aria-describedby="textHelp" placeholder="Enter title here"
					value="<%=note.getTitle()%>">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea required name="edit_content" id="content"
					class="form-control" placeholder="Enter content here"
					style="height: 300px"><%=note.getContent()%></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save</button>
			</div>
		</form>
		<!-- Edit Form : END -->


	</div>

</body>
</html>