<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.google.appengine.api.datastore.*,com.google.appengine.api.datastore.Query.*,com.google.appengine.api.datastore.Query.Filter" %>
<!DOCTYPE Html>
<html>
  <head>
  	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Compose - Dia.ry</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../resources/css/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/576a5064ae.js"></script>
	<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
  </head>
  	
  <body>
  	<jsp:include page="navbar.jsp"></jsp:include>
    <div id="body" class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="jumbotron">
					<div class="container">
						<h1>New Diary</h1>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<p class="text-danger">${ errorMsg }</p>
				<form action="/compose" method="post">
					<div class="form-group">
					    <label for="title">Title</label>
					    <input type="text" class="form-control" name="title" placeholder="Enter title">
					 </div>
					<div class="form-group">
					    <label for="content">Content</label>
					    <textarea id="content" name="content" placeholder="Write anything..."></textarea>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-info">Submit</button>
						<a class="btn btn-default" href="/diaries.jsp">Cancel</a>
					</div>
				</form>
			</div>
		</div>
    </div>
	
	<script>
		CKEDITOR.replace('content');
	</script>
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>