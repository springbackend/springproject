package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ProductDAO;
import dao.ToneDAO;
import service.BoardService;
import service.CommentService;
import service.LikesService;
import service.ToneService;
import util.Common;
import util.BoardPaging;
import vo.BoardVO;
import vo.CommentVO;
import vo.LikesVO;

@Controller
public class BoardController {

	BoardService board_service;
	ToneService tone_service;
	CommentService comment_service;
	LikesService likes_service;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	public BoardController(BoardService board_service, ToneService tone_service, CommentService comment_service, LikesService likes_service) {
		this.board_service = board_service;
		this.tone_service = tone_service;
		this.comment_service = comment_service;
		this.likes_service = likes_service;
	}

	//게시글 리스트
	@RequestMapping(value = { "/", "/board_list.do" })
	public String board_list(Model model, Integer page) {

		int nowPage = 1;
		
		if(page != null) { 
			nowPage = page; 
		}
		
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		
		//map에 start, end를 저장하여 DB로 보낸다
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		List<BoardVO> list = board_service.board_list(map);
		
		//Session에 저장된 Show라는 이름의 정보를 삭제해줘야 다시 접근했을 때 조회수가 올라감
		request.getSession().removeAttribute("show");
		 
		//전체 게시글 수 가져오기
		int row_total = board_service.getRowTotal();
		
		//하단에 들어가는 페이징 메뉴 생성
		String pageMenu = BoardPaging.getPaging("board_list.do", nowPage, row_total, 
							Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		 

		return Common.Board.VIEW_PATH + "board_list.jsp";
	}

	//새 게시글 작성 폼으로 이동
	@RequestMapping("/board_write.do")
	public String board_write() {
		return Common.Board.VIEW_PATH + "board_write.jsp"; 
	}
	
	//새 게시글 업로드
	@RequestMapping("/board_upload.do")
	//@ResponseBody
	public String board_upload(BoardVO vo) {
		
		String ip = request.getRemoteAddr();
		
		vo.setIp(ip);
		
		//foreign key
		vo.setM_idx(1);
		
		//vo.getT_idx & vo.getP_idx를 통해 톤 이름, 제품 이름 가져오기
		String p_name = "립"; //샘플
		String t_name = tone_service.select_tone(vo.getT_idx());
		
		vo.setT_name(t_name);
		vo.setP_name(p_name);
		
		int res = board_service.board_upload(vo);
		
		/*
		 * String result = "Fail";
		 * 
		 * if(res != 0) { result = "Success"; }
		 */
		//Ajax 안됨
		return "redirect:board_list.do";
		
	}
	
	//게시글 상세보기
	@RequestMapping("/board_view.do")
	public String board_view(Model model, int b_idx, String page) {
		
		BoardVO vo = board_service.board_one(b_idx);
		
		//조회수
		//setAttribute한 것을 가져옴
		String show = (String)session.getAttribute("show");
		
		if(show == null) {
			board_service.update_readhit(b_idx);
			model.addAttribute("show", "");
		}

		model.addAttribute("vo", vo);
		
		return Common.Board.VIEW_PATH + "board_view.jsp";
	}
	
	//게시물 수정
	@RequestMapping("/board_update.do")
	//@ResponseBody
	public String board_update(BoardVO vo) {
		
		String ip = request.getRemoteAddr();
		
		vo.setIp(ip);
		
		//foreign key
		vo.setM_idx(1);
		
		//vo.getT_idx & vo.getP_idx를 통해 톤 이름, 제품 이름 가져오기
		String p_name = "립"; //샘플
		String t_name = tone_service.select_tone(vo.getT_idx());
		
		vo.setT_name(t_name);
		vo.setP_name(p_name);
		
		board_service.board_update(vo);
		
		/*
		 * String result = "Fail";
		 * 
		 * if(res >= 0) { result = "Success"; }
		 */

		return "redirect:board_view.do?b_idx=" + vo.getB_idx();
	}
	
	@RequestMapping("/board_update_form.do")
	public String board_update_form(Model model, int b_idx) {
		BoardVO vo = board_service.board_one(b_idx);
		model.addAttribute("vo", vo);
		return Common.Board.VIEW_PATH + "board_update_form.jsp";
	}
	
	@RequestMapping("/board_delete.do")
	@ResponseBody
	public String board_delete(int b_idx) {
		//게시글 지우기
		int res = board_service.board_delete(b_idx);
		
		//게시글 댓글 지우기
		comment_service.board_comment_delete(b_idx);
		return String.valueOf(res);
	}
	
	//댓글 리스트
	@RequestMapping("/comment_list.do")
	public String comment_list(Model model, int b_idx) {
		List<CommentVO> list = comment_service.comment_list(b_idx);
		model.addAttribute("list", list);
		return Common.Comment.VIEW_PATH + "comment_list.jsp";
	}
	
	//댓글 작성
	@RequestMapping("/comment_write.do")
	@ResponseBody
	public String comment_write(CommentVO vo) {
		String ip = request.getRemoteAddr();
		
		vo.setIp(ip);
		vo.setM_idx(1);
		
		int res = comment_service.comment_write(vo);
		
		if(res > 0) {
			board_service.update_comment(vo.getB_idx());
		}
		
		return String.valueOf(res);
	}
	
	//대댓글
	@RequestMapping("/reply_list.do")
	public String reply_list(Model model, int c_idx) {
		List<CommentVO> list = comment_service.reply_list(c_idx);
		model.addAttribute("list", list);
		return Common.Comment.VIEW_PATH + "reply_list.jsp";
	}
	
	@RequestMapping("/reply.do")
	@ResponseBody
	public String reply(int c_idx, int b_idx, String content) {
		String ip = request.getRemoteAddr();
		
		CommentVO baseVO = comment_service.selectOne(c_idx);
		
		if(baseVO.getDepth() != 0) {
			comment_service.update_step(baseVO);
		}
		
		
		//Sample Data? 원래는 유저 정보가 저장되어 파라미터로 보내졌어야 함
		CommentVO vo = new CommentVO();
		
		vo.setB_idx(b_idx); //sample?
		vo.setIp(ip);
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep()+1);
		vo.setDepth(1);
		vo.setContent(content);//sample?
		vo.setM_idx(1); //sample
		
		int res = comment_service.reply(vo);
		
		return String.valueOf(res);
	}
	
	@RequestMapping("/reply_form.do")
	public String replay_form(Model model, int c_idx) {
		CommentVO vo = comment_service.selectOne(c_idx);
		
		model.addAttribute("vo", vo);
		
		return Common.Comment.VIEW_PATH + "reply_form.jsp?c_idx=" + c_idx;
	}
	
	//추천 버튼
	@RequestMapping("/like.do")
	@ResponseBody
	public String like(int b_idx) {
		//Sample data
		int m_idx = 1;
		
		LikesVO vo = new LikesVO();
		vo.setB_idx(b_idx);
		vo.setM_idx(m_idx);
		
		if(likes_service.selectOne(b_idx) == null) {
			//좋아요를 안누른 상태
			likes_service.insert(vo);
			board_service.like_increase(b_idx);
			return "like";
		}else {
			//좋아요를 누른 상태
			System.out.println("in dislike");
			likes_service.delete(vo);
			board_service.like_decrease(b_idx);
			return "dislike";
		}
	}
}




























