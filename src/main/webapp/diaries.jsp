<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.google.appengine.api.datastore.*,com.google.appengine.api.datastore.Query.*,com.google.appengine.api.datastore.Query.Filter" %>
<%@page import="java.io.*,java.util.Date,java.text.*" %>
<!DOCTYPE Html>
<html>
  <head>
  	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>My Diaries - Dia.ry</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../resources/css/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/576a5064ae.js"></script>
	
  </head>
  	
  <body>
  	<jsp:include page="navbar.jsp"></jsp:include>
	<%
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Key userKey = KeyFactory.createKey("Users", (String) session.getAttribute("email"));
		try {
			Query q = new Query("Diary", userKey);
			q.addSort("CreateTime", Query.SortDirection.DESCENDING);
			PreparedQuery pq = datastore.prepare(q);
	%>
	    <div id="body" class="container"><div class="row">
			<div class="col-md-4">
				<div class="jumbotron">
					<div class="container">
						<h1>My Diaries</h1>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="mb-3">
					<a class="btn btn-info" href="/compose.jsp">Compose</a>
				</div>
				<div class="row">
				<% 
					if(pq.asIterator().hasNext()) {
						for (Entity result : pq.asIterable())  {
							Key key = result.getKey();
							String encodedKey = KeyFactory.keyToString(key);
							String title = (String) result.getProperty("Title");
							SimpleDateFormat sdf = new SimpleDateFormat("MMM d, yyyy hh:mm");
							String createTime = sdf.format(result.getProperty("CreateTime"));
				%>
							<div class="col-md-6">
								<div class="card mb-3">
									<div class="card-body">
										<h5 class="card-title"><%=title %></h5>
										<p class="card-text text-muted"><%=createTime %></p>
										<input type="hidden" value="<%=encodedKey %>">
										<!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
										<a href="diary.jsp?id=<%=encodedKey %>" class="btn btn-outline-info">Read</a>
										<a href="delete?id=<%=encodedKey %>" class="btn btn-link text-danger">Delete</a>
									</div>
								</div>
							</div>
			<% 
						}
					} else {
			%>
						<p><i class="fa fa-hand-o-up"></i> Compose a new diary.</p>
			<%
					}
				} catch (Exception e) {
					out.println(e);
				}
			%>
			</div>
		</div>
	</div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>