package com.spring.dutch.mapper;

import java.util.List;

import com.spring.dutch.domain.NoticeVO;
import com.spring.dutch.dto.BoardPagingDTO;

public interface NoticeMapper {

	//목록조회(READ)
	public List<NoticeVO> selectNoticeList(BoardPagingDTO boardPaging);

	//게시물 총수(READ)
	public long selectNoticeTotal(BoardPagingDTO boardPaging);

	//특정게시물조회: 하나의 데이터만 가져옴1
	public NoticeVO selectNotice(Long cno);

	//특정게시물조회2
	public NoticeVO selectNotice2(Long cno);

	//등록(CREATE)
	public int insertNotice(NoticeVO notice);

	//수정(UPDATE)
	public int updateNotice(NoticeVO notice);

	//삭제(DELETE)
	public int deleteNotice(Long cno); 

	//조회수증가(+1씩 증가/ UPDATE)
	public int updateCviewCnt(long cno);

	//카테고리 수정
	public int updateCcategory(NoticeVO notice);

	//댓글x
}