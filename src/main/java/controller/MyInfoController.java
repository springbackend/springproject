package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserBoardDAO;
import dao.UserDAO;
import lombok.extern.slf4j.Slf4j;
import vo.BoardVO;
import vo.UserVO;

@Slf4j
@Controller
public class MyInfoController {

	UserDAO userdao;
	UserBoardDAO userBoardDAO;

	public MyInfoController(UserDAO userdao, UserBoardDAO userBoardDAO) {
		this.userdao = userdao;
		this.userBoardDAO = userBoardDAO;
	}

	static final String VIEW_PATH = "/WEB-INF/views/user/";

	@RequestMapping(value = "/myInfo.do")
	public String myInfo() {
		return VIEW_PATH + "myInfo.jsp";
	}

	// 내글보기
	@RequestMapping(value = "/viewMyPosts.do")
	public String viewMyPosts(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		// 테스트용 임시 세션아이디
		//id = "asd123";

		if (id == null || id.isEmpty()) {
			throw new RuntimeException("세션에 사용자 아이디가 없습니다.");
		}
		// 내글조회
		List<BoardVO> boardList = userBoardDAO.viewMyPosts(id);
		model.addAttribute("boardList", boardList);
		return VIEW_PATH + "MyBoard.jsp";
	}

	// 내가 작성한 댓글보기
	@RequestMapping(value = "/viewMyComments.do")
	public List<BoardVO> viewMyComments(HttpSession session) {
		String id = session.getId();
		// 내댓글조회
		List<BoardVO> list = userBoardDAO.viewMyComments(id);
		return list;
	}

	// 비밀번호 변경하기
	@ResponseBody
	@RequestMapping(value = "/changeMyPwd.do")
	public String changeMyPwd(HttpSession session, String pwd) {
		String result = "fail";
		String id = session.getId();
		UserVO uservo = new UserVO();
		uservo.setU_id(id);
		uservo.setU_pwd(pwd);
		// 비밀번호 변경
		int res = userdao.changeMyPwd(uservo);
		if (res > 0) {
			result = "success";
		}
		return result;
	}

	// 계정삭제
	@ResponseBody
	@RequestMapping(value = "/deleteAccount.do")
	public String deleteAccount(HttpSession session) {
		String result = "fail";
		String id = session.getId();
		// 비밀번호 변경
		int res = userdao.deleteAccount(id);
		if (res > 0) {
			result = "success";
		}
		return result;
	}

}
