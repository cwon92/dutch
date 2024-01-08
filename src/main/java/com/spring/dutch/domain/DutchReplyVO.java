package com.spring.dutch.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class DutchReplyVO {
	
	private long rno ;
	private long mno ;
	private long pno ;
	private String rcontent ;
	private int rdelFlag ;
	private Date rregDate ;
	private Timestamp rmodDate ;
	private int rcno ; 
	
	
	
	
	
/*	
	   rno number(10) NOT NULL, --댓글고유번호
	   mno number(10) NOT NULL, --회원고유번호
	   pno number(10) NOT NULL, --페이방고유번호
	   rcontent varchar2(1000) NOT NULL, --댓글내용
	   rdelFlag number(1) DEFAULT 0 NOT NULL, --댓글삭제
	   rregDate DATE DEFAULT sysdate NOT NULL, --댓글생성일자
	   rmodDate Timestamp DEFAULT systimestamp(0), --댓글수정일자
	   rcno number(10) --답글고유번호
*/
	
	
	
}
