package com.angel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.angel.mapper.MemberMapper;
import com.angel.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper membermapper;
	
	@Override
	public void memberJoin(MemberVO member) throws Exception{
		
		membermapper.memberJoin(member);
	}
	
	@Override
	public int idCheck(String memberId) throws Exception{
		return membermapper.idCheck(memberId);
		
	}
	
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception{
		return membermapper.memberLogin(member);
	}

	@Override
	public MemberVO getMemberToOrder(String memberId) {
		
		return membermapper.getMemberToOrder(memberId);
	}
}
