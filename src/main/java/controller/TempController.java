package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/* html 而댄룷�꼳�듃�� �럹�씠吏��벑�쓣 諛붾줈媛덉닔�엳�룄濡� 留뚮뱺 �엫�떆 �럹�씠吏�
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

	// 而댄룷�꼳�듃 吏��뿭
	@RequestMapping(value = "/top.do")
	public String temptop() {
		return VIEWPATH + "/temp/top.jsp";
	}

	@RequestMapping(value = "/header.do")
	public String temphead() {
		return VIEWPATH + "/temp/header.jsp";
	}

	@RequestMapping(value = "/index.do")
	public String goindex() {
		return VIEWPATH + "/main/index.jsp";
	}

	@RequestMapping(value = "/footer.do")
	public String gofooter() {
		return VIEWPATH + "/temp/footer.jsp";
	}
	
	
	
	
	
	

}
