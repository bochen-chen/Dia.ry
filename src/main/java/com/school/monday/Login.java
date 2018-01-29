package com.school.monday;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.*;
import com.google.appengine.api.datastore.Query.*;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int MULTICAST_SIZE = 1000;
    private static final FetchOptions DEFAULT_FETCH_OPTIONS = FetchOptions.Builder
                 .withPrefetchSize(MULTICAST_SIZE).chunkSize(MULTICAST_SIZE);
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
		session.removeAttribute("errorMsg");
		response.sendRedirect("/login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Filter filterEmail = new FilterPredicate("Email", FilterOperator.EQUAL, request.getParameter("email"));
		Query query = new Query("Users").setFilter(filterEmail);
		PreparedQuery pq = datastore.prepare(query);
		Entity result = pq.asSingleEntity();
				
		if(result == null) {
			session.setAttribute("errorMsg", "Unknown user.");
			response.sendRedirect("/login.jsp");
		} else {
			if(!((String)result.getProperty("Password")).equals(request.getParameter("password"))) {
				session.setAttribute("errorMsg", "Wrong password");
				response.sendRedirect("/login.jsp");
			} else {
				session.setAttribute("email", (String) result.getProperty("Email"));
				session.setAttribute("name", (String) result.getProperty("Name"));
				response.sendRedirect("/");
			}
		}
	}

}
