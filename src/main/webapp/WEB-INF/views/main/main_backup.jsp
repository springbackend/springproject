<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트상품</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
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
</body>
</html>