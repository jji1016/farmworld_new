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
	    <div class="row col-lg-12">
	    	<div class="col-xl-3">
	    		<h1 class="mb-4">작물샵</h1>
    		</div>
    		<div id="searchbox" class="col-xl-8">
    			<div class="input-group w-100 mx-auto d-flex">
    				<select id="type" name="type" class="form-select-sm bg-light input-group-text p-3">
    					<option value="">전체</option>
    					<option value="">상품명</option>
					</select>
					<input type='text' id="searchInput"  class="form-control p-3" placeholder="keywords"  name='keyword'>
					<span id="searchBtn" class="input-group-text p-3"><button class="btn btn-default"><i class="fa fa-search"></i></button></span>
				</div>	
   			</div>
		</div>
		<br/>
	    
	    <div class="row g-4">
	        <div class="col-lg-12">
	            <div class="row g-4">
	            <!-- 카테고리 -->
	               <div class="col-lg-3">
	                   <div class="row g-4">
	                       <div class="col-lg-12">
	                           <div class="mb-3">
	                           
	                               <h4>카테고리</h4>
	                               <ul id="categories" class="list-unstyled fruite-categorie">
            </ul>
                               </div>
                           </div>
                       </div>
                       <!-- 상품등록하기 버튼을 카테고리가 끝나는 부분 아래로 이동 -->
                       <div class="col-lg-12">
                           <a href="/goods" class="btn btn-primary">상품등록하기</a>
                       </div>
                   </div>
                   <!-- 카테고리 끝 -->
                    
                    <div class="col-lg-9">
                            <!-- 추천상품 -->
                            	<h4 id="f">추천 상품</h4>
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
                                <div id="goodsList" class="row g-4 justify-content-center">
                                	
                                </div>
                   			</div>
                        </div>
                        <!-- 상품 끝 -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->

<script src="/resources/js/shop/shop.js" type="text/javascript"></script>
<%@include file="includes/footer.jsp" %>
<style>
    
    .fruite-categorie  {
         padding-right: 70px; 
         
    }
    
	
	

</style>