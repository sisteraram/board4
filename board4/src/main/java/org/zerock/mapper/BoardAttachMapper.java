package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AttachFileDTO;
import org.zerock.domain.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public void deleteAll(int bno);
	
	public List<BoardAttachVO> findByBno(Long bno);
}
