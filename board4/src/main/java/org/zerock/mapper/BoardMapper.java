package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PageParam;

public interface BoardMapper {
	
	public List<BoardVO> getList(PageParam param);
	
	public void register(BoardVO vo);
	
	public void insertSelectKey(BoardVO vo);
	
	public BoardVO read(BoardVO vo);
	
	public int modify(BoardVO vo);
	
	public int delete(BoardVO vo);
	
	public int count(PageParam param);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

}
