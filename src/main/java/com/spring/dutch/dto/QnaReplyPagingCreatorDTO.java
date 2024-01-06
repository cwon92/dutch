package com.spring.dutch.dto;

import java.util.List;

import com.spring.dutch.domain.QnaReplyVO;
import com.spring.dutch.domain.QnaVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class QnaReplyPagingCreatorDTO {
	
	private QnaReplyPagingDTO qnareplyPaging;
	private List<QnaReplyVO> qnareply;
	private long replyTotCnt;
	
	public QnaReplyPagingCreatorDTO(List<QnaReplyVO> qnareply,
								 long replyTotCnt,
							 	 QnaReplyPagingDTO qnareplyPaging) {
		
		this.qnareply = qnareply;
		this.replyTotCnt = replyTotCnt;
		this.qnareplyPaging = qnareplyPaging;
		
	}
	
}
