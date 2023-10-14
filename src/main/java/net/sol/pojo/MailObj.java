package net.sol.pojo;

public class MailObj {
  private String toEmail;
  private String text;
public MailObj(String toEmail, String text) {
	this.toEmail = toEmail;
	this.text = text;
}
public MailObj() {
	
}
public String getToEmail() {
	return toEmail;
}
public void setToEmail(String toEmail) {
	this.toEmail = toEmail;
}
public String getText() {
	return text;
}
public void setText(String text) {
	this.text = text;
}
  
}
