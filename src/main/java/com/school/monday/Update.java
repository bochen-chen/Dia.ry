package com.school.monday;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyString = request.getParameter("id");
		
		if(keyString == null) {
			response.sendRedirect("/diaries.jsp");
		} else if(request.getParameter("title") == null || request.getParameter("content") == null) {
			response.sendRedirect("/edit.jsp?id" + keyString);
		} else {
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			Key key = KeyFactory.stringToKey(keyString);
			
			String title = request.getParameter("title").trim();
			String content = request.getParameter("content");
			
			try {
				Entity diary = datastore.get(key);
				diary.setProperty("Title", title);
				diary.setProperty("Content", content);
				
				datastore.put(diary);
				
				response.sendRedirect("/diary.jsp?id=" + keyString);
			} catch(Exception e) {
				HttpSession session = request.getSession();
				session.setAttribute("errorMsg", "Error happen while updating diary, please try again.");
				response.sendRedirect("/edit.jsp?id=" + keyString);
			}
		}
	}

}
