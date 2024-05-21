package com.angel.controller;

import java.io.File;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.angel.model.MemberVO;
import com.angel.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	private MemberService memberservice;

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private JavaMailSender mailSender2;

	// 회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void loginGET() {
		log.info("회원가입 페이지 진입");
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void joinGET() {
		log.info("로그인 페이지 진입");
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {

		log.info("join 진입");
		// 회원가입 서비스 실행
		memberservice.memberJoin(member);
		log.info("join Service 성공");

		return "redirect:/main";
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {

		log.info("memberIdChk() 진입");
		int result = memberservice.idCheck(memberId);
		log.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 중복된 아이디가 존재
		} else {
			return "success"; // 중복된 아이디가 없음
		}
	} // 메서드 End

	// MimeMessage 객체를 직접 생성하여 메일 전송
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public void sendMailTest() throws Exception {
		String subject = "test 메일";
		String content = "메일 테스트 내용"
				+ "<img src=\"https://blog.kakaocdn.net/dn/cssZNA/btsbtefJFRI/Aq8KgwKe18GyXPRiWbu6KK/img.jpg\">";
		String from = "sinna3210@gmail.com";
		String to = "sinna3210@gamil.com";

		try {
			MimeMessage mail = mailSender2.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			// true는 멀티파트 메세지를 사용하겠다는 의미

			/*
			 * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능하다 MimeMessageHelper mailHandler = new
			 * MimeMessageHelper(mail,true,"UTF-8");
			 */

			mailHelper.setFrom(from);
			// 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setForm()) 반드시 필요

			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			// true는 HTML을 사용하겠다는 의미 (이미지 첨부 가능)

			FileSystemResource file = new FileSystemResource(new File("C:\\upload.txt"));
			mailHelper.addAttachment("업로드파일.형식", file);

			mailSender2.send(mail);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// MimeMessagePreparator를 사용하여 메일을 전송
	@RequestMapping(value = "/sandMail", method = RequestMethod.GET)
	public void sendMailTest2() throws Exception {
		String subject = "test 메일";
		String content = "메일 테스트 내용";
		String from = "oum00321@naver.com";
		String to = "oum0321@naver.com";

		final MimeMessagePreparator preparator = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

				mailHelper.setFrom(from);
				mailHelper.setTo(to);
				mailHelper.setSubject(subject);
				mailHelper.setText(content, true);
			}
		};

		try {
			mailSender2.send(preparator);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		// 뷰로부터 넘어온 데이터 확인
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + email);

		// 인증번호 난수 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 = " + checkNum);

		// 이메일 보내기
		String setFrom = "sinna3210@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 메일입니다.";
		String content = "안녕하세요? 홈페이지를 방문해주셔서 감사합니다" + "<br><br>" + "인증번호는 " + checkNum + "입니다." + "<br><br>"
				+ "해당 인증 번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender2.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender2.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum); //형 변환
		
		return num;
	}
	
	//로그인
	@PostMapping("/login")
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
		
		log.info("login 메서드 진입");
		log.info("전달된 데이터 : " + member);
		
		HttpSession session = request.getSession();
		MemberVO mvo = memberservice.memberLogin(member);
		
		if(mvo == null) { //DB에 없는 id와 pw 입력시
			int result = 0; //0은 거짓
			rttr.addFlashAttribute("result",result);
			return "redirect:/member/login";
		}
		
		//DB에 존재하는 id,pw 입력시 (로그인 성공)
		session.setAttribute("member", mvo); 
		return "redirect:/main";

	}

	//메인페이지 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
		log.info("logoutMainGET 메서드 진입");
		
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/main";
    }
	
	//비동기식 로그아웃
	@ResponseBody
	@PostMapping("/logout")
	public void logoutPOST(HttpServletRequest request)throws Exception{
		log.info("비동기식 로그아웃 메서드 진입");
		HttpSession session = request.getSession();
		session.invalidate();
	}	
	
}
