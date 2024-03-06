package com.shop.beauty.user;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.ibatis.session.SqlSession;

import lombok.RequiredArgsConstructor;
import service.BoardService;
import service.CommentService;
import vo.BoardVO;

@RequiredArgsConstructor
public class MyServiceImpl implements MyService {

	private final SqlSession sqlSession;
	private final UserDAO dao;
	private final BoardService boardService;
	private final CommentService commentService;

	@Override
	public ConcurrentHashMap<Integer, String> findMyWrite(String u_email) {
		ConcurrentHashMap<BoardVO> write = sqlSession.selectList("ub.viewMyPosts", u_email);
		return write;
	}

	@Override
	public ConcurrentHashMap<Integer, String> findMyComment(String email) {

		return comment;
	}

	@Override
	public ConcurrentHashMap<Integer, String> findMyItem(String u_email) {
		ConcurrentHashMap<Integer, String> item = sqlSession.selectList("", u_email);

		return item;
	}

	@Override
	public void findMyOrder() {
		// TODO Auto-generated method stub

	}

	@Override
	public int findMyVisitDay() {
		return 0;
	}
}