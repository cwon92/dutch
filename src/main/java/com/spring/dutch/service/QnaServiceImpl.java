package com.spring.dutch.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dutch.domain.QnaVO;
import com.spring.dutch.dto.QnaPagingCreatorDTO;
import com.spring.dutch.dto.QnaPagingDTO;
import com.spring.dutch.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService{
	
	private QnaMapper qnaMapper;

	//모든 필드 초기 생성자
	public QnaServiceImpl(QnaMapper qnaMapper) {
		this.qnaMapper = qnaMapper;
	}
	
	//QNA 목록조회
//	@Override
//	public List<QnaVO> getQnaList() {
//		
////		return new QnaPagingCreatorDTO(qnaMapper.selectQnaTotal(),
////								       qnaPaging,
////								       qnaMapper.selectQnaList());
//		
//		return qnaMapper.selectQnaList();
//	}
	
	@Override
	public QnaPagingCreatorDTO getQnaList(QnaPagingDTO qnaPaging) {
		
//		return new QnaPagingCreatorDTO(qnaMapper.selectQnaTotal(),
//								       qnaPaging,
//								       qnaMapper.selectQnaList());
		
		return new QnaPagingCreatorDTO(qnaMapper.selectQnaTotal(qnaPaging), 
									   qnaPaging,
									   qnaMapper.selectQnaList(qnaPaging));
	}

	//QNA 등록
	@Override
	@Transactional
	public long registerQna(QnaVO qna) {

		qnaMapper.insertQna(qna);
		
		return qna.getQno();
	}

	//QNA 조회: 특정 QNA 하나의 데이터를 가져옴
	@Override
	@Transactional
	public QnaVO getQna(long qno) {

		QnaVO qna = qnaMapper.selectQna(qno);
		
		return qna;
	}

	//특정 QNA 수정 삭제 화면 호출
	@Override
	public QnaVO getQna2(long qno) {

		QnaVO qna = qnaMapper.selectQna2(qno);
		
		return qna;
	}

	//특정 QNA 수정
	@Override
	@Transactional
	public boolean modifyQna(QnaVO qna) {
		long qno = qna.getQno();
		
		boolean qnaModifyResult = (qnaMapper.updateQna(qna) == 1);
		
		return qnaModifyResult;
	}

	//특정 QNA 삭제
	@Override
	@Transactional
	public boolean removeQna(long qno) {

		int rows = qnaMapper.deleteQna(qno);
		
		return (rows == 1);
	}

	@Override
	@Transactional
	public boolean modifyQdelFlagAdmin(long qno) {
		
		int rows = qnaMapper.updateQdelFlagAdmin(qno);
		
		return (rows == 1);
	}



	
	
	//
}
