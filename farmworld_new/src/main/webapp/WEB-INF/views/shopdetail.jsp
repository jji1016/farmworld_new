<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->    
        
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <h1 class="mb-4">상품 상세보기</h1>
        <div class="row g-4">
            <div class="col-lg-12">
                <div class="row g-4">
                    
                    <div class="col-6"></div>
                    
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
                        <!-- 카테고리 끝 -->
                    </div>
                    
                    <div class="col-lg-9">
                    	<!-- 상세페이지 -->
                    	<div class="col-lg-8 col-xl-9">
                   <div class="row g-4">
                       <div class="col-lg-6">
                           <div class="border rounded">
                               <a href="#">
                                   <img src="/resources/img/single-item.jpg" class="img-fluid rounded" alt="Image">
                               </a>
                           </div>
                       </div>
                       <div class="col-lg-6">
                           <h4 class="fw-bold mb-3">브로콜리</h4>
                           <p class="mb-3">채소</p>
                           <h5 class="fw-bold mb-3">1kg / 100원</h5>
                           <div class="d-flex mb-4">
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star"></i>
                           </div>
                           <p class="mb-4">브로콜리는</p>
                           <p class="mb-4">맛없어!</p>
                           <div class="input-group quantity mb-5" style="width: 100px;">
                               <div class="input-group-btn">
                                   <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                       <i class="fa fa-minus"></i>
                                   </button>
                               </div>
                               <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                               <div class="input-group-btn">
                                   <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                       <i class="fa fa-plus"></i>
                                   </button>
                               </div>
                           </div>
                           <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니에 담기</a>
                       </div>
                       <div class="col-lg-12">
                           <nav>
                               <div class="nav nav-tabs mb-3">
                                   <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                       id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                       aria-controls="nav-mission" aria-selected="false">리뷰</button>
                               </div>
                           </nav>
                           <div class="tab-content mb-5">
                               
                               	
                               <!-- 리뷰 -->
                               <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                   <div class="d-flex">               
		                <!-- Comment List Start -->
		                <div class="mb-5">
		                    <h3 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">3개의 리뷰</h3>
		                    <div class="d-flex mb-4">
		                        <img src="img/user.jpg" class="img-fluid" style="width: 45px; height: 45px;">
		                        <div class="ps-3">
		                            <h6><a href="">종인이</a> <small><i>2024-01-12</i></small></h6>
		                            <p>먹고 건강해졌어요</p>
		                            <button class="btn btn-sm btn-light">답글달기</button>
		                        </div>
		                    </div>
		                    <div class="d-flex mb-4">
		                        <img src="img/user.jpg" class="img-fluid" style="width: 45px; height: 45px;">
		                        <div class="ps-3">
		                            <h6><a href="">종인2</a> <small><i>2024-01-12</i></small></h6>
		                            <p>난 브로콜리가 싫어 애기야</p>
		                            <button class="btn btn-sm btn-light">답글달기</button>
		                        </div>
		                    </div>
		                    <div class="d-flex ms-5 mb-4">
		                        <img src="img/user.jpg" class="img-fluid" style="width: 45px; height: 45px;">
		                        <div class="ps-3">
		                            <h6><a href="">종인3</a> <small><i>2024-01-12</i></small></h6>
		                            <p>야채채채</p>
		                            <button class="btn btn-sm btn-light">답글달기</button>
		                        </div>
		                    </div>
		                </div>
		                <!-- 리뷰 끝 -->                
		   			</div>
                                   <!-- 리뷰쓰는 곳 -->
	                <div class="bg-light rounded p-5">
	                    <h3 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">리뷰쓰기</h3>
	                    <form>
	                        <div class="row g-3">
	                            <div class="col-12 col-sm-6">
	                                <input type="text" class="form-control bg-white border-0" placeholder="이름" style="height: 55px;">
	                            </div>
	                            <div class="col-12 col-sm-6">
	                                <input type="email" class="form-control bg-white border-0" placeholder="이메일" style="height: 55px;">
	                            </div>
	                            <div class="col-12">
	                                <input type="text" class="form-control bg-white border-0" placeholder="구매시기" style="height: 55px;">
	                            </div>
	                            <div class="col-12">
	                                <textarea class="form-control bg-white border-0" rows="5" placeholder="내용"></textarea>
	                            </div>
	                            <div class="col-12">
	                                <button class="btn btn-primary w-100 py-3" type="submit">등록하기</button>
	                            </div>
	                        </div>
	                    </form>
	                </div>
              			<!-- 리뷰쓰는 곳 끝 -->
                                </div>										
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

						                        
                        
<%@include file="includes/footer.jsp" %>