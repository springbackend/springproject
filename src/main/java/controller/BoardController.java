package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.BoardService;
import util.Common;
import vo.BoardVO;

@Controller
public class BoardController {

	BoardService board_service;
	
	@Autowired
	HttpServletRequest request;

	public BoardController(BoardService board_service) {
		this.board_service = board_service;
	}

	@RequestMapping(value = { "/", "/board_list.do" })
	public String board_list(Model model) {

		 List<BoardVO> list = board_service.board_list();
		  
		 model.addAttribute("list", list);

		return Common.Board.VIEW_PATH + "board_list.jsp";
	}

	@RequestMapping("/board_write.do")
	public String board_write() {
		return Common.Board.VIEW_PATH + "board_write.jsp";
	}
	
	@RequestMapping("/board_upload.do")
	//@ResponseBody
	public String board_upload(BoardVO vo) {
		String ip = request.getRemoteAddr();
		
		vo.setIp(ip);
		
		//foreign key
		vo.setM_idx(1);
		
		//int res = board_service.board_upload(vo);
		
		//String result = "Fail";
		
//		if(res != 0) {
//			result = "Success";
//		}
		
		//Ajax 안됨
		return "redirect:board_list.do";
		
	}
	
}




























