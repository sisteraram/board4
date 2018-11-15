package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PageParam;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper attachMapper;
	
	
	@Override
	public List<BoardVO> getList(PageParam param) {

		return mapper.getList(param);
	}
	
	
	@Transactional
	@Override
	public void register(BoardVO vo) {
		log.info("register...." + vo);
		
		mapper.insertSelectKey(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		vo.getAttachList().forEach(attach ->{
			
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
			
		});
	}

	@Override
	public BoardVO read(BoardVO vo) {

		return mapper.read(vo);
	}

	
	@Transactional
	@Override
	public boolean modify(BoardVO vo) {

		log.info("modify ...." + vo);
		
		attachMapper.deleteAll(vo.getBno());
		
		boolean modifyResult = mapper.modify(vo) == 1;
		
		if (modifyResult && vo.getAttachList().size() > 0) {
			
			vo.getAttachList().forEach(attach -> {
				
				attach.setBno(vo.getBno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}

	
	@Transactional
	@Override
	public boolean delete(BoardVO vo) {

		attachMapper.deleteAll(vo.getBno());
		
		return mapper.delete(vo) == 1;
	}

	@Override
	public int count(PageParam param) {
		
		return mapper.count(param);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}

}
