package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TempController {

	static final String VIEWPATH = "/WEB-INF/views";

	@RequestMapping(value = "/")
	public String main() {
		return "redirect:/temp.do";
	}

	@RequestMapping(value = { "/temp.do" })
	public String temp() {
		return VIEWPATH + "/main/temp.jsp";
	}

	@RequestMapping(value = "/top.do")
	public String temptop() {
		return VIEWPATH + "/comp/top.jsp";
	}

	@RequestMapping(value = "/header.do")
	public String temphead() {
		return VIEWPATH + "/comp/header.jsp";
	}

	@RequestMapping(value = "/index.do")
	public String goindex() {
		return VIEWPATH + "/main/index.jsp";
	}

	@RequestMapping(value = "/footer.do")
	public String gofooter() {
		return VIEWPATH + "/comp/footer.jsp";
	}

}
