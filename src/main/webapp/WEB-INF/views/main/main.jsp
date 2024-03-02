<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Phoenix</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="resources/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="resources/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="resources/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="resources/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="resources/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="resources/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="resources/vendors/simplebar/simplebar.min.js"></script>
    <script src="resources/assets/js/config.js"></script>

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link href="resources/vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link href="resources/assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl">
    <link href="resources/assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
    <link href="resources/assets/css/user-rtl.min.css" type="text/css" rel="stylesheet" id="user-style-rtl">
    <link href="resources/assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
    <script src="/beauty/resources/js/httpRequest.js"></script>
    <script>
      var phoenixIsRTL = window.config.config.phoenixIsRTL;
      if (phoenixIsRTL) {
        var linkDefault = document.getElementById('style-default');
        var userLinkDefault = document.getElementById('user-style-default');
        linkDefault.setAttribute('disabled', true);
        userLinkDefault.setAttribute('disabled', true);
        document.querySelector('html').setAttribute('dir', 'rtl');
      } else {
        var linkRTL = document.getElementById('style-rtl');
        var userLinkRTL = document.getElementById('user-style-rtl');
        linkRTL.setAttribute('disabled', true);
        userLinkRTL.setAttribute('disabled', true);
      }
      document.addEventListener('DOMContentLoaded', function() {
  		let searchInput = document.getElementById('searchInput');
  		let dropdownMenu = document.getElementById('searchDropdown');
  		
  		searchInput.addEventListener('input', function() {
  			let keyword = this.value.trim();
  			if (keyword === '') {
  				dropdownMenu.innerHTML = '';
  				dropdownMenu.classList.remove('show');
  			} else {
  				// AJAX 요청 대신 예시에서는 직접 함수 호출
  				searchkeyword(keyword);
  			}
  		});

  		searchInput.addEventListener('focus', function() {
  			if (dropdownMenu.childElementCount > 0) {
  				dropdownMenu.classList.add('show');
  			}
  		});

  		searchInput.addEventListener('blur', function() {
  			setTimeout(function() {
  				dropdownMenu.classList.remove('show');
  			}, 100);
  		});
  	});

  	function searchkeyword(keyword) {
  		// 키워드가 있을 때만 검색을 수행
  		let url = "search_keyword.do";
  		let param = "keyword=" + keyword;
  		sendRequest(url, param, resultKeyword, 'post');
  	}

  	function resultKeyword() {
  		if (xhr.readyState == 4 && xhr.status == 200) {
  			let data = xhr.responseText;
  			let productNames = JSON.parse(data); // JSON 문자열을 문자열 배열로 변환
  			// 드롭다운 메뉴를 찾고 기존 항목을 지움
  			let dropdownMenu = document.querySelector('#searchDropdown');
  			dropdownMenu.innerHTML = '';
  			if (productNames.length > 0) {
  				productNames
  						.forEach(function(productName) {
  							let listItem = document.createElement('li'); // li 요소 생성
  							let dropdownItem = document.createElement('a');
  							dropdownItem.classList.add('dropdown-item');
  							dropdownItem.href = 'search_list.do?keyword='
  									+ productName;
  							dropdownItem.textContent = productName;
  							listItem.appendChild(dropdownItem); // li 요소 안에 a 요소 추가
  							dropdownMenu.appendChild(listItem); // 드롭다운 메뉴에 li 요소 추가
  						});

  				// 드롭다운 메뉴를 보이도록
  				dropdownMenu.classList.add('show');
  	        } else {
  	            dropdownMenu.classList.remove('show');
  	        }
  		}
  	}
  	function search_list(f) {
  		let keyword = f.keyword.value.trim();
  		if (keyword == '') {
  			alert('검색어를 입력하세요');
  			return;
  		}
  		f.submit();
  	}
    </script>
<link href="resources/vendors/swiper/swiper-bundle.min.css" rel="stylesheet">
<style type="text/css">
	.search-form {
    display: inline-block;
    width: 100%;
}

.search-form .dropdown-menu {
    width: 100%; /* 드롭다운 메뉴의 너비를 form 태그의 너비와 동일하게 설정 */
}
</style>
  </head>
  <body>
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
		<section class="py-0">
	        <div class="container-small">
	          <div class="ecommerce-topbar">
	            <nav class="navbar navbar-expand-lg navbar-light px-0">
	              <div class="row gx-0 gy-2 w-100 flex-between-center">
	                <div class="col-auto"><a class="text-decoration-none" href="resources/index.html">
	                    <div class="d-flex align-items-center"><img src="resources/assets/img/icons/logo.png" alt="phoenix" width="27" />
	                      <p class="logo-text ms-2">phoenix</p>
	                    </div>
	                  </a></div>

	                <div class="col-auto order-md-1">
	                  <ul class="navbar-nav navbar-nav-icons flex-row me-n2">
	                  	
	                  	<!-- 장바구니 -->
	                    <li class="nav-item d-flex align-items-center">
	                      <div class="theme-control-toggle fa-icon-wait px-2"><input class="form-check-input ms-0 theme-control-toggle-input" type="checkbox" data-theme-control="phoenixTheme" value="dark" id="themeControlToggle" /><label class="mb-0 theme-control-toggle-label theme-control-toggle-light" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch theme"><span class="icon" data-feather="moon"></span></label><label class="mb-0 theme-control-toggle-label theme-control-toggle-dark" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch theme"><span class="icon" data-feather="sun"></span></label></div>
	                    </li>
	                    <!-- 장바구니 목록 수 -->
	                    <li class="nav-item"><a class="nav-link px-2 icon-indicator icon-indicator-primary" href="resources/apps/e-commerce/landing/cart.html" role="button"><span class="text-body-tertiary" data-feather="shopping-cart" style="height:20px;width:20px;"></span><span class="icon-indicator-number">3</span></a></li>
	                    
	                    <!-- 로그인 / 마이페이지 -->
	                    <li class="nav-item dropdown"><a class="nav-link px-2" id="navbarDropdownUser" href="#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-haspopup="true" aria-expanded="false"><span class="text-body-tertiary" data-feather="user" style="height:20px;width:20px;"></span></a>
	                      <div class="dropdown-menu dropdown-menu-end navbar-dropdown-caret py-0 dropdown-profile shadow border mt-2" aria-labelledby="navbarDropdownUser">
	                        <div class="card position-relative border-0">
	                        
	                        	<!-- 비회원인 경우 -->
	                        	<div style="margin-top:15px;">
		                            <div class="px-3"> <a class="btn btn-phoenix-secondary d-flex flex-center w-100" href="#!"> <span class="me-2" data-feather="log-in"> </span>로그인</a></div>
		                        	<div class="px-3"> <a class="btn btn-phoenix-secondary d-flex flex-center w-100" href="#!"> <span class="me-2" data-feather="log-in"> </span>회원가입</a></div>
		                            <div class="my-2 text-center fw-bold fs-10 text-body-quaternary"><a class="text-body-quaternary me-1" href="#!">Privacy policy</a>&bull;<a class="text-body-quaternary mx-1" href="#!">Terms</a>&bull;<a class="text-body-quaternary ms-1" href="#!">Cookies</a></div>
		                        </div>
	                        	
	                        	
	                        	<!-- 로그인한 유저인 경우 -->
	                          <!-- <div class="card-body p-0">
	                            <div class="text-center pt-4 pb-3">
	                              <div class="avatar avatar-xl ">
	                                <img class="rounded-circle " src="resources/assets/img/team/72x72/57.webp" alt="" />
	                              </div>
	                              <h6 class="mt-2 text-body-emphasis">Jerry Seinfield</h6>
	                            </div>
	                            <div class="mb-3 mx-3"><input class="form-control form-control-sm" id="statusUpdateInput" type="text" placeholder="Update your status" /></div>
	                          </div>
	                          <div class="overflow-auto scrollbar" style="height: 10rem;">
	                            <ul class="nav d-flex flex-column mb-2 pb-1">
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="user"></span><span>Profile</span></a></li>
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"><span class="me-2 text-body" data-feather="pie-chart"></span>Dashboard</a></li>
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="lock"></span>Posts &amp; Activity</a></li>
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="settings"></span>Settings &amp; Privacy </a></li>
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="help-circle"></span>Help Center</a></li>
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="globe"></span>Language</a></li>
	                            </ul>
	                          </div>
	                          <div class="card-footer p-0 border-top border-translucent">
	                            <ul class="nav d-flex flex-column my-3">
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="user-plus"></span>Add another account</a></li>
	                            </ul>
	                            <hr />
	                            <div class="px-3"> <a class="btn btn-phoenix-secondary d-flex flex-center w-100" href="#!"> <span class="me-2" data-feather="log-out"> </span>Sign out</a></div>
	                            <div class="my-2 text-center fw-bold fs-10 text-body-quaternary"><a class="text-body-quaternary me-1" href="#!">Privacy policy</a>&bull;<a class="text-body-quaternary mx-1" href="#!">Terms</a>&bull;<a class="text-body-quaternary ms-1" href="#!">Cookies</a></div>
	                          </div> -->
	                        </div>
	                      </div>
	                    </li>
	                  </ul>
	                </div>
	                <div class="col-12 col-md-6">
	                  <div class="search-box ecommerce-search-box w-100">
									<form class="position-relative search-form" action="search_list.do" method="get">
										<input
											class="form-control search-input search form-control-sm"
											id="searchInput" type="search" placeholder="검색"
											aria-label="Search" name="keyword" /> <span
											class="fas fa-search search-box-icon"></span>
										<div class="dropdown-menu" id="searchDropdown"
											aria-labelledby="searchInput"></div>
									</form>
								</div>
	                </div>
	              </div>
	            </nav>
	          </div>
	        </div><!-- end of .container-->
	      </section><!-- <section> close ============================-->
	      <!-- ============================================-->
	
	      <nav class="ecommerce-navbar navbar-expand navbar-light bg-body-emphasis justify-content-between">
	        <div class="container-small d-flex flex-between-center" data-navbar="data-navbar">
	        
	        	<!-- 카테고리 -->
	          <div class="dropdown"><button class="btn text-body ps-0 pe-5 text-nowrap dropdown-toggle dropdown-caret-none" data-category-btn="data-category-btn" data-bs-toggle="dropdown"><span class="fas fa-bars me-2"></span>카테고리</button>
	            <div class="dropdown-menu border border-translucent py-0 category-dropdown-menu">
	              <div class="card border-0 scrollbar" style="max-height: 657px;">
	                <div class="card-body p-6 pb-3">
	                  <div class="row gx-7 gy-5 mb-5">
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="pocket" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Collectibles &amp; Art</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Collectibles</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Antiques</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Sports memorabilia </a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Art</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="home" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Home &amp; Gardan</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Yard, Garden &amp; Outdoor</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Crafts</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Home Improvement</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Pet Supplies</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="globe" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Sporting Goods</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Outdoor Sports</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Team Sports</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Exercise &amp; Fitness</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Golf</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="monitor" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Electronics</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Computers &amp; Tablets</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Camera &amp; Photo</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">TV, Audio &amp; Surveillance</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Cell Ohone &amp; Accessories</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="truck" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Auto Parts &amp; Accessories</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">GPS &amp; Security Devices</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Rader &amp; Laser Detectors</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Care &amp; Detailing</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Scooter Parts &amp; Accessories</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="codesandbox" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Toys &amp; Hobbies</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Radio Control</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Kids Toys</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Action Figures</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Dolls &amp; Bears</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="watch" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Fashion</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Women</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Men</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Jewelry &amp; Watches</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Shoes</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="music" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Musical Instruments &amp; Gear</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Guitar</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Pro Audio Equipment</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">String</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Stage Lighting &amp; Effects</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="grid" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Other Categories</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Video Games &amp; Consoles</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Health &amp; Beauty</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Baby</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Business &amp; Industrial</a></div>
	                    </div>
	                  </div>
	                  <div class="text-center border-top border-translucent pt-3"><a class="fw-bold" href="#!">See all Categories<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a></div>
	                </div>
	              </div>
	            </div>
	          </div>
	          
	          <!-- 네비게이션 바 -->
	          <ul class="navbar-nav justify-content-end align-items-center">
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link ps-0 active" href="resources/apps/e-commerce/landing/homepage.html">게시판</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/favourite-stores.html">세일 상품</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/products-filter.html">인기 상품</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/wishlist.html">추천 상품</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/shipping-info.html">이벤트</a></li>
	          </ul>
	        </div>
	      </nav>
	      <div class="ecommerce-homepage pt-5 mb-9">
	        <!-- ============================================-->
	        <!-- <section> begin ============================-->
	        <section class="py-0">
	          <div class="container-small">
	            <div class="scrollbar">
	              <div class="d-flex justify-content-between"><a class="icon-nav-item" href="#!">
	                  <div class="icon-container mb-2 bg-warning-subtle light"><span class="fs-4 uil uil-star text-warning"></span></div>
	                  <p class="nav-label">Deals</p>
	                </a><a class="icon-nav-item" href="#!">
	                  <div class="icon-container mb-2"><span class="fs-4 uil uil-shopping-bag"></span></div>
	                  <p class="nav-label">Grocery</p>
	                </a><a class="icon-nav-item" href="#!">
	                  <div class="icon-container mb-2"><span class="fs-4 uil uil-watch-alt"></span></div>
	                  <p class="nav-label">Fashion</p>
	                </a><a class="icon-nav-item" href="#!">
	                  <div class="icon-container mb-2"><span class="fs-4 uil uil-mobile-android"></span></div>
	                  <p class="nav-label">Mobile</p>
	                </a><a class="icon-nav-item" href="#!">
	                  <div class="icon-container mb-2"><span class="fs-4 uil uil-monitor"></span></div>
	                  <p class="nav-label">Electronics</p>
	                </a><a class="icon-nav-item" href="#!">
	                  <div class="icon-container mb-2"><span class="fs-4 uil uil-estate"></span></div>
	                  <p class="nav-label">Home</p>
	                </a><a class="icon-nav-item" href="#!">
	                  <div class="icon-container mb-2"><span class="fs-4 uil uil-lamp"></span></div>
	                  <p class="nav-label">Dining</p>
	                </a><a class="icon-nav-item" href="#!">
	                  <div class="icon-container mb-2"><span class="fs-4 uil uil-gift"></span></div>
	                  <p class="nav-label">Gifts</p>
	                </a><a class="icon-nav-item" href="#!">
	                  <div class="icon-container mb-2"><span class="fs-4 uil uil-wrench"></span></div>
	                  <p class="nav-label">Tools</p>
	                </a><a class="icon-nav-item" href="#!">
	                  <div class="icon-container mb-2"><span class="fs-4 uil uil-plane-departure"></span></div>
	                  <p class="nav-label">Travel</p>
	                </a><a class="icon-nav-item" href="#!">
	                  <div class="icon-container mb-2"><span class="fs-4 uil uil-palette"></span></div>
	                  <p class="nav-label">Others</p>
	                </a></div>
	            </div>
	          </div><!-- end of .container-->
	        </section>
	    <!-- =============================================== 네비게이션 바 끝 ================================================================-->
	        
        <!-- =============================================== 슬라이드 시작 ================================================================-->
        <section class="py-0 px-xl-3">
          <div class="container px-xl-0 px-xxl-3">
            <div class="row g-3 mb-9">
              <div class="col-12">
                <div class="whooping-banner w-100 rounded-3 overflow-hidden">
                  <div class="bg-holder z-n1 product-bg" style="background-image:url(resources/assets/img/e-commerce/whooping_banner_product.png);background-position: bottom right;"></div>
                  <!--/.bg-holder-->
                  <div class="bg-holder z-n1 shape-bg" style="background-image:url(resources/assets/img/e-commerce/whooping_banner_shape_2.png);background-position: bottom left;"></div>
                  <!--/.bg-holder-->
                  <div class="banner-text" data-bs-theme="light">
                    <h2 class="text-warning-light fw-bolder fs-lg-3 fs-xxl-2">Whooping <span class="gradient-text">60% </span>Off</h2>
                    <h3 class="fw-bolder fs-lg-5 fs-xxl-3 text-white">on everyday items</h3>
                  </div><a class="btn btn-lg btn-primary rounded-pill banner-button" href="#!">Shop Now</a>
                </div>
              </div>
              <div class="col-12 col-xl-6">
                <div class="gift-items-banner w-100 rounded-3 overflow-hidden">
                  <div class="bg-holder z-n1 banner-bg" style="background-image:url(resources/assets/img/e-commerce/gift-items-banner-bg.png);"></div>
                  <!--/.bg-holder-->
                  <div class="banner-text text-md-center">
                    <h2 class="text-white fw-bolder fs-xl-4">Get <span class="gradient-text">10% Off </span><br class="d-md-none"> on gift items</h2><a class="btn btn-lg btn-primary rounded-pill banner-button" href="#!">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-12 col-xl-6">
                <div class="best-in-market-banner d-flex h-100 px-4 px-sm-7 py-5 px-md-11 rounded-3 overflow-hidden">
                  <div class="bg-holder z-n1 banner-bg" style="background-image:url(resources/assets/img/e-commerce/best-in-market-bg.png);"></div>
                  <!--/.bg-holder-->
                  <div class="row align-items-center w-sm-100">
                    <div class="col-8">
                      <div class="banner-text">
                        <h2 class="text-white fw-bolder fs-sm-4 mb-5">MI 11 Pro<br><span class="fs-7 fs-sm-6"> Best in the market</span></h2><a class="btn btn-lg btn-warning rounded-pill banner-button" href="#!">Buy Now</a>
                      </div>
                    </div>
                    <div class="col-4"><img class="w-100 w-sm-75" src="resources/assets/img/e-commerce/5.png" alt=""></div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- =============================================== 오늘의 세일 상품 시작 ================================================================-->
            <div class="row g-4 mb-6">
              <div class="col-12 col-lg-9 col-xxl-10">
                <div class="d-flex flex-between-center mb-3">
                  <div class="d-flex"><span class="fas fa-bolt text-warning fs-6"></span>
                    <h3 class="mx-2">오늘의 세일 상품</h3><span class="fas fa-bolt text-warning fs-6"></span>
                  </div><a class="btn btn-link btn-lg p-0 d-none d-md-block" href="#!">더보기<span class="fas fa-chevron-right fs-9 ms-1"></span></a>
                </div>
                <div class="swiper-theme-container products-slider">
                  <div class="swiper swiper theme-slider" data-swiper='{"slidesPerView":1,"spaceBetween":16,"breakpoints":{"450":{"slidesPerView":2,"spaceBetween":16},"768":{"slidesPerView":3,"spaceBetween":20},"1200":{"slidesPerView":4,"spaceBetween":16},"1540":{"slidesPerView":5,"spaceBetween":16}}}'>
                    <div class="swiper-wrapper">
                      <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                          <div class="d-flex flex-column justify-content-between h-100">
                            <div>
                              <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/product_main_image/Amuse_tint.jpg" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                                <h6 class="mb-2 lh-sm line-clamp-3 product-name">[단독기획/장원영PICK] NEW 어뮤즈 베베 틴트 기획/단품</h6>
                              </a>
                              <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="text-body-quaternary fw-semibold ms-1">(67)</span></p>
                            </div>
                            <div>
                              <p class="fs-9 text-body-highlight fw-bold mb-2">립밤 증정</p>
                              <div class="d-flex align-items-center mb-1">
                                <p class="me-2 text-body text-decoration-line-through mb-0">20,000원</p>
                                <h3 class="text-body-emphasis mb-0">17,000원</h3>
                              </div>
                              <!-- <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">2 colors</p> -->
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                          <div class="d-flex flex-column justify-content-between h-100">
                            <div>
                              <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/product_main_image/Etude_lip_scrub.jpg" alt="" /><span class="badge text-bg-success fs-10 product-verified-badge">Verified<span class="fas fa-check ms-1"></span></span></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                                <h6 class="mb-2 lh-sm line-clamp-3 product-name">에뛰드 진저 슈가 립케어 3종 택1 (립마스크/립밤/스틱)</h6>
                              </a>
                              <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="text-body-quaternary fw-semibold ms-1">(74)</span></p>
                            </div>
                            <div>
                              <div class="d-flex align-items-center mb-1">
                                <p class="me-2 text-body text-decoration-line-through mb-0">10,000원</p>
                                <h3 class="text-body-emphasis mb-0">7,000원</h3>
                              </div>
                              <p class="text-success fw-bold fs-9 lh-1 mb-0">특허 받은 제품입니다</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                          <div class="d-flex flex-column justify-content-between h-100">
                            <div>
                              <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/product_main_image/AprilSkin_Cusion.jpg" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                                <h6 class="mb-2 lh-sm line-clamp-3 product-name">에이프릴스킨 히어로 쿠션</h6>
                              </a>
                              <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="text-body-quaternary fw-semibold ms-1">(33)</span></p>
                            </div>
                            <div>
                              <p class="fs-9 text-body-highlight fw-bold mb-2">리필 증정</p>
                              <div class="d-flex align-items-center mb-1">
                                <p class="me-2 text-body text-decoration-line-through mb-0">33,000원</p>
                                <h3 class="text-body-emphasis mb-0">23,000원</h3>
                              </div>
                              <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">5 colors</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                          <div class="d-flex flex-column justify-content-between h-100">
                            <div>
                              <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/product_main_image/Clio_eyeshadow.jpg" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                                <h6 class="mb-2 lh-sm line-clamp-3 product-name">클리오 프로아이팔레트에어 기획/단품</h6>
                              </a>
                              <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="text-body-quaternary fw-semibold ms-1">(97)</span></p>
                            </div>
                            <div>
                              <p class="fs-9 text-body-highlight fw-bold mb-2">후로페샤날 청과/키링+스티커 증정</p>
                              <div class="d-flex align-items-center mb-1">
                                <p class="me-2 text-body text-decoration-line-through mb-0">34,000원</p>
                                <h3 class="text-body-emphasis mb-0">24,800원</h3>
                              </div>
                              <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">2 colors</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                          <div class="d-flex flex-column justify-content-between h-100">
                            <div>
                              <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/product_main_image/2aN_cheek.jpg" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                                <h6 class="mb-2 lh-sm line-clamp-3 product-name">투에이엔 듀얼치크 (단품/한정기획)</h6>
                              </a>
                              <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="text-body-quaternary fw-semibold ms-1">(134)</span></p>
                            </div>
                            <div>
                              <p class="fs-9 text-body-highlight fw-bold mb-2">매진임박 상품입니다</p>
                              <div class="d-flex align-items-center mb-1">
                                <p class="me-2 text-body text-decoration-line-through mb-0">19,000원</p>
                                <h3 class="text-body-emphasis mb-0">14,800원</h3>
                              </div>
                              <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">8 colors</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                          <div class="d-flex flex-column justify-content-between h-100">
                            <div>
                              <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/product_main_image/Skinfood_eyebrow_pencil.jpg" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                                <h6 class="mb-2 lh-sm line-clamp-3 product-name">[NEW] 스킨푸드 초코 아이브로우 슬림 펜슬</h6>
                              </a>
                              <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="text-body-quaternary fw-semibold ms-1">(59)</span></p>
                            </div>
                            <div>
                              <h3 class="text-body-emphasis">6,400원</h3>
                              <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">4 colors</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- <div class="swiper-nav swiper-product-nav">
                    <div class="swiper-button-next"><span class="fas fa-chevron-right nav-icon"></span></div>
                    <div class="swiper-button-prev"><span class="fas fa-chevron-left nav-icon"></span></div>
                  </div> -->
                <!-- </div><a class="fw-bold d-md-none px-0" href="#!">더보기<span class="fas fa-chevron-right fs-9 ms-1"></span></a> -->
              </div>
              <!-- <div class="col-lg-3 d-none d-lg-block col-xxl-2">
                <div class="h-100 position-relative rounded-3 overflow-hidden">
                  <div class="bg-holder" style="background-image:url(resources/assets/img/e-commerce/4.png);"></div>
                  /.bg-holder
                </div>
              </div> -->
              <br>
              <!-- =============================================== 현재 인기 상품 시작 ================================================================-->
              <div class="col-12 d-lg-none"><a href="#!"><img class="w-100 rounded-3" src="resources/assets/img/e-commerce/6.png" alt="" /></a></div>
            </div>
            <div class="mb-6">
              <div class="d-flex flex-between-center mb-3">
                <h3>현재 인기 상품</h3><a class="fw-bold d-none d-md-block" href="#!">더보기<span class="fas fa-chevron-right fs-9 ms-1"></span></a>
              </div>
              <div class="swiper-theme-container products-slider">
                <div class="swiper swiper theme-slider" data-swiper='{"slidesPerView":1,"spaceBetween":16,"breakpoints":{"450":{"slidesPerView":2,"spaceBetween":16},"576":{"slidesPerView":3,"spaceBetween":20},"768":{"slidesPerView":4,"spaceBetween":20},"992":{"slidesPerView":5,"spaceBetween":20},"1200":{"slidesPerView":6,"spaceBetween":16}}}'>
                  <div class="swiper-wrapper">
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/5.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">Razer Kraken v3 x Wired 7.1 Surroung Sound Gaming headset</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="text-body-quaternary fw-semibold ms-1">(59 people rated)</span></p>
                          </div>
                          <div>
                            <h3 class="text-body-emphasis">$59.00</h3>
                            <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">2 colors</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/7.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">2021 Apple 12.9-inch iPad Pro (Wi‑Fi, 128GB) - Space Gray</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="text-body-quaternary fw-semibold ms-1">(13 people rated)</span></p>
                          </div>
                          <div>
                            <h3 class="text-body-emphasis">$799.00</h3>
                            <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">2 colors</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/12.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">HORI Racing Wheel Apex for PlayStation 4/3, and PC</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="text-body-quaternary fw-semibold ms-1">(64 people rated)</span></p>
                          </div>
                          <div>
                            <p class="fs-9 text-body-highlight fs-9 mb-0 fw-bold">Leather cover add-on available</p>
                            <p class="fs-9 text-body-tertiary fs-9 mb-2">supports Windows 11</p>
                            <h3 class="text-body-emphasis">$299.00</h3>
                            <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">1 colors</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container active" data-bs-toggle="tooltip" data-bs-placement="top" title="Remove from wishlist"><span class="fas fa-heart"></span></button><img class="img-fluid" src="resources/assets/img/products/1.png" alt="" /><span class="badge text-bg-success fs-10 product-verified-badge">Verified<span class="fas fa-check ms-1"></span></span></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">Amazfit T-Rex Pro Smart Watch with GPS, Outdoor Fitness Watch for Men, Military Standard Certified</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="text-body-quaternary fw-semibold ms-1">(32 people rated)</span></p>
                          </div>
                          <div>
                            <h3 class="text-body-emphasis">$20.00</h3>
                            <p class="text-success fw-bold fs-9 lh-1 mb-0">Deal time ends in 24 hours</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/16.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">Apple AirPods Pro</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="text-body-quaternary fw-semibold ms-1">(39 people rated)</span></p>
                          </div>
                          <div>
                            <p class="fs-9 text-body-highlight fs-9 mb-0 fw-bold">Free with iPhone 5s</p>
                            <p class="fs-9 text-body-tertiary fs-9 mb-2">Ships to Canada</p>
                            <h3 class="text-body-emphasis">$59.00</h3>
                            <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">3 colors</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/10.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">Apple Magic Mouse (Wireless, Rechargable) - Silver</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa-regular fa-star text-warning-light"></span><span class="fa-regular fa-star text-warning-light"></span><span class="fa-regular fa-star text-warning-light"></span><span class="fa-regular fa-star text-warning-light"></span><span class="text-body-quaternary fw-semibold ms-1">(6 people rated)</span></p>
                          </div>
                          <div>
                            <p class="fs-9 text-body-highlight fs-9 mb-0 fw-bold">Bundle available</p>
                            <p class="fs-9 text-body-tertiary fs-9 mb-2">Charger not included</p>
                            <h3 class="text-body-emphasis">$89.00</h3>
                            <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">2 colors</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/8.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">Amazon Basics Matte Black Wired Keyboard - US Layout (QWERTY)</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa-regular fa-star text-warning-light"></span><span class="fa-regular fa-star text-warning-light"></span><span class="text-body-quaternary fw-semibold ms-1">(7 people rated)</span></p>
                          </div>
                          <div>
                            <h3 class="text-body-emphasis">$98.00</h3>
                            <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">1 colors</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="swiper-nav">
                  <div class="swiper-button-next"><span class="fas fa-chevron-right nav-icon"></span></div>
                  <div class="swiper-button-prev"><span class="fas fa-chevron-left nav-icon"></span></div>
                </div>
              </div><a class="fw-bold d-md-none" href="#!">Explore more<span class="fas fa-chevron-right fs-9 ms-1"></span></a>
            </div>
            
            <!-- =============================================== 추천 상품 시작 ================================================================-->
            <div class="mb-6">
              <div class="d-flex flex-between-center mb-3">
                <h3>추천 상품</h3><a class="fw-bold d-none d-md-block" href="#!">더보기<span class="fas fa-chevron-right fs-9 ms-1"></span></a>
              </div>
              <div class="swiper-theme-container products-slider">
                <div class="swiper swiper theme-slider" data-swiper='{"slidesPerView":1,"spaceBetween":16,"breakpoints":{"450":{"slidesPerView":2,"spaceBetween":16},"576":{"slidesPerView":3,"spaceBetween":20},"768":{"slidesPerView":4,"spaceBetween":20},"992":{"slidesPerView":5,"spaceBetween":20},"1200":{"slidesPerView":6,"spaceBetween":16}}}'>
                  <div class="swiper-wrapper">
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/25.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">RESPAWN 200 Racing Style Gaming Chair, in Gray RSP 200 GRY</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span></p>
                          </div>
                          <div>
                            <h6 class="text-success lh-1 mb-0">35% off</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/27.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">LEVOIT Humidifiers for Bedroom Large Room 6L Warm and Cool Mist for...</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa-regular fa-star text-warning-light"></span></p>
                          </div>
                          <div>
                            <h6 class="text-success lh-1 mb-0">18% off</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/26.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">NETGEAR Nighthawk Pro Gaming XR500 Wi-Fi Router with 4 Ethernet Ports...</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span></p>
                          </div>
                          <div>
                            <h6 class="text-success lh-1 mb-0">15% off</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/18.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">Rachael Ray Cucina Bakeware Set Includes Nonstick Bread Baking Cookie Sheet...</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star-half-alt star-icon text-warning"></span><span class="fa-regular fa-star text-warning-light"></span></p>
                          </div>
                          <div>
                            <h6 class="text-success lh-1 mb-0">20% off</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/17.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">Xbox Series S</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span></p>
                          </div>
                          <div>
                            <h6 class="text-success lh-1 mb-0">12% off</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/24.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">FURINNO Computer Writing Desk, Walnut</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span></p>
                          </div>
                          <div>
                            <h6 class="text-success lh-1 mb-0">16% off</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="position-relative text-decoration-none product-card h-100">
                        <div class="d-flex flex-column justify-content-between h-100">
                          <div>
                            <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button class="btn btn-wish btn-wish-primary z-2 d-toggle-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span class="fas fa-heart d-block-hover"></span><span class="far fa-heart d-none-hover"></span></button><img class="img-fluid" src="resources/assets/img/products/18.png" alt="" /></div><a class="stretched-link" href="resources/apps/e-commerce/landing/product-details.html">
                              <h6 class="mb-2 lh-sm line-clamp-3 product-name">Seagate Portable 2TB External Hard Drive Portable HDD</h6>
                            </a>
                            <p class="fs-9"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa-regular fa-star text-warning-light"></span></p>
                          </div>
                          <div>
                            <h6 class="text-success lh-1 mb-0">15% off</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="swiper-nav">
                  <div class="swiper-button-next"><span class="fas fa-chevron-right nav-icon"></span></div>
                  <div class="swiper-button-prev"><span class="fas fa-chevron-left nav-icon"></span></div>
                </div>
              </div><a class="fw-bold d-md-none" href="#!">Explore more<span class="fas fa-chevron-right fs-9 ms-1"></span></a>
            </div>
            <div class="row flex-center mb-15 mt-11 gy-6">
              <div class="col-auto"><img class="d-dark-none" src="resources/assets/img/spot-illustrations/light_30.png" alt="" width="305" /><img class="d-light-none" src="resources/assets/img/spot-illustrations/dark_30.png" alt="" width="305" /></div>
              <div class="col-auto">
                <div class="text-center text-lg-start">
                  <h3 class="text-body-highlight mb-2"><span class="fw-semibold">회원이 되어 </span>더 많은 <br class="d-md-none" />혜택을 누리고 싶으신가요?</h3>
                  <h1 class="display-3 fw-semibold mb-4">지금 <span class="text-primary fw-bolder">회원가입 </span>하세요!</h1><a class="btn btn-lg btn-primary px-7" href="resources/pages/authentication/simple/sign-up.html">회원가입<span class="fas fa-chevron-right ms-2 fs-9"></span></a>
                </div>
              </div>
            </div>
          </div><!-- end of .container-->
        </section><!-- <section> close ============================-->
        <!-- ============================================-->

      </div>


      <!-- ============================================-->
      <!-- <section> begin ============================-->
      <section class="bg-body-highlight dark__bg-gray-1100 py-9">
        <div class="container-small">
          <div class="row justify-content-between gy-4">
            <div class="col-12 col-lg-4">
              <div class="d-flex align-items-center mb-3"><img src="resources/assets/img/icons/logo.png" alt="phoenix" width="27" />
                <p class="logo-text ms-2">phoenix</p>
              </div>
              <p class="text-body-tertiary mb-1 fw-semibold lh-sm fs-9">Phoenix is an admin dashboard template with fascinating features and amazing layout. The template is responsive to all major browsers and is compatible with all available devices and screen sizes.</p>
            </div>
            <div class="col-6 col-md-auto">
              <h5 class="fw-bolder mb-3">About Phoenix</h5>
              <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Careers</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Affiliate Program</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Privacy Policy</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Terms & Conditions</a></div>
            </div>
            <div class="col-6 col-md-auto">
              <h5 class="fw-bolder mb-3">Stay Connected</h5>
              <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Blogs</a><a class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span class="fab fa-facebook-square text-primary me-2 fs-8"></span><span class="text-body-secondary">Facebook</span></a><a class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span class="fab fa-twitter-square text-info me-2 fs-8"></span><span class="text-body-secondary">Twitter</span></a></div>
            </div>
            <div class="col-6 col-md-auto">
              <h5 class="fw-bolder mb-3">Customer Service</h5>
              <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Help Desk</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Support, 24/7</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Community of Phoenix</a></div>
            </div>
            <div class="col-6 col-md-auto">
              <h5 class="fw-bolder mb-3">Payment Method</h5>
              <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Cash on Delivery</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Online Payment</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">PayPal</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Installment</a></div>
            </div>
          </div>
        </div><!-- end of .container-->
      </section><!-- <section> close ============================-->
      <!-- ============================================-->

      <footer class="footer position-relative">
        <div class="row g-0 justify-content-between align-items-center h-100">
          <div class="col-12 col-sm-auto text-center">
            <p class="mb-0 mt-2 mt-sm-0 text-body">Thank you for creating with Phoenix<span class="d-none d-sm-inline-block"></span><span class="d-none d-sm-inline-block mx-1">|</span><br class="d-sm-none" />2024 &copy;<a class="mx-1" href="https://themewagon.com">Themewagon</a></p>
          </div>
          <div class="col-12 col-sm-auto text-center">
            <p class="mb-0 text-body-tertiary text-opacity-85">v1.15.0</p>
          </div>
        </div>
      </footer>
    </main>

    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="resources/vendors/popper/popper.min.js"></script>
    <script src="resources/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="resources/vendors/anchorjs/anchor.min.js"></script>
    <script src="resources/vendors/is/is.min.js"></script>
    <script src="resources/vendors/fontawesome/all.min.js"></script>
    <script src="resources/vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="resources/vendors/list.js/list.min.js"></script>
    <script src="resources/vendors/feather-icons/feather.min.js"></script>
    <script src="resources/vendors/dayjs/dayjs.min.js"></script>
    <script src="resources/assets/js/phoenix.js"></script>
    <script src="resources/vendors/swiper/swiper-bundle.min.js"></script>
  </body>

</html>