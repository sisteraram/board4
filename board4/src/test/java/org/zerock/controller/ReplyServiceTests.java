package org.zerock.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTests {
	
	@Setter(onMethod_=@Autowired)
	private ReplyService service;
	
	@Test
	public void testRegister() {
		
		ReplyVO vo = new ReplyVO();
		vo.setBno(528L);
		vo.setReply("Hello Reply");
		vo.setReplyer("replyer111");
		
		service.register(vo);
	}

}
