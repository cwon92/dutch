package com.spring.dutch.service;


import org.springframework.stereotype.Service;

import com.spring.dutch.domain.MemberVO;
import com.spring.dutch.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService {

	private MypageMapper mypageMapper ;
	
	public MypageServiceImpl (MypageMapper mypageMapper) {
		this.mypageMapper = mypageMapper ;
	}
	
	//회원정보 가져오기
	@Override
	public MemberVO getMemberData (long mno) {
		
		MemberVO memberData = mypageMapper.selectMemberData(mno);
		
		return memberData;
	}
	
	
	//회원정보 수정 (UPDATE)
	@Override
	public boolean modifyMember(MemberVO member) {
		
		boolean memberModifyResult = (mypageMapper.updateMember(member) == 1);
		
		return memberModifyResult;
	}
	
	
	
}
