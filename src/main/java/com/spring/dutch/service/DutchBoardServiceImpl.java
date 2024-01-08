package com.spring.dutch.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dutch.domain.DutchBoardVO;
import com.spring.dutch.domain.MemberVO;
import com.spring.dutch.dto.DutchBoardPagingCreatorDTO;
import com.spring.dutch.dto.DutchBoardPagingDTO;
import com.spring.dutch.dto.DutchGroupNicknameDTO;
import com.spring.dutch.dto.DutchRegisterPagingCreatorDTO;
import com.spring.dutch.dto.DutchRegisterPagingDTO;
import com.spring.dutch.mapper.DutchBoardMapper;

@Service
public class DutchBoardServiceImpl implements DutchBoardService{

	private DutchBoardMapper dutchBoardMapper ;


	//모든 필드 초기화 생성자
	public DutchBoardServiceImpl(DutchBoardMapper dutchBoardMapper) {	
		this.dutchBoardMapper = dutchBoardMapper;

//		System.out.println("DutchBoardServiceImpl의 모든 필드 초기화생성자입니다.");
//		System.out.println("dutchBoardMapper: " + dutchBoardMapper);
	}

	//더치페이 목록 조회
	@Override
	public DutchBoardPagingCreatorDTO getDutchList(DutchBoardPagingDTO dutchPaging) {



		return new DutchBoardPagingCreatorDTO(dutchBoardMapper.selectDutchRowTotal(dutchPaging), 
				                              dutchPaging, 
				                              dutchBoardMapper.selectDutchBoardList(dutchPaging));
	}

	//더치페이 등록 
	@Override
	public long DutchregisterBoard(DutchBoardVO dutchBoard) {

		dutchBoardMapper.insertDutchBoard(dutchBoard);

		return dutchBoard.getPno();
	}

	//더치페이 특정 게시물 조회 : 특정 게시물 하나의 데이터를 가져옴
	@Override
	public DutchBoardVO getDutchBoard(long pno) {

		DutchBoardVO dutchboard = dutchBoardMapper.selectDutchBoard(pno);

		return dutchboard;
	}
	
	//member 회원정보 전체 목록
	@Override
	public DutchRegisterPagingCreatorDTO getAllMembers(DutchRegisterPagingDTO dutchRegisterPaging){
		
		
		return new DutchRegisterPagingCreatorDTO(dutchBoardMapper.selectMemberRowTotal(dutchRegisterPaging), 
												 dutchRegisterPaging, 
				                                 dutchBoardMapper.getAllMembers(dutchRegisterPaging));
	}

	//member 회원정보 닉네임 가져오기
	@Override
	public MemberVO selectDutchNickname(long mno) {
		
		return dutchBoardMapper.selectDutchNickname(mno);
	}
	
	//특정 게시물 수정 삭제 화면 호출
	@Override
	public DutchBoardVO getDutchBoard2(long pno) {
		
		DutchBoardVO dutchboard = dutchBoardMapper.selectDutchBoard2(pno);
		
		return dutchboard;
	}
	
	//특정 더치페이 게시물 수정
	@Override
	public boolean modifyBoard(DutchBoardVO dutchBoard) {
		
		//long pno = dutchBoard.getPno();
		
		boolean boardModifyResult = (dutchBoardMapper.updateMyBoard(dutchBoard) == 1);
			
		return boardModifyResult;
	}
	
	//특정 더치페이 게시물 삭제 (delete)
	@Override
	public boolean removeBoard(long pno) {
		
		int rows = dutchBoardMapper.deleteMyBoard(pno);
		
		return (rows == 1);
	}

	//특정 더치페이 게시물 관리자 삭제(pdelflagAdmin)
	@Override
	public boolean modifypdelflagAdmin(long pno) {
		
		int rows = dutchBoardMapper.updatepdelFlagAdmin(pno);
		
		return (rows == 1);
	}

	@Override
	public DutchGroupNicknameDTO registerNicknames(String nicknames, String nicknames2, String nicknames3, String nicknames4) {

		
		return null;
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	




}