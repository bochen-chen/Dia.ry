package com.school.monday;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import javax.servlet.http.*;

public class SendMail extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    	PrintWriter out = resp.getWriter();
		Properties props = new Properties();
	  	Session session = Session.getDefaultInstance(props, null);
	  	
	  	String sender = req.getSession().getAttribute("email").toString();
	  	String senderName = req.getSession().getAttribute("name").toString();
	  	String recipientAddress = req.getParameter("recipient");
	  	String subject = req.getParameter("subject");

	  	String htmlMessageBody = "<p>" + req.getParameter("content") + "</p>";
		
	  	try {
	  		Message message = new MimeMessage(session);
	  		//MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(sender, senderName, "UTF-8"));
	  		message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientAddress));
	  		message.addRecipient(Message.RecipientType.CC, new InternetAddress(sender));
	  		message.setSubject(subject);
	
	  		// create a MimeMultipart object
	  		Multipart multipart = new MimeMultipart();
	  		// add multiple MimeBodyPart objects to a single MimeMultipart
	  		// MimeBodyPart: text
	  		// MimeBodyPart textPart = new MimeBodyPart();
	  		// textPart.setContent(messageBody, "text/plain;charset=UTF-8");
	  		// multipart.addBodyPart(textPart);            
	  		// MimeBodyPart: html
	  		MimeBodyPart htmlPart = new MimeBodyPart();
	  		htmlPart.setContent(htmlMessageBody, "text/html;charset=UTF-8");
	  		multipart.addBodyPart(htmlPart);
	  		
	  		// MimeBodyPart: attach file
	  		//String fileName = "Hello.txt";
	  		//String fileType = "text/plain";
	  		//MimeBodyPart attachmentPart = new MimeBodyPart();
	  		//String attachFileContent = "Hello world!";
	  		//attachmentPart.setContent(attachFileContent, fileType);
	  		//attachmentPart.setFileName(fileName);
	  		//multipart.addBodyPart(attachmentPart);
	  		
	  		//MimeBodyPart imagePart = new MimeBodyPart();
			//imagePart.attachFile("resources/You Know What I mean.jpg");

	  		//multipart.addBodyPart(imagePart);
	  		
	  		message.setContent(multipart);
	  		//-------------------------------
	  		
	  		Transport.send(message);
  		} catch (AddressException e) {
	  		//out.println("<p>AddressException: " + e + "</p>");
	  		resp.sendError(400, "AddressException: " + e);
	  	} catch (MessagingException e) {
	  		//out.println("<p>MessagingException: " + e + "</p>");
	  		resp.sendError(500, "MessagingException: " + e);
	  	}
	}
}