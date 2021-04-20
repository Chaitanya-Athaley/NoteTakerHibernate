<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="alljs_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Please Fill your Note</h1>
		<form action="SaveNoteService" method="post">
			<div class="form-group">
				<label for="title">Note Title</label>
				 <input required="required"
				    name = "title"
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here"/>
			</div>
			<div class="form-group">
				<label for="Content">Note Content</label>
				 <textarea required="required"
				 name = "content"
				 id="content"
				 class="form-control"
				 placeholder="enter your content"></textarea>
			</div>
			
			<div class="container text-center">
			<button type="submit" class="btn btn-primary">Add Note</button>
			</div>
		</form>
	</div>
</body>
</html>