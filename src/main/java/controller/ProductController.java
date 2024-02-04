package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.ProductService;
import vo.ProductVO;

@Controller
public class ProductController {
	@Autowired
	ServletContext app;
	ProductService p_service;
	static final String VIEW_PATH = "/WEB-INF/views/main/";

	public ProductController(ProductService p_service) {
		this.p_service = p_service;
	}

	@RequestMapping("/product_category_list.do")
	public String category_list(String page, String p_category, Model model) {
		int nowpage =1;
		if(page != null && !page.isEmpty()) {
			nowpage = Integer.parseInt(page);
		}
		Map<String, Object> p_map = p_service.p_category_service(p_category, nowpage);
		model.addAttribute("list", p_map.get("list"));
		model.addAttribute("page", p_map.get("page_menu"));
		return VIEW_PATH + "product_category.jsp";
	}

	@RequestMapping("/product_view.do")
	public String product_view(int p_idx, Model model) {
		ProductVO p_vo = p_service.p_product_view(p_idx);
		model.addAttribute("p_vo", p_vo);
		return VIEW_PATH + "product_view.jsp";
	}

	@RequestMapping("/update_price.do")
	@ResponseBody
	public String product_update_price(int p_idx, int quantity) {
		ProductVO p_vo = p_service.p_product_view(p_idx);
		int price = p_vo.getP_price();
		int totalprice = price*quantity;
		return String.valueOf(totalprice);
	}
	
	@RequestMapping("/product_search_list.do")
	public String product_search_list(String keyword,String page,Model model) {
		int nowpage =1;
		if(page != null && !page.isEmpty()) {
			nowpage = Integer.parseInt(page);
		}
		Map<String, Object> p_map= p_service.p_search_list(keyword, nowpage);
		model.addAttribute("list", p_map.get("list"));
		model.addAttribute("page_menu", p_map.get("page_menu"));
		return VIEW_PATH + "product_category.jsp";
	}

}
