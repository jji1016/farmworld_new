<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp" %>
    

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->

<!-- 페이지 왼쪽 -->        
<div class="container-fluid fruite py-5">
	<div class="container py-5">
	    <h1 class="mb-4">Fresh fruits shop</h1>
	    <div class="row g-4">
	        <div class="col-lg-12">
	            <div class="row g-4">
	            	<!-- 검색 select -->
	                <div class="col-xl-3">
	                </div>
	                <!-- 검색 select 끝 -->
	                <!-- 검색 keywords -->
	                <div class="col-6">
	                	<div class="input-group w-100 mx-auto d-flex">
	                        <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
	                        <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
	                    </div>
	                </div>
	                <!-- 검색 keywords 끝 -->
	                <!-- 정렬 -->
	                <div class="col-xl-3">
	                    <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
	                        <label for="fruits">Default Sorting:</label>
	                        <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform">
	                            <option value="volvo">Nothing</option>
	                            <option value="saab">Popularity</option>
	                            <option value="opel">Organic</option>
	                            <option value="audi">Fantastic</option>
	                        </select>
	                    </div>
	                </div>
	                <!-- 정렬 끝 -->
	            </div>
	            <div class="row g-4">
	            <!-- 카테고리 -->
	               <div class="col-lg-3">
	                   <div class="row g-4">
	                       <div class="col-lg-12">
	                           <div class="mb-3">
	                           
	                               <h4>Categories</h4>
	                               <ul class="list-unstyled fruite-categorie">
	                                   <li>
	                                       <div class="d-flex justify-content-between fruite-name">
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>Apples</a>
	                                           <span>(3)</span>
	                                       </div>
	                                   </li>
	                                   <li>
	                                       <div class="d-flex justify-content-between fruite-name">
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>Oranges</a>
	                                           <span>(5)</span>
	                                       </div>
	                                   </li>
	                                   <li>
	                                       <div class="d-flex justify-content-between fruite-name">
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>Strawbery</a>
	                                           <span>(2)</span>
	                                       </div>
	                                   </li>
	                                   <li>
	                                       <div class="d-flex justify-content-between fruite-name">
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>Banana</a>
	                                           <span>(8)</span>
	                                       </div>
	                                   </li>
	                                   <li>
	                                       <div class="d-flex justify-content-between fruite-name">
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>Pumpkin</a>
	                                           <span>(5)</span>
	                                       </div>
	                                   </li>
	                               </ul>
	                           </div>
	                       </div>
	                   </div>
	               </div>
	               <!-- 카테고리 끝 -->
                    
                    <div class="col-lg-9">
                            <!-- 추천상품 -->
                            	<h1 class="fw-bold mb-0">추천 상품</h1>
				                <div class="vesitable">
				                    <div class="owl-carousel vegetable-carousel justify-content-center">
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>Parsely</h4>
				                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>Parsely</h4>
				                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-3.png" class="img-fluid w-100 rounded-top bg-light" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>Banana</h4>
				                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>Bell Papper</h4>
				                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>Potatoes</h4>
				                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>Parsely</h4>
				                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>Potatoes</h4>
				                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>Parsely</h4>
				                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				                <!-- 추천상품 끝 -->
				                
				                <!-- 상품 -->
                                <div class="row g-4 justify-content-center">
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Grapes</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Grapes</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Raspberries</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Apricots</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-3.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Banana</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Oranges</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Raspberries</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Grapes</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Oranges</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="pagination d-flex justify-content-center mt-5">
                                            <a href="#" class="rounded">&laquo;</a>
                                            <a href="#" class="active rounded">1</a>
                                            <a href="#" class="rounded">2</a>
                                            <a href="#" class="rounded">3</a>
                                            <a href="#" class="rounded">4</a>
                                            <a href="#" class="rounded">5</a>
                                            <a href="#" class="rounded">6</a>
                                            <a href="#" class="rounded">&raquo;</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 상품 끝 -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->
                        
                        
<%@include file="includes/footer.jsp" %>