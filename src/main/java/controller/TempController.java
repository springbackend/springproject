package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/* html 컴포넌트와 페이지등을 바로갈수있도록 만든 임시 페이지
 * 
 * 
 * 
 * 
*/
@Controller
public class TempController {

	static final String VIEWPATH = "/WEB-INF/views";

	@RequestMapping(value = "/")
	public String main() {
		return "redirect:/temp.do";
	}

	@RequestMapping(value = { "/temp.do" })
	public String temp() {
		return VIEWPATH + "/temp/temp.jsp";
	}

	// 컴포넌트 지역
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

	@RequestMapping(value = "/main.do")
	public String main1() {
		return VIEWPATH + "/main/main.jsp";
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
