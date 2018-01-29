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

public class Compose extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/compose.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("title") == null || request.getParameter("content") == null) {
			response.sendRedirect("/compose.jsp");
		} else {
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			String email = (String) request.getSession().getAttribute("email");
			String title = request.getParameter("title").trim();
			String content = request.getParameter("content");
			try {
				Entity author = new Entity("Users", email);
				Entity diary = new Entity("Diary", author.getKey());
				diary.setProperty("Title", title);
				diary.setProperty("Content", content);
				diary.setProperty("CreateTime", new Date());
				
				datastore.put(diary);
				
				response.sendRedirect("/diary.jsp?id=" + KeyFactory.keyToString(diary.getKey()));
			} catch(Exception e) {
				HttpSession session = request.getSession();
				session.setAttribute("errorMsg", "Error happen while posting diary, please try again.");
				response.sendRedirect("/compose.jsp");
			}
		}
	}

}
