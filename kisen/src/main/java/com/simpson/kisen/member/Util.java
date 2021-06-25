package com.simpson.kisen.member;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Util {
	public static int sendMail(String smtpServerId, String smtpServerPw, String from, String fromName, String to, String title, String body) {
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		
		Authenticator auth = new MailAuth(smtpServerId, smtpServerPw);
		
		Session session = Session.getDefaultInstance(prop, auth);
		
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress(from, fromName));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setSubject(title, "UTF-8");
			msg.setContent(body, "text/html; charset=UTF-8");
			
			Transport.send(msg);
		} catch (AddressException ae) {
			return -1;
		} catch (MessagingException e) {
			return -2;
		} catch (UnsupportedEncodingException e) {
			return -3;
		}
		return 1;
	}
}
