package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import com.google.common.base.Optional;

import lombok.Getter;
import lombok.Setter;
import vo.UserVO;

public class UserDAO {

	SqlSession sqlSession;

	// 생성자 주입
	private UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/*
	 * public void setSqlSession(Object arg0) {
	 * 
	 * }
	 */

	public List<UserVO> findAll() {
		List<UserVO> list = sqlSession.selectList("u.select_list");
		return list;
	}

	public UserVO findbyId(String id) {
		UserVO vo = sqlSession.selectOne("u.select_one", id);
		if (vo == null) {
			System.err.println("dao error : 반환값이 없습니다");
			return vo;
		}
		return vo;
	}

	public int insert(UserVO vo) {
		int res = sqlSession.insert("u.insert", vo);
		if (res > 0) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("회원가입 실패");
		}
		return res;
	}
}