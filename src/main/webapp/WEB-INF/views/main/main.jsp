<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <style>
    	#login{
    		background-color:#3874ff !important;
    		color:white !important;
    	}
    	#login:hover{background-color:#004dff !important;}
    </style>
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
    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Revuse</title>
	</head>
	<body>
			<!-- =============================================== 네비게이션 바 ================================================================-->
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
	                        	<c:if test="${user eq 0}">
	                        		<div style="margin-top:15px;">
			                            <div class="px-3"> <a id="login" class="btn btn-phoenix-secondary d-flex flex-center w-100" href="/beauty/login.do"> 로그인</a></div>
			                        	<div class="px-3"> <a id="join" class="btn btn-phoenix-secondary d-flex flex-center w-100" href="/beauty/regist.do"> 회원가입</a></div>
			                            <div class="my-2 text-center fw-bold fs-10 text-body-quaternary"><a class="text-body-quaternary me-1" href="#!">Privacy policy</a>&bull;<a class="text-body-quaternary mx-1" href="#!">Terms</a>&bull;<a class="text-body-quaternary ms-1" href="#!">Cookies</a></div>
			                        </div>
	                        	</c:if>
	                        	<!-- 회원인 경우 -->
	                        	<c:if test="${user eq 1}">
		                        	<div style="margin-top:15px;">
			                        	<div class="px-3"> <a class="btn btn-phoenix-secondary d-flex flex-center w-100" href="/beauty/logout.do"> <span class="me-2" data-feather="log-in"> </span>로그아웃</a></div>
			                            <div class="my-2 text-center fw-bold fs-10 text-body-quaternary"><a class="text-body-quaternary me-1" href="#!">Privacy policy</a>&bull;<a class="text-body-quaternary mx-1" href="#!">Terms</a>&bull;<a class="text-body-quaternary ms-1" href="#!">Cookies</a></div>
			                        </div>
	                        	</c:if>
	                        	
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
	                    <form class="position-relative"><input class="form-control search-input search form-control-sm" type="search" placeholder="검색" aria-label="Search" />
	                      <span class="fas fa-search search-box-icon"></span>
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
	        
	        	
	          <div class="dropdown"><button class="btn text-body ps-0 pe-5 text-nowrap dropdown-toggle dropdown-caret-none" data-category-btn="data-category-btn" data-bs-toggle="dropdown"><span class="fas fa-bars me-2"></span>카테고리</button>
	           <div class="dropdown-menu border border-translucent py-0 category-dropdown-menu">
	             <div class="card border-0 scrollbar" style="max-height: 657px;">
	                <!-- 카테고리  <div class="card-body p-6 pb-3">
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
	                </div> -->
	              </div>
	            </div>
	          </div>
	          
	          <!-- 네비게이션 바 -->
	          <ul class="navbar-nav justify-content-end align-items-center">
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link ps-0 active" href="board_list.do">게시판</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/favourite-stores.html">세일 상품</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/products-filter.html">인기 상품</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/wishlist.html">추천 상품</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/shipping-info.html">이벤트</a></li>
	          </ul>
	        </div>
	      </nav>
			<!-- =============================================== 슬라이드 시작 ================================================================-->
			<section class="py-0 px-xl-3">
				<div class="container px-xl-0 px-xxl-3">
					<div class="row g-3 mb-9">
						<div class="col-12">
							<div class="whooping-banner w-100 rounded-3 overflow-hidden">
								<div class="bg-holder z-n1 product-bg"
									style="background-image: url(resources/assets/img/e-commerce/whooping_banner_product.png); background-position: bottom right;"></div>
								<!--/.bg-holder-->
								<div class="bg-holder z-n1 shape-bg"
									style="background-image: url(resources/assets/img/e-commerce/whooping_banner_shape_2.png); background-position: bottom left;"></div>
								<!--/.bg-holder-->
								<div class="banner-text" data-bs-theme="light">
									<h2 class="text-warning-light fw-bolder fs-lg-3 fs-xxl-2">
										Whooping <span class="gradient-text">60% </span>Off
									</h2>
									<h3 class="fw-bolder fs-lg-5 fs-xxl-3 text-white">on
										everyday items</h3>
								</div>
								<a class="btn btn-lg btn-primary rounded-pill banner-button"
									href="#!">Shop Now</a>
							</div>
						</div>
					</div>
				</div>

				<!-- =============================================== 오늘의 세일 상품 시작 ================================================================-->
				<div class="row g-4 mb-6">
					<div class="col-12 col-lg-9 col-xxl-10">
						<div class="d-flex flex-between-center mb-3">
							<div class="d-flex">
								<span class="fas fa-bolt text-warning fs-6"></span>
								<h3 class="mx-2">오늘의 세일 상품</h3>
								<span class="fas fa-bolt text-warning fs-6"></span>
							</div>
							<a class="btn btn-link btn-lg p-0 d-none d-md-block" href="#!">더보기<span
								class="fas fa-chevron-right fs-9 ms-1"></span></a>
						</div>
						<div class="swiper-theme-container products-slider">
							<div class="swiper swiper theme-slider"
								data-swiper='{"slidesPerView":1,"spaceBetween":16,"breakpoints":{"450":{"slidesPerView":2,"spaceBetween":16},"768":{"slidesPerView":3,"spaceBetween":20},"1200":{"slidesPerView":4,"spaceBetween":16},"1540":{"slidesPerView":5,"spaceBetween":16}}}'>
								<div class="swiper-wrapper">
								<c:forEach var="product" items="${d_list }">
									<div class="swiper-slide">
										<div
											class="position-relative text-decoration-none product-card h-100">
											<div class="d-flex flex-column justify-content-between h-100">
												<div>
													<div
														class="border border-1 border-translucent rounded-3 position-relative mb-3">
														<button
															class="btn btn-wish btn-wish-primary z-2 d-toggle-container"
															data-bs-toggle="tooltip" data-bs-placement="top"
															title="Add to wishlist">
															<span class="fas fa-heart d-block-hover"></span><span
																class="far fa-heart d-none-hover"></span>
														</button>
														<img class="img-fluid"
																src="resources/productimages/${product.p_image }" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">${product.p_name }</h6>
													</a>
													<p class="fs-9">

															<c:forEach begin="1" end="${product.avg_star}" var="i">
																<span class="fas fa-star text-warning"></span>
															</c:forEach>
															<c:forEach begin="${product.avg_star+1}" end="5"
																var="i">
																<span class="far fa-star text-warning"></span>
															</c:forEach>
															<span class="text-body-quaternary fw-semibold ms-1">(${product.total_comments}
																people rated)</span>
														</p>
												</div>
												<div>
													<div class="d-flex align-items-center mb-1">
														<p
															class="me-2 text-body text-decoration-line-through mb-0">
															<fmt:formatNumber value="${product.p_price}"
																type="currency" currencySymbol="" groupingUsed="true" />
															원</p>
														<h3 class="text-body-emphasis mb-0"><fmt:formatNumber value="${product.discountprice}"
																type="currency" currencySymbol="" groupingUsed="true" />
															원</h3>
													</div>
													<!-- <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">2 colors</p> -->
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div><!-- dd -->
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
                </div>-->
              </div> 
						<br>
						<!-- =============================================== 현재 인기 상품 시작 ================================================================-->
						<div class="col-12 d-lg-none">
							<a href="#!"><img class="w-100 rounded-3"
								src="resources/assets/img/e-commerce/6.png" alt="" /></a>
						</div>
					</div>

      </div>


					<div class="mb-6" id="best_list">
						<div class="d-flex flex-between-center mb-3">
							<h3>현재 인기 상품</h3>
							<a class="fw-bold d-none d-md-block" href="#!">더보기<span
								class="fas fa-chevron-right fs-9 ms-1"></span></a>
						</div>
						<div class="swiper-theme-container products-slider">
							<div class="swiper swiper theme-slider"
								data-swiper='{"slidesPerView":1,"spaceBetween":16,"breakpoints":{"450":{"slidesPerView":2,"spaceBetween":16},"576":{"slidesPerView":3,"spaceBetween":20},"768":{"slidesPerView":4,"spaceBetween":20},"992":{"slidesPerView":5,"spaceBetween":20},"1200":{"slidesPerView":6,"spaceBetween":16}}}'>
								<div class="swiper-wrapper">
									<c:forEach var="product" items="${list }">
										<div class="swiper-slide">
											<div
												class="position-relative text-decoration-none product-card h-100">
												<div
													class="d-flex flex-column justify-content-between h-100">
													<div>
														<div
															class="border border-1 border-translucent rounded-3 position-relative mb-3">
															<button
																class="btn btn-wish btn-wish-primary z-2 d-toggle-container"
																data-bs-toggle="tooltip" data-bs-placement="top"
																title="Add to wishlist">
																<span class="fas fa-heart d-block-hover"></span><span
																	class="far fa-heart d-none-hover"></span>
															</button>
															<img class="img-fluid"
																src="resources/productimages/${product.p_image }" alt="" />
														</div>
														<a class="stretched-link"
															href="resources/apps/e-commerce/landing/product-details.html">
															<h6 class="mb-2 lh-sm line-clamp-3 product-name">${product.p_name }</h6>
														</a>
														<p class="fs-9">

															<c:forEach begin="1" end="${product.avg_star}" var="i">
																<span class="fas fa-star text-warning"></span>
															</c:forEach>
															<c:forEach begin="${product.avg_star+1}" end="5"
																var="i">
																<span class="far fa-star text-warning"></span>
															</c:forEach>
															<span class="text-body-quaternary fw-semibold ms-1">(${product.total_comments}
																people rated)</span>
														</p>
													</div>
													<div>
														<h3 class="text-body-emphasis">
															<fmt:formatNumber value="${product.p_price}"
																type="currency" currencySymbol="" groupingUsed="true" />
															원
														</h3>
													</div>
												</div>
											</div>
										</div>
										<!-- 1 -->
									</c:forEach>
								</div>
							</div>
							<div class="swiper-nav">
								<div class="swiper-button-next">
									<span class="fas fa-chevron-right nav-icon"></span>
								</div>
								<div class="swiper-button-prev">
									<span class="fas fa-chevron-left nav-icon"></span>
								</div>
							</div>
						</div>
						<a class="fw-bold d-md-none" href="#!">Explore more<span
							class="fas fa-chevron-right fs-9 ms-1"></span></a>
					</div>

					<!-- =============================================== 추천 상품 시작 ================================================================-->
					<div class="mb-6">
						<div class="d-flex flex-between-center mb-3">
							<h3>추천 상품</h3>
							<a class="fw-bold d-none d-md-block" href="#!">더보기<span
								class="fas fa-chevron-right fs-9 ms-1"></span></a>
						</div>
						<div class="swiper-theme-container products-slider">
							<div class="swiper swiper theme-slider"
								data-swiper='{"slidesPerView":1,"spaceBetween":16,"breakpoints":{"450":{"slidesPerView":2,"spaceBetween":16},"576":{"slidesPerView":3,"spaceBetween":20},"768":{"slidesPerView":4,"spaceBetween":20},"992":{"slidesPerView":5,"spaceBetween":20},"1200":{"slidesPerView":6,"spaceBetween":16}}}'>
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div
											class="position-relative text-decoration-none product-card h-100">
											<div class="d-flex flex-column justify-content-between h-100">
												<div>
													<div
														class="border border-1 border-translucent rounded-3 position-relative mb-3">
														<button
															class="btn btn-wish btn-wish-primary z-2 d-toggle-container"
															data-bs-toggle="tooltip" data-bs-placement="top"
															title="Add to wishlist">
															<span class="fas fa-heart d-block-hover"></span><span
																class="far fa-heart d-none-hover"></span>
														</button>
														<img class="img-fluid"
															src="resources/assets/img/products/25.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">RESPAWN
															200 Racing Style Gaming Chair, in Gray RSP 200 GRY</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">35% off</h6>
												</div>
											</div>
										</div>
									</div>
									<div class="swiper-slide">
										<div
											class="position-relative text-decoration-none product-card h-100">
											<div class="d-flex flex-column justify-content-between h-100">
												<div>
													<div
														class="border border-1 border-translucent rounded-3 position-relative mb-3">
														<button
															class="btn btn-wish btn-wish-primary z-2 d-toggle-container"
															data-bs-toggle="tooltip" data-bs-placement="top"
															title="Add to wishlist">
															<span class="fas fa-heart d-block-hover"></span><span
																class="far fa-heart d-none-hover"></span>
														</button>
														<img class="img-fluid"
															src="resources/assets/img/products/27.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">LEVOIT
															Humidifiers for Bedroom Large Room 6L Warm and Cool Mist
															for...</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa-regular fa-star text-warning-light"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">18% off</h6>
												</div>
											</div>
										</div>
									</div>
									<div class="swiper-slide">
										<div
											class="position-relative text-decoration-none product-card h-100">
											<div class="d-flex flex-column justify-content-between h-100">
												<div>
													<div
														class="border border-1 border-translucent rounded-3 position-relative mb-3">
														<button
															class="btn btn-wish btn-wish-primary z-2 d-toggle-container"
															data-bs-toggle="tooltip" data-bs-placement="top"
															title="Add to wishlist">
															<span class="fas fa-heart d-block-hover"></span><span
																class="far fa-heart d-none-hover"></span>
														</button>
														<img class="img-fluid"
															src="resources/assets/img/products/26.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">NETGEAR
															Nighthawk Pro Gaming XR500 Wi-Fi Router with 4 Ethernet
															Ports...</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">15% off</h6>
												</div>
											</div>
										</div>
									</div>
									<div class="swiper-slide">
										<div
											class="position-relative text-decoration-none product-card h-100">
											<div class="d-flex flex-column justify-content-between h-100">
												<div>
													<div
														class="border border-1 border-translucent rounded-3 position-relative mb-3">
														<button
															class="btn btn-wish btn-wish-primary z-2 d-toggle-container"
															data-bs-toggle="tooltip" data-bs-placement="top"
															title="Add to wishlist">
															<span class="fas fa-heart d-block-hover"></span><span
																class="far fa-heart d-none-hover"></span>
														</button>
														<img class="img-fluid"
															src="resources/assets/img/products/18.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">Rachael
															Ray Cucina Bakeware Set Includes Nonstick Bread Baking
															Cookie Sheet...</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star-half-alt star-icon text-warning"></span><span
															class="fa-regular fa-star text-warning-light"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">20% off</h6>
												</div>
											</div>
										</div>
									</div>
									<div class="swiper-slide">
										<div
											class="position-relative text-decoration-none product-card h-100">
											<div class="d-flex flex-column justify-content-between h-100">
												<div>
													<div
														class="border border-1 border-translucent rounded-3 position-relative mb-3">
														<button
															class="btn btn-wish btn-wish-primary z-2 d-toggle-container"
															data-bs-toggle="tooltip" data-bs-placement="top"
															title="Add to wishlist">
															<span class="fas fa-heart d-block-hover"></span><span
																class="far fa-heart d-none-hover"></span>
														</button>
														<img class="img-fluid"
															src="resources/assets/img/products/17.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">Xbox
															Series S</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">12% off</h6>
												</div>
											</div>
										</div>
									</div>
									<div class="swiper-slide">
										<div
											class="position-relative text-decoration-none product-card h-100">
											<div class="d-flex flex-column justify-content-between h-100">
												<div>
													<div
														class="border border-1 border-translucent rounded-3 position-relative mb-3">
														<button
															class="btn btn-wish btn-wish-primary z-2 d-toggle-container"
															data-bs-toggle="tooltip" data-bs-placement="top"
															title="Add to wishlist">
															<span class="fas fa-heart d-block-hover"></span><span
																class="far fa-heart d-none-hover"></span>
														</button>
														<img class="img-fluid"
															src="resources/assets/img/products/24.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">FURINNO
															Computer Writing Desk, Walnut</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">16% off</h6>
												</div>
											</div>
										</div>
									</div>
									<div class="swiper-slide">
										<div
											class="position-relative text-decoration-none product-card h-100">
											<div class="d-flex flex-column justify-content-between h-100">
												<div>
													<div
														class="border border-1 border-translucent rounded-3 position-relative mb-3">
														<button
															class="btn btn-wish btn-wish-primary z-2 d-toggle-container"
															data-bs-toggle="tooltip" data-bs-placement="top"
															title="Add to wishlist">
															<span class="fas fa-heart d-block-hover"></span><span
																class="far fa-heart d-none-hover"></span>
														</button>
														<img class="img-fluid"
															src="resources/assets/img/products/18.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">Seagate
															Portable 2TB External Hard Drive Portable HDD</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa-regular fa-star text-warning-light"></span>
													</p>
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
								<div class="swiper-button-next">
									<span class="fas fa-chevron-right nav-icon"></span>
								</div>
								<div class="swiper-button-prev">
									<span class="fas fa-chevron-left nav-icon"></span>
								</div>
							</div>
						</div>
						<a class="fw-bold d-md-none" href="#!">Explore more<span
							class="fas fa-chevron-right fs-9 ms-1"></span></a>
					</div>
					<div class="row flex-center mb-15 mt-11 gy-6">
						<div class="col-auto">
							<img class="d-dark-none"
								src="resources/assets/img/spot-illustrations/light_30.png"
								alt="" width="305" /><img class="d-light-none"
								src="resources/assets/img/spot-illustrations/dark_30.png" alt=""
								width="305" />
						</div>
						<div class="col-auto">
							<div class="text-center text-lg-start">
								<h3 class="text-body-highlight mb-2">
									<span class="fw-semibold">회원이 되어 </span>더 많은 <br
										class="d-md-none" />혜택을 누리고 싶으신가요?
								</h3>
								<h1 class="display-3 fw-semibold mb-4">
									지금 <span class="text-primary fw-bolder">회원가입 </span>하세요!
								</h1>
								<a class="btn btn-lg btn-primary px-7"
									href="resources/pages/authentication/simple/sign-up.html">회원가입<span
									class="fas fa-chevron-right ms-2 fs-9"></span></a>
							</div>
						</div>
					</div>
				</div>
				<!-- end of .container-->
			</section>
			<!-- <section> close ============================-->
			<!-- ============================================-->

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