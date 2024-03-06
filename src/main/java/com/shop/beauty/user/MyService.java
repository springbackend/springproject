package com.shop.beauty.user;

import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

public interface MyService {

	ConcurrentHashMap<Integer, String> findMyWrite(String email);

	ConcurrentHashMap<Integer, String> findMyComment(String email);

	ConcurrentHashMap<Integer, String> findMyItem();

	void findMyOrder();

	int findMyVisitDay();

}
