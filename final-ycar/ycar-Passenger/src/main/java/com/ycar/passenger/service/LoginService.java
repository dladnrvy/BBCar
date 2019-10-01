package com.ycar.passenger.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ycar.passenger.dao.PassengerDao;
import com.ycar.passenger.domain.LoginInfo;
import com.ycar.passenger.domain.PassengerInfo;

@Service("loginService")
public class LoginService {

	@Autowired
	private SqlSessionTemplate template;
	private PassengerDao dao;
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	JavaMailSender sender;

	public Map<String,Object> login(String id, String pw) {

		dao = template.getMapper(PassengerDao.class);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		// 아이디 존재 여부 확인
		PassengerInfo info = dao.selectById(id);

		if (info.getType() == null || info == null) {// 존재하지 않는 회원
			map.put("msg", 1);
		} else if (info.getVerify() == 'Y' && info.pwMatch(pw)) {
			// 인증처리된 회원, 정상 로그인
			LoginInfo loginInfo = new LoginInfo(info.getP_idx(),info.getNickname(), info.getEmail(), info.getName());
			map.put("msg", 2);
			map.put("login", loginInfo);
		} else if (!info.pwMatch(pw)) {
			// 비밀번호 불일치
			map.put("msg", 3);
		} else if (info.getVerify() == 'N' && info.pwMatch(pw)) {
			// 임시비밀번호 발송된 회원, 비밀번호 변경 유도
			LoginInfo loginInfo = new LoginInfo(info.getP_idx(),info.getNickname(), info.getEmail(), info.getName());
			map.put("msg", 4);
			map.put("login", loginInfo);
		}

		// encoder.matches(pw, passengerInfo.getPw())
		// !encoder.matches(pw, passengerInfo.getPw())

		return map;
	}
	

	public Map<String, Object> kakaoLogin(String id) {
		
		dao = template.getMapper(PassengerDao.class);
		
		Map<String,Object> map = new HashMap<String, Object>();
		PassengerInfo info = dao.selectById(id);
		LoginInfo loginInfo = new LoginInfo(info.getP_idx(), info.getNickname(), info.getEmail(), info.getName());
		map.put("login", loginInfo);
		
		return map;
	}

	public int findId(String name, String email) {

		dao = template.getMapper(PassengerDao.class);

		int cnt = 0;
		// 아이디 존재 여부
		PassengerInfo info = dao.selectByName(name);

		// 아이디 존재 + 일반 회원으로 회원가입 + 이름 일치 + 이메일 일치
		if (info != null && info.getType().equals("S") && info.getName().equals(name) && info.getEmail().equals(email)) {
			// 아이디 문자열 부분 치환 (뒷5자리는 "*"로)
			StringBuffer buffer = new StringBuffer();
			buffer.append(info.getId().substring(0, info.getId().length() - 5));
			for (int i = 0; i < info.getId().length() - 5; i++) {
				buffer.append("*");
			}
			String changedId = buffer.toString();

			// 해당 아이디 이메일로 발송
			MimeMessage message = sender.createMimeMessage();

			try {
				message.setSubject("[연차 풀카서비스]아이디찾기 발송 이메일 입니다", "UTF-8");
				String text = "<h1>문의하신 이용자 ID는 ";
				text += changedId + "입니다</h1>";
				text += "<a href=\"http://localhost:9090/pClient\">로그인하기</a>";
				message.setText(text, "UTF-8", "html");
				message.setFrom(new InternetAddress("bitcamptestemail@gmail.com"));
				message.addRecipient(RecipientType.TO, new InternetAddress(info.getEmail(), "USER", "UTF-8"));

				sender.send(message);
				cnt = 1;
			}

			catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			cnt = 2;
		}
		return cnt;

	}

	public int findPw(String name, String email) {

		dao = template.getMapper(PassengerDao.class);

		int cnt = 0;
		// 아이디 존재 여부
		PassengerInfo info = dao.selectByName(name);

		// 아이디 존재 + 일반 회원으로 회원가입 + 이름 일치 + 이메일 일치
		if (info != null && info.getType().equals("S") && info.getName().equals(name) && info.getEmail().equals(email)) {
			
			// 임시비밀번호 발송 -> verify = N으로 변경
			Map<String,String> map = new HashMap<String, String>();
			map.put("verify", "N");
			map.put("id", info.getId());
			dao.changeVer(map);
			
			// 임시 비밀번호 난수 생성
			Random rand = new Random(System.nanoTime());
			StringBuffer sb = new StringBuffer();

			// 총 10문자 길이의 난수 생성
			for (int i = 0; i < 10; i++) {
				if (rand.nextBoolean()) {
					sb.append(rand.nextInt(10));
				} else {
					sb.append((char) (rand.nextInt(26) + 97));
				}
			}
			
			// 임시 비밀번호로 DB업데이트
			Map<String,String> map1 = new HashMap<String, String>();
			map1.put("pw", sb.toString());
			map1.put("id", info.getId());
			dao.updatePw(map1);

			// 해당 아이디 이메일로 발송
			MimeMessage message = sender.createMimeMessage();

			try {
				message.setSubject("[연차 풀카서비스]비밀번호찾기 발송 이메일 입니다", "UTF-8");
				String text = "<h1>임시비밀번호: ";
				text += sb.toString()+ "</h1>";
				text += "<h2><a href=\"http://localhost:9090/pClient\">비밀번호를 변경해주세요</a></h2>";
				message.setText(text, "UTF-8", "html");
				message.setFrom(new InternetAddress("bitcamptestemail@gmail.com"));
				message.addRecipient(RecipientType.TO, new InternetAddress(info.getEmail(), "USER", "UTF-8"));

				sender.send(message);
				cnt = 1;
			}

			catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			cnt = 2;
		}
		return cnt;
	}

}
