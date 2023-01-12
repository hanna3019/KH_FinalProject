package com.yb.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.yb.spring.board.model.service.BoardService;
import com.yb.spring.board.model.vo.Board;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("boardList.bo")
	public String boardList() {
		return "board/boardList";
	}
	
	@RequestMapping("insert.bo")
public String boardWriteForm(Board b, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = changeFilename(upfile, session);
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/" + changeName);
		}
			
		int result = bService.insertBoard(b);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글이 성공적으로 등록되었습니다.");
			return "redirect:boardList.bo";
		}
		else{
			model.addAttribute("errorMsg","게시글 등록이 실패하였습니다.");
			return "views/board/boardWrite";
		}			
	}
	
	public String changeFilename(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles");
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;		
	}
	
	
	@RequestMapping("boardWriteForm.bo")
	public String boardWriteForm() {
		return "board/boardWrite";
	}
	

	@RequestMapping("boardRead.bo")
	public String boardRead() {
		return "board/boardRead";
	}
	
}
