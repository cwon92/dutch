package com.spring.dutch.service;

<<<<<<< HEAD
import java.util.List;

import com.spring.dutch.domain.DutchBoardVO;
import com.spring.dutch.domain.MemberVO;
import com.spring.dutch.dto.DutchBoardPagingCreatorDTO;
import com.spring.dutch.dto.DutchBoardPagingDTO;
import com.spring.dutch.dto.DutchGroupNicknameDTO;
import com.spring.dutch.dto.DutchRegisterPagingCreatorDTO;
import com.spring.dutch.dto.DutchRegisterPagingDTO;

public interface DutchBoardService {

=======
import com.spring.dutch.domain.DutchBoardVO;
import com.spring.dutch.dto.DutchBoardPagingCreatorDTO;
import com.spring.dutch.dto.DutchBoardPagingDTO;

public interface DutchBoardService {
	
>>>>>>> e2b5c22a1742134bd2bdb8fe7f7febfafe404d0c
	//더치페이 목록조회(READ)
	public DutchBoardPagingCreatorDTO getDutchList(DutchBoardPagingDTO dutchPaging) ;

	//더치페이 게시물 등록(CREATE)
	public long DutchregisterBoard(DutchBoardVO dutchBoard);
<<<<<<< HEAD

	//특정 게시물 조회: 특정 게시물 하나의 데이터를 가져옴(detail.jsp)
	public DutchBoardVO getDutchBoard(long pno);
	
	//회원정보 전체목록
	public DutchRegisterPagingCreatorDTO getAllMembers(DutchRegisterPagingDTO dutchRegisterPaging);
	
	//Member에서 닉네임 가져오기
	public MemberVO selectDutchNickname(long mno);
	
	//수정 페이지 호출 및 삭제 화면 호출 및 조회페이지(modify.jsp)
	public DutchBoardVO getDutchBoard2(long pno);
	
	//특정 게시물 수정(UPDATE)
	public boolean modifyBoard(DutchBoardVO dutchBoard);
	
	//특정 게시물 삭제(DELETE)
	public boolean removeBoard(long pno);
	
	//관리자 게시물 삭제 표시하기(pdelflagAdmin)
	public boolean modifypdelflagAdmin(long pno);

	//input에 입력된 닉네임 dto에 저장된 값
	public DutchGroupNicknameDTO registerNicknames(String nicknames, String nicknames2, String nicknames3, String nicknames4);
	

	
	

=======
	
	//특정 게시물 조회: 특정 게시물 하나의 데이터를 가져옴
	public DutchBoardVO getDutchBoard(long pno);
	
	
>>>>>>> e2b5c22a1742134bd2bdb8fe7f7febfafe404d0c
	
}
