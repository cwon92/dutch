package com.spring.dutch.mapper;

import java.util.List;

import com.spring.dutch.domain.CardAttachFileVO;
import com.spring.dutch.domain.CardVO;
import com.spring.dutch.dto.CardPagingDTO;

public interface CardMapper {
	public List<CardVO> selectList(CardPagingDTO cardPaging);
	
	public long selectRows(CardPagingDTO cardPaging);
	
	public int insertCard(CardVO card);

	//특정 게시물의 첨부파일 목록 조회
	public CardAttachFileVO selectAttachFiles(String kno) ;
		
	//첨부파일 추가
	public void insertAttachFile(CardAttachFileVO attachFile) ;
		
	//특정 첨부파일 삭제
	public void deleteAttachFile(String uuid) ;
		
	//특정 게시물의 모든 첨부파일 삭제
	//게시물 삭제 시, 해당 게시물의 모든 첨부파일을 삭제해야 게시물이 삭제됨
	//(on delete cascade 옵션이 없는 F.K인 경우),  
	public int deleteAttachFiles(String bno) ;
}
