package org.zerock.service;

import java.util.List;

import org.zerock.domain.PageParam;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno);
	
	public List<ReplyVO> getList(PageParam param, Long bno);
	
	public ReplyPageDTO getListPage(PageParam param, Long bno);
}
