package com.school.monday;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

/**
 * Servlet implementation class Delete
 */
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String deleteKeyString = request.getParameter("id");

		if(deleteKeyString != null) {
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
			Key deleteKey = KeyFactory.stringToKey(deleteKeyString);
			ds.delete(deleteKey);
		}
		response.sendRedirect("/diaries.jsp");
	}

}
