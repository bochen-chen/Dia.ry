<%@page import="com.google.appengine.api.datastore.*,com.google.appengine.api.datastore.Query.*,com.google.appengine.api.datastore.Query.Filter" %>
<%@page import="java.util.Date,java.text.*" %>
<!DOCTYPE Html>
<html>
  <head>
  	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Diary - Dia.ry</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="resources/css/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/576a5064ae.js"></script>
	
  </head>
  	
  <body>
  	<%
      	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		SimpleDateFormat sdf = new SimpleDateFormat("MMM d, yyyy hh:mm");
   		String keyString = request.getParameter("id");
   		String title = "";
   		String content = "";
   		String createTime = "";
   		
   		if(keyString != null) {
			Key key = KeyFactory.stringToKey(keyString);
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	
			try {
				Entity diary = ds.get(key);
				title = (String) diary.getProperty("Title");
				content = (String) diary.getProperty("Content");
				createTime = sdf.format(diary.getProperty("CreateTime"));
			} catch (EntityNotFoundException e) {
				response.sendRedirect("/diaries.jsp");
			}
		} else {
			response.sendRedirect("/diaries.jsp");
		}
    %>
      
	<jsp:include page="navbar.jsp"></jsp:include>
    <div id="body" class="container">
      <div class="row">

        <div class="col-lg-8 col-sm-12">

          <div class="blog-post">
            <h2 class="blog-post-title pb-2 border border-info border-left-0 border-top-0 border-right-0"><%=title %></h2>
            <p class="blog-post-meta"><%=createTime %>
            
			<div class="blog-post-content">
				<%=content %>
			</div>
			
			<a href="edit.jsp?id=<%=keyString %>" class="btn btn-sm btn-outline-info">
        		<i class="fa fa-pencil"></i> Edit</a>
        	<a href="delete?id=<%=keyString %>" class="btn btn-sm btn-outline-danger">
        		<i class="fa fa-trash"></i> Delete</a>
          </div>

        </div>

      </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>