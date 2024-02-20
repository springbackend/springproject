package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ProductCommentService;
import vo.ProductCommentVO;

@Controller
public class ProductCommentController {
	ProductCommentService pc_Service;
	static final String VIEW_PATH = "/WEB-INF/views/productcomment/";
	
	@Autowired
	HttpSession session;
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
		if(session.getAttribute("id") == null) {
			return "redirect:temp.do";
		}
		return VIEW_PATH+"productcomment_write.jsp";
	}
	
	@RequestMapping("product_comment_write.do")
	public String productComment_write(ProductCommentVO pc_vo) {
		String u_id = (String) session.getAttribute("id");
		if(u_id != null) {
			pc_Service.productComment_write(pc_vo,u_id);
		}else {
			return "redirect:temp.do";
		}
		return "redirect:product_comment.do";
	}

}
