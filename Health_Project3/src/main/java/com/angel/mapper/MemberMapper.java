package com.angel.mapper;

import com.angel.model.MemberVO;

public interface MemberMapper {

	//회원가입
	public void memberJoin(MemberVO member);

	//아이디 중복 검사
	public int idCheck(String memberId);

	//로그인
	public MemberVO memberLogin(MemberVO member);
	
	
	//memberId로 해당 member객체 Get
	public MemberVO getMemberToOrder(String memberId);
}


