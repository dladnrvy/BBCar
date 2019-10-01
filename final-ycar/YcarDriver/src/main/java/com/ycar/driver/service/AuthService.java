package com.ycar.driver.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * 회원가입 전 직장인 인증 중 회사메일 확인하는 서비스
 * */
@Service("authService")
public class AuthService {
	@Autowired
	private JavaMailSender sender;
	
	public String send(String cemail){
		
		MimeMessage msg = sender.createMimeMessage();
		String code = randomCode();
		
		try {
			msg.setSubject("[연차] 직장인증 확인 메일입니다", "utf-8");
			
			String body = "";
			body += "안녕하세요. 연차 서비스입니다.<br> \n";
			body += "인증번호는 "+ code +"입니다. <br> \n";
			body += "3분 내로 인증 부탁드립니다.<br> \n";
			
			msg.setText(body, "utf-8", "html");
			msg.addRecipient(RecipientType.TO, new InternetAddress(cemail));
			
			sender.send(msg);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return code;
	}
	
	//난수코드 6자리 생성
	private String randomCode() {
		StringBuffer bf = new StringBuffer();
		Random rnd = new Random();
		
		for(int i = 0 ; i < 6 ; i++) {
			bf.append(rnd.nextInt(10));
		}
		System.out.println(":::::AuthService 난수코드 6자리 생성:::: " + bf);
		return bf.toString();
	}
	
	
	//임시 패스워드 보내기
	public void sendPW(String email, String code) {
		MimeMessage msg = sender.createMimeMessage();
		try {
			msg.setSubject("[연차] 비밀번호 찾기:: 요청하신 임시 비밀번호 입니다", "utf-8");
			
			String body = "";
			body += "안녕하세요. 연차 서비스입니다.<br> \n";
			body += "요청하신 임시 비밀번호는 " + code + " 입니다. <br> \n";
			
			msg.setText(body, "utf-8", "html");
			msg.addRecipient(RecipientType.TO, new InternetAddress(email));
			
			sender.send(msg);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
