package net.sol.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import net.sol.pojo.MailObj;

public class SendMail {
	
	public boolean sendMail(MailObj mailObj) {
		
		String fromEmail = "ngsolennel@gmail.com";
		String fromPassword = "stephencurry2022";
		
		try {
			System.setProperty("java.net.preferIPv4Stack", "true");
			 
	        Properties properties = new Properties();
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.starttls.enable", "true");
	        properties.put("mail.smtp.host", "smtp.gmail.com");
	        properties.put("mail.smtp.port", "587");
			
			Session session = Session.getInstance(properties, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail,fromPassword);
				};	
			});
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress("gisubizongabosolennel@gmail.com"));
			message.setSubject("University Application");
			message.setText(mailObj.getText());
			
			Transport.send(message);
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}

	public SendMail() {
		
	}
	
}
