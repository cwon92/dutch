package com.spring.dutch.dto;

import java.util.List;

import com.spring.dutch.domain.MemberVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AdminDTO {
	private List<MemberVO> membList;
	
}
