package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userid, userpw, username;
	private boolean enabled;
	private Date regdate, updateDate;
	
	private List<AuthVO> authList;	//조인해서 한번에 처리하기 위해서
	
}
