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
	JavaMailSenderImpl mailSender = new JavaMailSenderImpl(); //���������� �����ϴ� ���� ������ ���� Ŭ���� 
	private int authNumber; //���� �߻�
	
	
	//������ȣ �����
	public void makeRandomNum() {
		//���� ���� 111111~999999(6�ڸ�)
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
        sender.setPassword("mmjo sawm dgbp gtnx"); ///2�ܰ� ���� �� ��й�ȣ

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

        //���� ����: html �������� �ۼ�
        String content= "�ʿ���" + "<br>" 
        				+ "���� ���� ��ȣ�� ["+ code + "]�Դϴ�." + "<br><br>"
        				+ "�ش� ���� ��ȣ�� ���� ��ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";

        try {
            helper = new MimeMessageHelper(mailContent, true, "UTF-8");
            helper.setTo(email);
            helper.setSubject("<�ʿ���>���� ���� �̸����Դϴ�."); //��������
            helper.setText(content,true);
            sender.send(mailContent);
        } catch (MessagingException e) {
            code="��ȿ���� ���� �̸����Դϴ�.";
            e.printStackTrace();
        }
        return code;
    }
	
}
