package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PageParam;

public interface BoardService {
	
public List<BoardVO> getList(PageParam param);
	
	public void register(BoardVO vo);
	
	public BoardVO read(BoardVO vo);
	
	public boolean modify(BoardVO vo);
	
	public boolean delete(BoardVO vo);
	
	public int count(PageParam param);
	
	public List<BoardAttachVO> getAttachList(Long bno);
}
