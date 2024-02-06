package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import vo.UserVO;

public class UserDAO {

	SqlSession sqlSession;

	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<UserVO> findAll() {
		List<UserVO> list = sqlSession.selectList("u.select_list");
		return list;
	}

	public UserVO ismember(String id) {
		UserVO vo = sqlSession.selectOne("u.ismember", id);
		return vo;
	}

	public int insert(UserVO uservo) {
		int res = sqlSession.insert("u.insert_user", uservo);
		if (res > 0) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("회원가입 실패");
		}
		return res;
	}
}