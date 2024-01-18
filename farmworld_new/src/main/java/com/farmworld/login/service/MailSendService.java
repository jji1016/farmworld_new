package com.farmworld.login.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.farmworld.login.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MailSendService {
	JavaMailSenderImpl mailSender = new JavaMailSenderImpl(); //스프링에서 제공하는 메일 전송을 위한 클래스 
	private int authNumber; //난수 발생
	
	
	//인증번호 만들기
	public void makeRandomNum() {
		//난수 범위 111111~999999(6자리)
		Random r = new Random();
		int checkNum = r.nextInt(888888)+111111;
		System.out.println("service makeRandomNum"+checkNum);
		authNumber = checkNum;
	}
	
	public String mailSender(String email) {
		makeRandomNum();
		String code = Integer.toString(authNumber);
		
        JavaMailSenderImpl sender = new JavaMailSenderImpl();
        sender.setHost("smtp.gmail.com");
        sender.setPort(587);
        sender.setUsername("0farmworld0@gmail.com");
        sender.setPassword("mmjo sawm dgbp gtnx"); ///2단계 인증 앱 비밀번호

        Properties javaMailProperties = new Properties();
        javaMailProperties.put("mail.transport.protocol", "smtp");
        javaMailProperties.put("mail.smtp.auth", "true");
        javaMailProperties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        javaMailProperties.put("mail.smtp.starttls.enable", "true");
        javaMailProperties.put("mail.debug", "true");
        javaMailProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        javaMailProperties.put("mail.smtp.ssl.protocols", "TLSv1.2");

        sender.setJavaMailProperties(javaMailProperties);

        MimeMessage mailContent = sender.createMimeMessage();
        MimeMessageHelper helper;

        //메일 내용: html 형식으로 작성
        String content= "팜월드" + "<br>" 
        				+ "본인 인증 번호는 ["+ code + "]입니다." + "<br><br>"
        				+ "해당 인증 번호를 인증 번호 확인란에 기입하여 주세요.";

        try {
            helper = new MimeMessageHelper(mailContent, true, "UTF-8");
            helper.setTo(email);
            helper.setSubject("<팜월드>본인 인증 이메일입니다."); //메일제목
            helper.setText(content,true);
            sender.send(mailContent);
        } catch (MessagingException e) {
            code="유효하지 않은 이메일입니다.";
            e.printStackTrace();
        }
        return code;
    }
	
}
