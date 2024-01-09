package com.spring.dutch.mapper;

import java.util.List;

import com.spring.dutch.domain.MemberVO;


public interface MypageMapper {

	//회원정보 가져오기
	public MemberVO selectMemberData(String mno);
	
	//회원정보 수정 (UPDATE)
	public int updateMember(MemberVO member);
	
	//회원 탈퇴 (DELETE)
	public int deleteMember(String mno);
}
