package org.zerock.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberAuthMapper;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private MemberAuthMapper Authmapper;
	
	
	@Override
	@Transactional
	public int register(MemberVO vo) {
		
		AuthVO authVO = new AuthVO();
		authVO.setUserid(vo.getUserid());
		authVO.setAuth("ROLE_MEMBER");
		
		mapper.insertMember(vo);
		
		return Authmapper.insertMemberAuth(authVO);
	}

}
