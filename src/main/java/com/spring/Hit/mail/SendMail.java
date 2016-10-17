package com.spring.Hit.mail;

import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
/*
 * google 계정을 사용하는 경우 보안수준이 낮은 앱에서 엑세스가 가능하도록 허용해야한다.
 * 설정위치
 * => https://www.google.com/settings/security/lesssecureapps
 */
@Repository
public class SendMail {
	@Autowired 
	private JavaMailSender mailSender;
	
	public int sendMail(Model model){
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		try {
			MimeMessage message = mailSender.createMimeMessage();
			String category = req.getParameter("category");	//종류
			String title = req.getParameter("title");	//제목
			if(category!=null)
				category = "["+category+"] ";
			String subject = category + title;
			String content = req.getParameter("content");//글내용
			String receiver = req.getParameter("receiver");//받는사람
			message.setSubject(subject);
            message.setText(content);	//글 내용
            
            message.setRecipients(RecipientType.TO, InternetAddress.parse(receiver));
            mailSender.send(message);
            
            System.out.println("메일 보내기 성공");
            
		} catch(Exception e){
			System.out.println(e);
			return 0;	//메일 보내기 실패
		}
		return 1;	//메일 보내기 성공
	}
}
