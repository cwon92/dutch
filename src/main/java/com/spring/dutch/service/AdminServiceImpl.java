package com.spring.dutch.service;

import org.springframework.stereotype.Service;

import com.spring.dutch.dto.AdminDTO;
import com.spring.dutch.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	private AdminMapper adminMapper;
	
	public AdminServiceImpl(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}
	
	
	@Override
	public AdminDTO takeMemberLists() {

		return new AdminDTO(adminMapper.selectMemb());
	}

	
	

}
