<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<!-- <div class="container-fluid p-0 m-0"> -->
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Please fill your note detail</h1>
		<br>

		<!-- Add Form : START -->
		<form action="AddNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> <input required type="text"
					name="add_title" id="title" class="form-control"
					aria-describedby="textHelp" placeholder="Enter title here">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea required name="add_content" id="content"
					class="form-control" placeholder="Enter content here"
					style="height: 300px"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
		<!-- Add Form : END -->
	</div>
</body>
</html>