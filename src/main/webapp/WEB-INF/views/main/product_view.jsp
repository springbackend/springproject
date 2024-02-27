<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CSS 연결 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- css정렬 -->
<!-- <link rel="stylesheet" href="/beauty/resources/css/product_view.css"> -->
<script src="/beauty/resources/js/httpRequest.js"></script>
<style>
.img-responsive {
  display: block;
  max-width: 100%;
  height: auto;
}

</style>
<script type="text/javascript">
	function updateprice() {
		let quantity = document.getElementById('quantity').value;
		
		let url = 'update_price.do?p_idx='+${p_vo.p_idx}+'&quantity='+quantity;
		sendRequest(url,null,resultprice,'post');
	}
	
	function resultprice() {
		if(xhr.readyState == 4 && xhr.status ==200){
			let data = xhr.responseText;
			document.getElementById('totalprice').innerText = data;
		}
	}
	
	window.onload = function() {
		updateprice();
		comment_list();
	}
	
	function buyproduct() {
		let quantity = document.getElementById('quantity').value;
		location.href="buyproduct_form.do?p_idx="+${p_vo.p_idx}+"&quantity="+quantity;
	}
	
	function comment_list() {
		let url = "product_comment.do";
		let param = "p_idx="+${p_vo.p_idx};
		sendRequest(url,param,respclist, 'post');
	}
	
	function respclist() {
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			document.getElementById("product_comment_list").innerHTML = data;
		}
	}
	
	 function send(pc_idx) {
		/* let pc_idx = document.getElementById('pc_idx').value; */
		/* alert(pc_idx); */
	    let url = "product_comment_good.do";
	    let param = "pc_idx="+pc_idx;
	    sendRequest(url,param,pc_good_count,'post');
	}

	function pc_good_count() {
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			if(data == 'yes'){
			   /*  alert('좋아요'); */
			    location.href = 'product_view.do?p_idx='+${p_vo.p_idx}
			    return;
			}else if(data == 'minus'){
				/* alert('좋아요취소'); */
			    location.href = 'product_view.do?p_idx='+${p_vo.p_idx}
			    return;
			}else{
				alert('로그인후 사용해주세요');
				return;
			}
		}
	}     
</script>
</head>
<body>
<jsp:include page="index.jsp"/>
<div class="container mt-3">
  <div class="row align-items-center">
    <!-- 상품 이미지 영역 -->
    <div class="col-md-6 product-info">
      <img src="resources/productimages/${p_vo.p_image }" alt="상품 이미지" class="img-responsive center-block" style="max-width: 100%; height: auto;">
    </div>
    <!-- 상품 정보 영역 -->
    <div class="col-md-6">
      <h2>${p_vo.p_name }</h2>
      <p>${p_vo.p_content }</p>
      <div class="form-group">
        <label for="quantity">수량:</label>
        <input type="number" id="quantity" name="quantity" value="1" min="1" class="form-control" style="width: auto;" onchange="updateprice()">
      </div>
      <p id="totalprice">가격:${p_vo.p_price }</p>
      <div class="product-actions">
        <button type="button" class="btn btn-primary">장바구니에 담기</button>
        <button type="button" class="btn btn-success" onclick="buyproduct()">구매하기</button>
        <button type="button" class="btn btn-warning">찜하기</button>
      </div>
    </div>
  </div>
</div>
<div id="product_comment_list">
  <!-- 댓글 목록 -->
</div>
</body>
</html>