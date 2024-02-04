package service;

import java.util.List;

import org.springframework.stereotype.Service;

import dao.BoardDAO;
import vo.BoardVO;

@Service
public class BoardService {

	BoardDAO board_dao;
	
	public BoardService(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	public List<BoardVO> board_list(){ 
		List<BoardVO> list = board_dao.selectList(); 
		return list; 
	}
	
	public int board_upload(BoardVO vo) {
		int res = board_dao.board_upload(vo);
		return res;
	}

}





























