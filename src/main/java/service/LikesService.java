package service;

import dao.LikesDAO;
import vo.LikesVO;

public class LikesService {

	LikesDAO likes_dao;
	
	public LikesService(LikesDAO likes_dao) {
		this.likes_dao = likes_dao;
	}
	
	public LikesVO selectOne(int b_idx) {
		LikesVO vo = likes_dao.selectOne(b_idx);
		return vo;
	}
	
	public int insert(LikesVO vo) {
		int res = likes_dao.insert(vo);
		return res;
	}
	
	public int delete(LikesVO vo) {
		int res = likes_dao.delete(vo);
		return res;
	}
}
