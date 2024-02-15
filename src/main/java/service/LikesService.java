package service;

import dao.LikesDAO;
import vo.LikesVO;

public class LikesService {

	LikesDAO likes_dao;
	
	public LikesService(LikesDAO likes_dao) {
		this.likes_dao = likes_dao;
	}
	
	public LikesVO check_like(LikesVO vo) {
		LikesVO resultVO = likes_dao.check_like(vo);
		return resultVO;
	}
	
	public int insert(LikesVO vo) {
		int res = likes_dao.insert(vo);
		return res;
	}
	
	public int delete(LikesVO vo) {
		int res = likes_dao.delete(vo);
		return res;
	}
	
	public int count_like(int b_idx) {
		int res = likes_dao.count_like(b_idx);
		return res;
	}
}



































