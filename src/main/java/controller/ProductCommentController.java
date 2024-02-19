package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ProductCommentService;
import vo.ProductCommentVO;

@Controller
public class ProductCommentController {
	ProductCommentService pc_Service;
	static final String VIEW_PATH = "/WEB-INF/views/productcomment/";
	public ProductCommentController(ProductCommentService pc_Service) {
		this.pc_Service = pc_Service;
	}
	
	@RequestMapping("/product_comment.do")
	public String productComment_list(int p_idx,Model model) {
		List<ProductCommentVO> list = pc_Service.productComment_list(p_idx);
		model.addAttribute("list",list);
		return VIEW_PATH+"productcomment.jsp";
	}
	
	@RequestMapping("product_comment_write_form.do")
	public String productComment_write() {
		return VIEW_PATH+"productcomment_write.jsp";
	}

}
