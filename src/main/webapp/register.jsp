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
			<div class="col-lg-6 col-sm-12">
				<div class="jumbotron">
					<h1>Create an Account.</h1>
				</div>
			</div>
			<div class="col-lg-6 col-sm-12">
				<form action="/register" method="post">
			  		<div class="form-group">
				    	<label for="email">Email address</label>
				    	<input type="email" class="form-control" name="email" aria-describedby="emailHelp" placeholder="Enter email">
				    </div>
				  	<div class="form-group">
		  		  		<label for="password">Password</label>
				    	<input type="password" class="form-control" name="password" placeholder="Password">
				  	</div>
				  	<div class="form-group">
		  		  		<label for="name">Name</label>
				    	<input type="text" class="form-control" name="name" placeholder="Name">
				  	</div>
				  	<button type="submit" class="btn btn-info">Submit</button>
				</form>
			</div>
		</div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>