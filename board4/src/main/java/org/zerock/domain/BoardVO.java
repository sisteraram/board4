package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private int views;
	private String title;
	private String writer;
	private String content;
	private String del;
	private Date regdate, updatedate;
	
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;
}
