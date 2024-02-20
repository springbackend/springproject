package service;

import java.util.List;

import org.springframework.stereotype.Service;

import vo.ProductVO;

public interface OrderSerivce {
	List<ProductVO> requestOrder(String Userid, String productName, int productprice);

	public int requestValidation(int request, String user, String product);
	
	
	
}
