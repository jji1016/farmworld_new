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
	    <h1 class="mb-4">작물샵</h1>
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
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>과일</a>
	                                           <span>(3)</span>
	                                       </div>
	                                   </li>
	                                   <li>
	                                       <div class="d-flex justify-content-between fruite-name">
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>야채</a>
	                                           <span>(5)</span>
	                                       </div>
	                                   </li>
	                                   <li>
	                                       <div class="d-flex justify-content-between fruite-name">
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>채소</a>
	                                           <span>(2)</span>
	                                       </div>
	                                   </li>
	                                   <li>
	                                       <div class="d-flex justify-content-between fruite-name">
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>견과류</a>
	                                           <span>(8)</span>
	                                       </div>
	                                   </li>
	                                   <li>
	                                       <div class="d-flex justify-content-between fruite-name">
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>곡물</a>
	                                           <span>(5)</span>
	                                       </div>
	                                   </li>
	                               		<li>
	                                       <div class="d-flex justify-content-between fruite-name">
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>씨앗</a>
	                                           <span>(5)</span>
                                            </div>
                                        </li>	
                                   	   <li>
	                                       <div class="d-flex justify-content-between fruite-name">
	                                           <a href="#"><i class="fas fa-apple-alt me-2"></i>농기구</a>
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
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">채소</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>파슬리</h4>
				                                <p>파슬리는 맛있다.</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">1kg / 100원</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">과일</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>방울토마토</h4>
				                                <p>방울토마토는 맛있다.</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">2kg / 200원</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-3.png" class="img-fluid w-100 rounded-top bg-light" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">과일</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>바나나</h4>
				                                <p>바나나는 맛있다.</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">3kg / 300원</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">과일</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>파프리카</h4>
				                                <p>파프리카는 싫어싫어</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">4kg / 400원</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">채소</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>감자</h4>
				                                <p>감자는 왕감자 왕감자</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">5kg / 500원</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">채소</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>당근</h4>
				                                <p>바니바니바니바니</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">6kg / 600원</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">채소</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>양파</h4>
				                                <p>까면 눈물나는 양파</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">7kg / 700원</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="border border-primary rounded position-relative vesitable-item">
				                            <div class="vesitable-img">
				                                <img src="/resources/img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
				                            </div>
				                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">곡물</div>
				                            <div class="p-4 pb-0 rounded-bottom">
				                                <h4>쌀</h4>
				                                <p>쌀쌀 이천쌀</p>
				                                <div class="d-flex justify-content-between flex-lg-wrap">
				                                    <p class="text-dark fs-5 fw-bold">8kg / 800원</p>
				                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
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
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">과일</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>포도</h4>
                                                <p>나는 씨없는 거봉이 좋더라</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">1kg / 100원</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">과일</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>사과</h4>
                                                <p>아침은 금사과 저녁은 독사과</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">200원 / 2kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">과일</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>블루베리</h4>
                                                <p>나는 몽골인이 될거야</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">3kg / 300원</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">과일</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>감</h4>
                                                <p>감감감감감감감감~</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">4kg / 400원</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-3.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">과일</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>바나나</h4>
                                                <p>바나나는 맛있어</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">1kg / 100원</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">과일</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>오렌지</h4>
                                                <p>오렌지오렌지오!</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">2kg / 200원</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">과일</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>앵두</h4>
                                                <p>앵두같은종인이</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">3kg / 300원</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">곡물</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>쌀</h4>
                                                <p>이천쌀은 맛있어</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">10kg / 79000원</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">견과류</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>호두</h4>
                                                <p>머리가좋아지는 호두</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">2kg / 200원</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
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