package com.angel.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.angel.model.Criteria;
import com.angel.model.MemberVO;
import com.angel.model.ProductVO;

import lombok.extern.log4j.Log4j;




@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {

	@Autowired
	private MemberMapper membermapper; //인터페이스 의존성 주입

	@Autowired
	private ProductMapper productmapper;
	
	//회원가입 쿼리 테스트 메서드
	//@Test
	 public void memberJoin() throws Exception{
		
		MemberVO member = new MemberVO();
		
		member.setMemberId("testID");
		member.setMemberPw("testPW");
		member.setMemberName("testName");
		member.setMemberMail("testMail");
		member.setMemberAddr1("testAddr1"); 
		member.setMemberAddr2("testAddr2"); 
		member.setMemberAddr3("testAddr3"); 

		membermapper.memberJoin(member); //쿼리 메서드 실행
	}
	
	//아이디 중복 검사
	//@Test
	public void memberIdChk() throws Exception{
		String id = "testID"; //실제 데이터베이스에 존재하는 아이디
		String id2 = "test"; //실제 데이터베이스에 존재하지 않는 아이디
		membermapper.idCheck(id);
		membermapper.idCheck(id2);
	}
	
	//로그인 쿼리 매퍼 메서드 테스트
	//@Test
	public void memberLogin() throws Exception{
		
		MemberVO member = new MemberVO(); //MemberVO 변수 선언 및 초기화
		
		//올바른 id,pw
//		member.setMemberId("유미");
//		member.setMemberPw("1234");
		
		//올바르지 않은 id,pw
		member.setMemberId("유미123");
		member.setMemberPw("123456");

		membermapper.memberLogin(member); //쿼리 메서드 실행
		System.out.println("결과 값 : " + membermapper.memberLogin(member));
	}
	
	
	@Test
	public void testPaging() {
		
		Criteria cri=new Criteria();
		List<ProductVO> list=productmapper.selectWithPaging(cri);
		list.forEach(board->log.info(board));
	}
 	
	
}
