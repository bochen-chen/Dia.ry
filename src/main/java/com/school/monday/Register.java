package com.school.monday;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;

import com.google.appengine.api.datastore.*;

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String SENDER = "dean31815@gmail.com";
	final String SENDER_NAME = "Dia.ry";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("register.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("email") == null || request.getParameter("password") == null || request.getParameter("name") == null) {
			response.sendRedirect("register.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			Properties props = new Properties();
		  	Session session = Session.getDefaultInstance(props, null);
		  	
		  	String email = request.getParameter("email");
		  	String password = request.getParameter("password");
		  	String name = request.getParameter("name");
		  	
			Entity user = new Entity("Users", email);
			user.setProperty("Email", email);
			user.setProperty("Password", password);
			user.setProperty("Name", name);
			datastore.put(user);
			
			String sender = SENDER;
		  	String senderName = SENDER_NAME;
		  	String recipientAddress = email;
		  	String subject = "Registration Email";

		  	String htmlMessageBody = "<h3>Dear " + name + ":</p>"
	  							   + "<p>Thank you for registering to Dia.ry.</p>"
	  							   + "<p>Click <a href=\"https://mondayproject-181003.appspot.com/\">here</a> and start using.<p>"
	  							   + "<p>Hope you enjoy, Peace.</p>";
			
			try {
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(sender, senderName, "UTF-8"));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientAddress));
		  		message.addRecipient(Message.RecipientType.CC, new InternetAddress(sender));
		  		message.setSubject(subject);
				
		  		Multipart multipart = new MimeMultipart();
		  		MimeBodyPart htmlPart = new MimeBodyPart();
		  		htmlPart.setContent(htmlMessageBody, "text/html;charset=UTF-8");
		  		multipart.addBodyPart(htmlPart);
		  		
		  		message.setContent(multipart);
		  		
		  		Transport.send(message);
			} catch (AddressException e) {
		  		response.sendError(400, "AddressException: " + e);
		  	} catch (MessagingException e) {
		  		response.sendError(500, "MessagingException: " + e);
		  	} catch (Exception e) {
		  		response.getWriter().print(e);
		  	} finally {
				response.sendRedirect("login.jsp");
		  	}
			
		}
	}
}
