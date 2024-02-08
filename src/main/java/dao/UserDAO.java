package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import vo.UserVO;

@Slf4j
public class UserDAO {

	SqlSession sqlSession;

	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

// crud
	// create
	public int save(UserVO vo) {
		int res = sqlSession.insert("u.insert_user", vo);
		if (res > 0) {
			log.info("회원가입 성공 id : {}", vo.getId());
		} else {
			log.info("회원가입 실패 id : {}", vo.getId());
		}
		return res;
	}

	// read all
	public List<UserVO> findAll() {
		List<UserVO> list = sqlSession.selectList("u.select_list");
		return list;
	}

	// read one
	public UserVO findById(String id) {
		UserVO vo = sqlSession.selectOne("u.ismember", id);
		return vo;
	}

	// update password
	public int update(String pwd) {
		int res = sqlSession.update("u.insert", pwd);
		return res;
	}

	// delete
	public int delete(String id) {
		int res = sqlSession.delete("u.delete", id);
		if (res > 0) {
			log.info("계정삭제 완료", id);
		}
		return res;
	}
}