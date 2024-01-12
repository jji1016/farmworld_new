<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->    
        
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <h1 class="mb-4">Fresh fruits shop</h1>
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
                           <h4 class="fw-bold mb-3">Brocoli</h4>
                           <p class="mb-3">Category: Vegetables</p>
                           <h5 class="fw-bold mb-3">3,35 $</h5>
                           <div class="d-flex mb-4">
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star"></i>
                           </div>
                           <p class="mb-4">The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc.</p>
                           <p class="mb-4">Susp endisse ultricies nisi vel quam suscipit. Sabertooth peacock flounder; chain pickerel hatchetfish, pencilfish snailfish</p>
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
                           <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                       </div>
                       <div class="col-lg-12">
                           <nav>
                               <div class="nav nav-tabs mb-3">
                                   <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                       id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                       aria-controls="nav-about" aria-selected="true">Description</button>
                                   <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                       id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                       aria-controls="nav-mission" aria-selected="false">Reviews</button>
                               </div>
                           </nav>
                           <div class="tab-content mb-5">
                               <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                   <p>The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc. 
                                       Susp endisse ultricies nisi vel quam suscipit </p>
                                   <p>Sabertooth peacock flounder; chain pickerel hatchetfish, pencilfish snailfish filefish Antarctic 
                                       icefish goldeye aholehole trumpetfish pilot fish airbreathing catfish, electric ray sweeper.</p>
                                   <div class="px-2">
                                       <div class="row g-4">
                                           <div class="col-6">
                                               <div class="row bg-light align-items-center text-center justify-content-center py-2">
                                                   <div class="col-6">
                                                       <p class="mb-0">Weight</p>
                                                   </div>
                                                   <div class="col-6">
                                                       <p class="mb-0">1 kg</p>
                                                   </div>
                                               </div>
                                               <div class="row text-center align-items-center justify-content-center py-2">
                                                   <div class="col-6">
                                                       <p class="mb-0">Country of Origin</p>
                                                   </div>
                                                   <div class="col-6">
                                                       <p class="mb-0">Agro Farm</p>
                                                   </div>
                                               </div>
                                               <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                   <div class="col-6">
                                                       <p class="mb-0">Quality</p>
                                                   </div>
                                                   <div class="col-6">
                                                       <p class="mb-0">Organic</p>
                                                   </div>
                                               </div>
                                               <div class="row text-center align-items-center justify-content-center py-2">
                                                   <div class="col-6">
                                                       <p class="mb-0">Сheck</p>
                                                   </div>
                                                   <div class="col-6">
                                                       <p class="mb-0">Healthy</p>
                                                   </div>
                                               </div>
                                               <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                   <div class="col-6">
                                                       <p class="mb-0">Min Weight</p>
                                                   </div>
                                                   <div class="col-6">
                                                       <p class="mb-0">250 Kg</p>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                               
                               <!-- 리뷰 -->
                               <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                   <div class="d-flex">               
		                <!-- Comment List Start -->
		                <div class="mb-5">
		                    <h3 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">3 Comments</h3>
		                    <div class="d-flex mb-4">
		                        <img src="img/user.jpg" class="img-fluid" style="width: 45px; height: 45px;">
		                        <div class="ps-3">
		                            <h6><a href="">John Doe</a> <small><i>01 Jan 2045</i></small></h6>
		                            <p>Diam amet duo labore stet elitr invidunt ea clita ipsum voluptua, tempor labore
		                                accusam ipsum et no at. Kasd diam tempor rebum magna dolores sed eirmod</p>
		                            <button class="btn btn-sm btn-light">Reply</button>
		                        </div>
		                    </div>
		                    <div class="d-flex mb-4">
		                        <img src="img/user.jpg" class="img-fluid" style="width: 45px; height: 45px;">
		                        <div class="ps-3">
		                            <h6><a href="">John Doe</a> <small><i>01 Jan 2045</i></small></h6>
		                            <p>Diam amet duo labore stet elitr invidunt ea clita ipsum voluptua, tempor labore
		                                accusam ipsum et no at. Kasd diam tempor rebum magna dolores sed eirmod</p>
		                            <button class="btn btn-sm btn-light">Reply</button>
		                        </div>
		                    </div>
		                    <div class="d-flex ms-5 mb-4">
		                        <img src="img/user.jpg" class="img-fluid" style="width: 45px; height: 45px;">
		                        <div class="ps-3">
		                            <h6><a href="">John Doe</a> <small><i>01 Jan 2045</i></small></h6>
		                            <p>Diam amet duo labore stet elitr invidunt ea clita ipsum voluptua, tempor labore
		                                accusam ipsum et no at. Kasd diam tempor rebum magna dolores sed eirmod</p>
		                            <button class="btn btn-sm btn-light">Reply</button>
		                        </div>
		                    </div>
		                </div>
		                <!-- 리뷰 끝 -->                
		   			</div>
                                   <!-- 리뷰쓰는 곳 -->
	                <div class="bg-light rounded p-5">
	                    <h3 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">Leave a comment</h3>
	                    <form>
	                        <div class="row g-3">
	                            <div class="col-12 col-sm-6">
	                                <input type="text" class="form-control bg-white border-0" placeholder="Your Name" style="height: 55px;">
	                            </div>
	                            <div class="col-12 col-sm-6">
	                                <input type="email" class="form-control bg-white border-0" placeholder="Your Email" style="height: 55px;">
	                            </div>
	                            <div class="col-12">
	                                <input type="text" class="form-control bg-white border-0" placeholder="Website" style="height: 55px;">
	                            </div>
	                            <div class="col-12">
	                                <textarea class="form-control bg-white border-0" rows="5" placeholder="Comment"></textarea>
	                            </div>
	                            <div class="col-12">
	                                <button class="btn btn-primary w-100 py-3" type="submit">Leave Your Comment</button>
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