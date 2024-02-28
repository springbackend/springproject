package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.CartService;
import vo.CartVO;

@Controller
public class CartController {
	
	CartService cartService;
	@Autowired
	HttpSession session;
	@Autowired
	ServletContext app;
	static final String VIEW_PATH = "/WEB-INF/views/cart/";
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}
	
	@RequestMapping(value = "cart_list.do",method = RequestMethod.GET)
	public String cartList(Model model) {
		String u_email = (String)session.getAttribute("email");
		if(u_email == null) {
			return "redirect:main.do";
		}
		int u_idx = cartService.userIdx(u_email);
		List<CartVO> list = cartService.cartList(u_idx);
		model.addAttribute("list", list);
		return VIEW_PATH + "cart.jsp";
	}
	
	@RequestMapping(value = "cart_insert.do",method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String cartInsert(int p_idx,int quantity,int totalprice) {
		String u_email = (String)session.getAttribute("email");
		if(u_email == null) {
			return "nologin";
		}
		
		int u_idx = cartService.userIdx(u_email);
		CartVO cart = new CartVO();
		cart.setU_idx(u_idx);
		cart.setQuantity(quantity);
		cart.setTotalprice(totalprice);
		cart.setP_idx(p_idx);
		boolean check = cartService.cartInsertCheck(cart);
		if(check) {
			return "true";
		}else {
			return "false";
		}
	}
	
	
}
