package net.sol.util;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Mail {
     public static void sendMail(String recepient,String text,String subject) throws Exception {
       System.out.println("Preparing to send a mail message.");
       System.out.println(text);
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
;
        
        final String myEmail = "solennelapp@gmail.com";
        final String myPassword = "olpwbeagqjsgarre";
        
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myEmail, myPassword); 
            } 
        });
        
        Message message = prepareMessage(session, myEmail, recepient,text,subject);
        Transport.send(message);
        System.out.println("Mail message sent successfully.");
        
    }

    private static Message prepareMessage(Session session, String myEmail, String recepient,String text, String subject) {
        Message message = null;
        try {
            message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject(subject);
            message.setText(text);
        } catch (Exception ex) {
            Logger.getLogger(Mail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }

    
}
