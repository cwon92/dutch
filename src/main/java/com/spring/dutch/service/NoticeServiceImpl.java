package com.spring.dutch.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dutch.domain.NoticeVO;
import com.spring.dutch.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{

	private NoticeMapper noticeMapper;
	
	//모든 필드 초기 생성자
	public NoticeServiceImpl(NoticeMapper noticeMapper) {
		this.noticeMapper = noticeMapper;
	}

	//공지사항 목록 조회
	@Override
	public List<NoticeVO> getNoticeList() {
		
//		long rowTotal = noticeMapper.selectNoticeTotal(noticePaging);
//		
//		List<NoticeVO> noticeList = noticeMapper.selectNoticeList(noticePaging);
//		
//		NoticePagingCreatorDTO pagingCreator =
//				new NoticePagingCreatorDTO(rowTotal, noticePaging, noticeList);
//		
//		return pagingCreator;
		
		return noticeMapper.selectNoticeList();
	}

	//공지사항 등록
	@Override
	@Transactional
	public long registerNotice(NoticeVO notice) {
		
		noticeMapper.insertNotice(notice);
		
		return notice.getCno();
	}

	//공지사항 조회: 특정 공지사항 하나의 데이터를 가져옴
	@Override
	@Transactional
	public NoticeVO getNotice(long cno, String result) {

		NoticeVO notice = noticeMapper.selectNotice(cno);  

		return notice;
	}

	//특정 공지사항 수정 삭제 화면 호출
	@Override
	public NoticeVO getNotice2(long cno) {

		NoticeVO notice = noticeMapper.selectNotice2(cno);

		return notice;
	}

	//특정 공지사항 수정
	@Override
	@Transactional
	public boolean modifyNotice(NoticeVO notice) {

		long cno = notice.getCno();
		
		boolean noticeModifyResult = (noticeMapper.updateNotice(notice) == 1);
		
		return noticeModifyResult;
	}

	//특정 공지사항 삭제
	@Override
	@Transactional
	public boolean removeNotice(long cno) {

		int rows = noticeMapper.deleteNotice(cno);
		
		return (rows == 1);
	}

	
	
}
