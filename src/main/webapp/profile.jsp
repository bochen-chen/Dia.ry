<%@page import="com.google.appengine.api.datastore.*" %>
<!DOCTYPE Html>
<html>
  <head>
  	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Home - Dia.ry</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="../resources/css/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/576a5064ae.js"></script>
  </head>
  	
  <body>
  	<jsp:include page="navbar.jsp"></jsp:include>
    <div id="body" class="container">
      <div class="row">
			<div class="col-md-3">
				<h1>Profile</h1>
			</div>
			<div class="col-md-9">
				<div class="card mb-3">
				  <div class="card-header">
				    <i class="fa fa-user"></i> Name
				  </div>
				  <div class="card-body">
				    <h5 class="card-title">${name}</h5>
				  </div>
				</div>

				<div class="card mb-3">
				  <div class="card-header">
				    <i class="fa fa-envelope"></i> Email
				  </div>
				  <div class="card-body">
				    <h5 class="card-title">${email}</h5>
				  </div>
				</div>
			</div>
		</div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>