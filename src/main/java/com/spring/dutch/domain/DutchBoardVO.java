package com.spring.dutch.domain;

import java.sql.Timestamp;
import java.util.Date;
<<<<<<< HEAD
import java.util.List;

import lombok.AllArgsConstructor;
=======

>>>>>>> e2b5c22a1742134bd2bdb8fe7f7febfafe404d0c
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
<<<<<<< HEAD
@AllArgsConstructor
@ToString
public class DutchBoardVO {

=======
@ToString
public class DutchBoardVO {
	
>>>>>>> e2b5c22a1742134bd2bdb8fe7f7febfafe404d0c
	private long pno ;             //페이방고유번호
	private String category ;      //카테고리
	private long mno ;             //회원고유번호
	private String ptitle ;        //방제목
	private String pcontent ;      //방내용
	private Date pregDate ;        //방생성일자
	private Timestamp pmodDate ;   //방수정일자
	private int pdelFlag ;         //방삭제요청
	private int pdelFlagAdmin;     //방삭제(관리자)
	private long ppersonal;        //개인부담금액
	private int ptotalPayment ;    //전체금액
	private int pcalculated ;      //방정산완료

<<<<<<< HEAD
	private List<MemberVO> member;
	
//	private String nicknames ;
//	private String nicknames2 ;
//	private String nicknames3 ;
//	private String nicknames4 ;
	
	
=======
>>>>>>> e2b5c22a1742134bd2bdb8fe7f7febfafe404d0c
}
