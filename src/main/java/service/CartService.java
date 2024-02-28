package service;

import java.util.List;

import dao.CartDAO;
import vo.CartVO;

public class CartService {
	
	CartDAO cartDao;
	
	public CartService(CartDAO cartDao) {
		this.cartDao = cartDao;
	}
	
	public boolean cartInsertCheck(CartVO cart) {
		
		int check = cartDao.cartCheck(cart);
		if(check >0) {
			return false;
		}else {
			cartDao.cartInsert(cart);
			return true;
		}
	}
	
	public List<CartVO> cartList(int u_idx){
		List<CartVO> list = cartDao.cartList(u_idx);
		return list;
	}
	
	public int userIdx(String u_email) {
		int u_idx = cartDao.user_idx(u_email);
		return u_idx;
	}
	
	

}
