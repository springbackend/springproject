package service;

import java.util.List;

import dao.CommentDAO;
import vo.CommentVO;

public class CommentService {

	CommentDAO comment_dao;
	
	public CommentService(CommentDAO comment_dao) {
		this.comment_dao = comment_dao;
	}
	
	public List<CommentVO> comment_list(int b_idx){
		List<CommentVO> list = comment_dao.comment_list(b_idx);
		return list;
	}
	
	public int comment_write(CommentVO vo) {
		int res = comment_dao.comment_write(vo);
		return res;
	}
	
}
