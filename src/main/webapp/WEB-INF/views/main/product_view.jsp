<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!-- 부트스트랩 CSS 연결 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- css정렬 -->
<link rel="stylesheet" href="/beauty/resources/css/product_view.css">
<script src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function updateprice() {
		let quantity = document.getElementById('quantity').value;
		
		let url = 'update_price.do?p_idx='+${p_vo.p_idx}+'&quantity='+quantity;
		sendRequest(url,null,resultprice,'post');
	}
	
	function resultprice() {
		if(xhr.readyState == 4 && xhr.status ==200){
			let data = xhr.responseText;
			document.getElementById('totalprice').innerText = data + "원";
		}
	}
	
	window.onload = function() {
		updateprice();
	}
	
	
</script>
</head>
<body>
<div class="container mt-3">
  <div class="row align-items-center">
    <!-- 상품 이미지 영역 -->
    <div class="col-md-6">
    <!-- img-fluid:이미지가 반응형으로 동작 -->
      <img src="resources/productimages/${p_vo.p_image }" alt="상품 이미지" class="img-fluid">
    </div>
    <!-- 상품 정보 영역(이미지하고 정보부분 왼쪽오른쪽으로나눔) -->
    <div class="col-md-6 product-info">
      <h2>${p_vo.p_name }</h2>
      <p>${p_vo.p_content }</p>
      <div class="mb-3">
        <label for="quantity">수량:</label>
        <input type="number" id="quantity" name="quantity" value="1" min="1" class="form-control" style="width: auto;" onchange="updateprice()">
      </div>
      <p id="totalprice">가격:</p><!-- 수량에 맞게 가격 변동으로 바뀜 -->
      <!-- 버튼들을 수평으로 배열 -->
      <div class="product-actions">
        <button type="button" class="btn btn-primary">장바구니에 담기</button>
        <button type="button" class="btn btn-success">구매하기</button>
        <button type="button" class="btn btn-warning">찜하기</button>
      </div>
    </div>
  </div>
</div>
<!-- 부트스트랩 JS, Popper.js, 그리고 jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>