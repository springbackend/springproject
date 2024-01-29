package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// top head
@Controller
public class TempController {
	static final String VIEWPATH = "/WEB-INF/views";

	@RequestMapping(value = "/")
	public String temp() {
		return VIEWPATH + "/temp/temp.jsp";
	}

	@RequestMapping(value = "/top.do")
	public String temptop() {
		return VIEWPATH + "/temp/top.jsp";
	}

	@RequestMapping(value = "/head.do")
	public String temphead() {
		return VIEWPATH + "/temp/head.jsp";
	}

	@RequestMapping(value = "/index.do")
	public String goindex() {
		return VIEWPATH + "/main/index.jsp";
	}

	@RequestMapping(value = "/footer.do")
	public String gofooter() {
		return VIEWPATH + "/temp/footer.jsp";
	}

	@RequestMapping(value = "/dbCheckid.do")
	public String dbCheckId() {
		// String id= request.getParameter
		// System.out.println("요청아이디 :" + id);
		// int result = memberService.idcheck(id);
		// session.setAttribute("result",result)
		return VIEWPATH + "temp/checkid.jsp";
	}
}
