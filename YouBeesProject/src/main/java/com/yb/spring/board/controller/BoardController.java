package com.yb.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.yb.spring.board.model.service.BoardService;
import com.yb.spring.board.model.vo.Board;
import com.yb.spring.board.model.vo.Comments;
import com.yb.spring.board.model.vo.Likes;
import com.yb.spring.common.model.vo.PageInfo;
import com.yb.spring.common.template.Pagination;

@Controller
public class BoardController {

   @Autowired
   private BoardService bService;

   /*
    * @RequestMapping("boardList.bo") public String boardList() { return
    * "board/boardList"; }
    */

   @RequestMapping("boardList.bo")
   public ModelAndView selectList(@RequestParam(value = "cpage", defaultValue = "1") int nowPage, ModelAndView mv) {
      int listCount = bService.selectListCount();
      PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 10);
      ArrayList<Board> list = bService.selectList(pi);

      mv.addObject("pi", pi).addObject("list", list).setViewName("board/boardList");
      return mv;

   }

   @RequestMapping("insert.bo")
   public String boardWriteForm(Board b, MultipartFile upfile, HttpSession session, Model model) {

      if (!upfile.getOriginalFilename().equals("")) {

         String changeName = changeFilename(upfile, session);
         b.setOriginName(upfile.getOriginalFilename());
         b.setChangeName("resources/uploadFiles/" + changeName);
      }
      System.out.println(session.getServletContext().getRealPath("/resources/uploadFiles/"));
      int result = bService.insertBoard(b);

      if (result > 0) {
         session.setAttribute("alertMsg", "게시글이 성공적으로 등록되었습니다.");
         return "redirect:boardList.bo";
      } else {
         model.addAttribute("errorMsg", "게시글 등록이 실패하였습니다.");
         return "/board/boardWrite";
      }
   }

   public String changeFilename(MultipartFile upfile, HttpSession session) {
      String originName = upfile.getOriginalFilename();
      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
      int ranNum = (int) (Math.random() * 90000 + 10000);
      String ext = originName.substring(originName.lastIndexOf("."));
      String changeName = currentTime + ranNum + ext;

      // 업로드 시키고자 하는 폴더의 물리적인 경로 알아오기
      String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
      System.out.println(savePath);
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
   public ModelAndView selectBoard(Board d, ModelAndView mv) {
      int result = bService.increaseCount(d.getBnum());
      int likeCnt = bService.selectLikesCount(d.getBnum());
      if (result > 0) {
         Board b = bService.selectBoard(d);
         mv.addObject("likeCnt", likeCnt);
         mv.addObject("b", b).setViewName("board/boardRead");
      } else {
         mv.addObject("errorMsg", "접근 오류");
      }
      return mv;
   }

   @RequestMapping("updateForm.bo")
   public String updateBoard(Board b, Model model) {
      model.addAttribute("b", bService.selectBoard(b));
      return "board/boardUpdate";
   }

   @RequestMapping("update.bo")
   public String updateBoard(Board b, MultipartFile reupfile, HttpSession session, Model model) {
      System.out.println(b);
      if (!reupfile.getOriginalFilename().equals("")) {
         if (b.getOriginName() != null) {
            new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
         }
         String changeName = changeFilename(reupfile, session);

         b.setOriginName(reupfile.getOriginalFilename());
         b.setChangeName("resources/uploadFiles/" + changeName);
      }

      int result = bService.updateBoard(b);
      if (result > 0) {
         session.setAttribute("alertMsg", "게시글이 수정되었습니다😀");
         return "redirect:boardRead.bo?bnum=" + b.getBnum();
      } else {
         model.addAttribute("errorMsg", "게시글 수정에 실패했습니다😢");
         return "board/errorpage";
      }

   }

   @RequestMapping("delete.bo")
   public String deleteBoard(int bnum, String filePath, HttpSession session, Model model) {
      int result = bService.deleteBoard(bnum);
      if (result > 0) {
         if (!filePath.equals("")) {
            new File(session.getServletContext().getRealPath(filePath)).delete();
         }
         session.setAttribute("alertMsg", "게시글이 삭제되었습니다");
         return "redirect:boardList.bo";
      } else {
         model.addAttribute("errorMsg", "게시글 삭제에 실패했습니다😢");
         return "board/errorPage";
      }
   }
   
     // 좋아요
     @ResponseBody     
     @RequestMapping(value="lselect.bo",produces="application/json; charset=utf-8") 
     public String insertLikes(Likes l) {
        
        int result = bService.selectLikes(l); 
        int likeCnt = 0;
        if(result > 0) { 
           bService.updateLikes(l); 
           likeCnt = bService.selectLikesCount(l.getBnum()); 
        }else {         
           bService.insertLikes(l);
           likeCnt = bService.selectLikesCount(l.getBnum()); 
        } 
           return new Gson().toJson(likeCnt); 
      }
     
     @ResponseBody     
     @RequestMapping(value="lcancel.bo",produces="application/json; charset=utf-8")
     public String cancelLikes(Likes l) {
        int result = bService.selectLikes(l);
        int likeCnt = 0;
        if( result > 0 ) {
           bService.cancelLikes(l);
           likeCnt = bService.selectLikesCount(l.getBnum()); 
        }
        
        return new Gson().toJson(likeCnt);     
     }
       
    
   
   
   //댓글
   @ResponseBody
   @RequestMapping("rinsert.bo")
   public String ajaxInsertReply(Comments c) {
      int result = bService.insertComment(c);
      return result > 0 ? "success" : "fail";
   }

   @ResponseBody
   @RequestMapping(value = "rlist.bo", produces = "application/json; charset=utf-8")
   public String ajaxSelectReplyList(int bno) {
      ArrayList<Comments> list = bService.selectCommentList(bno);
      return new Gson().toJson(list);
   }

   
     @ResponseBody
     @RequestMapping(value = "rupdate.bo", produces = "application/json; charset=utf-8") 
     public String updateComment(Comments c) {
        int result = bService.updateComment(c);
        return result > 0 ? "success" : "fail";     
     }
     
     @RequestMapping("rdelete.bo")
     public String deleteComment(int cnum, Board d, HttpSession session, Model model ) {
        int result = bService.deleteComment(cnum);
        Board b = bService.selectBoard(d);
        model.addAttribute("b", b);
        return "board/boardRead"; 
     }
     
     
 	@RequestMapping("myComment.bo")
 	public String myCommentList(int cusNum, Model model) {
 		
 		return "member/replyList";
 	}
     
 	// 인기커뮤니티 TOP4 가져오기(메인페이지)
	@ResponseBody
	@RequestMapping(value="selectTopBoardList.bo", produces="application/json; charset=utf-8")
	public String selectTopBoardList() {
		
	ArrayList<Board> list = bService.selectTopBoardList();
	return new Gson().toJson(list);
	}
    

}