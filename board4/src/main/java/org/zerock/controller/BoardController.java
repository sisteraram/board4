package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PageParam;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/list")
	public void listGET(@ModelAttribute("pageObj") PageParam param, Model model) {
		param.setTotal(service.count(param));
		model.addAttribute("list", service.getList(param));
	}
	
	@GetMapping("/register")
	public void registerGET() {
		
	}
	
	@PostMapping("/register")
	public String registerPOST(BoardVO vo, RedirectAttributes rttr) {
		
		log.info("-----------------------------------------");
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("-----------------------------------------");
		service.register(vo);
//		rttr.addFlashAttribute("result", vo.getBno());
//		
		return "redirect:/board/list";
	}
	
	@GetMapping({"/read", "/modify"})
	public void readGET(@ModelAttribute("pageObj") PageParam param, BoardVO vo, Model model) {
		
		model.addAttribute("board",service.read(vo));
	}
	
	@PostMapping("/modify")
	public String modifyPOST(@ModelAttribute("pageObj") PageParam param, BoardVO vo, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("result", service.modify(vo)? "SUCCESS":"FAIL");
		
		return "redirect:/board/list" + param.getLink();
	}
	
	@PostMapping("/delete")
	public String deletePOST(BoardVO vo, @ModelAttribute("pageObj") PageParam param, RedirectAttributes rttr) {
		
		List<BoardAttachVO> attachList = service.getAttachList(vo.getBno());
		if (service.delete(vo)) {
			deleteFiles(attachList);
		
		rttr.addFlashAttribute("result", service.delete(vo) == true? "SUCCESS":"FAIL");
		
		}
		return "redirect:/board/list" + param.getLink();
	}
	
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		
		log.info("getAttachList" + bno);
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	
	
	
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		
		if (attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files.......");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if (Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					
					Files.delete(thumbNail);
				}
				
			}catch (Exception e) {
				
				log.error("delete file error" + e.getMessage());
				
			}
		});
		
		
		
		
	}
	
}
