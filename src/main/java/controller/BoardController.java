package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ProductDAO;
import dao.ToneDAO;
import service.BoardService;
import service.CommentService;
import service.ProductService;
import service.ToneService;
import util.Common;
import util.BoardPaging;
import vo.BoardVO;
import vo.CommentVO;

@Controller
public class BoardController {

	BoardService board_service;
	ToneService tone_service;
	CommentService comment_service;

	@Autowired
	HttpServletRequest request;

	public BoardController(BoardService board_service, ToneService tone_service, CommentService comment_service) {
		this.board_service = board_service;
		this.tone_service = tone_service;
		this.comment_service = comment_service;
	}

	//게시글 리스트
	@RequestMapping(value = { "/board_list.do" })
	public String board_list(Model model, Integer page) {

		int nowPage = 1;

		if (page != null) {
			nowPage = page;
		}

		System.out.println("page = " + page);

		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;

		// map에 start, end를 저장하여 DB로 보낸다
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);

		List<BoardVO> list = board_service.board_list(map);

		// 전체 게시글 수 가져오기
		int row_total = board_service.getRowTotal();

		// 하단에 들어가는 페이징 메뉴 생성
		String pageMenu = BoardPaging.getPaging("board_list.do", nowPage, row_total, Common.Board.BLOCKLIST,
				Common.Board.BLOCKPAGE);

		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);

		return Common.Board.VIEW_PATH + "board_list.jsp";
	}

	// 새 게시글 작성 폼으로 이동
	@RequestMapping("/board_write.do")
	public String board_write() {
		return Common.Board.VIEW_PATH + "board_write.jsp";
	}

	// 새 게시글 업로드
	@RequestMapping("/board_upload.do")
	// @ResponseBody
	public String board_upload(BoardVO vo) {

		String ip = request.getRemoteAddr();

		vo.setIp(ip);

		// foreign key
		vo.setM_idx(1);

		// vo.getT_idx & vo.getP_idx를 통해 톤 이름, 제품 이름 가져오기
		// String p_name = product_service.select_product(vo.getP_idx());
		String p_name = "립"; // 임시 데이터
		String t_name = tone_service.select_tone(vo.getT_idx());

		vo.setT_name(t_name);
		vo.setP_name(p_name);

		int res = board_service.board_upload(vo);

		String result = "Fail";

		if (res != 0) {
			result = "Success";
		}
		// Ajax 안됨
		return "redirect:board_list.do";

	}

	// 게시글 상세보기
	@RequestMapping("/board_view.do")
	public String board_view(Model model, int b_idx, String page) {

		BoardVO vo = board_service.board_one(b_idx);

		// 조회수

		model.addAttribute("vo", vo);

		return Common.Board.VIEW_PATH + "board_view.jsp";
	}

	// 댓글 리스트
	@RequestMapping("/comment_list.do")
	public String comment_list(Model model, int b_idx) {
		List<CommentVO> list = comment_service.comment_list(b_idx);
		model.addAttribute("list", list);
		return Common.Comment.VIEW_PATH + "comment_list.jsp";
	}

	// 댓글 작성
	@RequestMapping("/comment_write.do")
	@ResponseBody
	public String comment_write(CommentVO vo) {
		String ip = request.getRemoteAddr();

		vo.setIp(ip);
		vo.setM_idx(1);

		int res = comment_service.comment_write(vo);

		return String.valueOf(res);
	}

	// 추천 버튼
	@RequestMapping("/click.do")
	@ResponseBody
	public String click(int b_idx, boolean thumb_click) {
		int res;
		if (thumb_click == true) {
			res = board_service.increase_thumb(b_idx);
		} else {
			res = board_service.decrease_thumb(b_idx);
		}

		return String.valueOf(res);
	}
}
