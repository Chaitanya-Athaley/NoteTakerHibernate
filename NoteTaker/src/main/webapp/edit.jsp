<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update note</title>
<%@include file="alljs_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">Update Note</h1>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note note = s.get(Note.class, noteId);
		
		%>
		<form action="UpdateServelet" method="post">
		<input value="<%=note.getId() %>" name="noteID" type="hidden" />
		
			<div class="form-group">
				<label for="title">Note Title</label>
				 <input required="required"
				    name = "title"
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here"
					value="<%=note.getTitle() %>"
					/>
			</div>
			<div class="form-group">
				<label for="Content">Note Content</label>
				 <textarea required="required"
				 name = "content"
				 id="content"
				 class="form-control"
				 placeholder="enter your content"
				 ><%=note.getContent() %></textarea>
			</div>
			
			<button type="submit" class="btn btn-success">Save note</button>
			
		</form>
		
		
		
		
	</div>

</body>
</html>