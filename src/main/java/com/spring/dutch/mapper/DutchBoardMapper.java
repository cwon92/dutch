package com.spring.dutch.mapper;

import java.util.List;

import com.spring.dutch.dto.DutchBoardPagingDTO;
import com.spring.dutch.dto.DutchRegisterPagingDTO;
import com.spring.dutch.domain.DutchBoardVO;
import com.spring.dutch.domain.MemberVO;

public interface DutchBoardMapper {

	//게시물 목록조회(READ)
	public List<DutchBoardVO> selectDutchBoardList(DutchBoardPagingDTO ductPaging) ;

	//게시물 총수(READ)
	public long selectDutchRowTotal(DutchBoardPagingDTO dutchboardPaging);

	//더치페이 게시물 등록(CREATE)
	public int insertDutchBoard(DutchBoardVO dutchBoard);

	//더치페이 특정 게시물 조회(detail.jsp): 특정 게시물 데이터를 가져옴
	public DutchBoardVO selectDutchBoard(long pno);
	
	//더치페이 특정 게시물 조회(modify.jsp): 특정 게시물 데이터를 가져옴
	public DutchBoardVO selectDutchBoard2(long pno);

	//member에서 nickname 하나 가져오기
	public MemberVO selectDutchNickname(long mno);
	
	//회원정보(memberVO) 전체 목록
	public List<MemberVO> getAllMembers(DutchRegisterPagingDTO dutchRegisterPaging);
	
	//회원정보(memberVO) 게시물 갯수
	public long selectMemberRowTotal(DutchRegisterPagingDTO dutchRegisterPaging);
	
	//특정 게시물 수정(UPDATE)
	public int updateMyBoard(DutchBoardVO dutchBoard);
	
	//특정 게시물 삭제(DELETE)
	public int deleteMyBoard(long pno);
	
	//관리자 게시물 삭제 표시하기(pdelflagAdmin)
	public int updatepdelFlagAdmin(long pno);
	
	
	
}