package com.ycar.reservation.service;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.ycar.reservation.dao.ReservationDao;
import com.ycar.reservation.domain.Reservation;

@Service("rsvService")
public class ReservationService {

	private ReservationDao dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	@Autowired
	private JavaMailSender sender;


//	예약 insert
	public int reserve(Reservation rsv) {
		
		dao = template.getMapper(ReservationDao.class);
		
		int result = dao.reserve(rsv);
		
		return result;
	}
	
////	내 예약 리스트 
//	public List<Reservation> getRsvList(int p_idx){
//		
//		dao = template.getMapper(ReservationDao.class);
//		
//		List<Reservation> list = dao.selectByP_idx(p_idx);
//		
//		return list;
//	}
//	
	
	
//	예약취소 delete
	public int delete(int p_idx, int r_idx) {
		
		dao = template.getMapper(ReservationDao.class);
		
		int result = dao.delete(r_idx);
		
//		탑승자 idx값 대조/ 비밀번호 확인?
		
		return result;
	}



	

//	예약 insert -- 할 때 운전자 메일 가져오기
	public String getDemail(int dr_idx) {
		
		dao = template.getMapper(ReservationDao.class);
		
		String Demail = dao.getDemail(dr_idx);
		
		System.out.println("서비스서비스" + Demail);  //지우자 
		
		return Demail;
	}

//	예약 insert -- 할 때 카풀 예약 요청 이메일 발송
	public int send(String Demail) {
		
		MimeMessage message = sender.createMimeMessage();
		
		try {
			message.setSubject("[YCAR]연차에서 새로운 카풀 요청이 도착했습니다.", "UTF-8");
			String htmlMsg = "<h2>고객님이 등록하신 카풀에 새로운 예약 요청이 도착했습니다! </h2>";
			
			htmlMsg += "<h3>연차 페이지에서 확인해주세요</h3>"; // 바로 수락(update) 거절(delete)할지 연차페이지로 보내야할지
			htmlMsg += "<h3><a href=#>연차로 이동</a></h3>"; //카풀 요청 페이지 주소 넣기 메일 페이지 양식 다시 만들자 

			message.setText(htmlMsg, "UTF-8", "html");
			message.setFrom(new InternetAddress("Ycar.official@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(Demail, "연차 운전자 고객님", "UTF-8"));
			
			sender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return 1;
	}

	
//	예약 delete -- 할 때 알림 이메일 
	public int cancelSend(String Demail) {
		
		MimeMessage message = sender.createMimeMessage();
		
		try {
			message.setSubject("[YCAR]연차의 카풀 예약이 취소되었습니다.", "UTF-8");
			String htmlMsg = "<h2>고객님의 예약이 탑승자님의 사정으로 취소되었습니다.  </h2>";
			
			htmlMsg += "<h3>취소된 예약은 자동으로 연차 카풀 대기 목록에 노출됩니다</h3>";
			htmlMsg += "<h3><a href=#>연차로 이동</a></h3>"; //나의카풀 페이지 주소 넣기 메일 페이지 양식 다시 만들자 

			message.setText(htmlMsg, "UTF-8", "html");
			message.setFrom(new InternetAddress("Ycar.official@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(Demail, "연차 운전자 고객님", "UTF-8"));
			
			sender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return 1;
	}
	
}