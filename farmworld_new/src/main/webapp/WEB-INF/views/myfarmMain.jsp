<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->

        
<!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">Fresh fruits shop</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                            <div class="col-6"></div>
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
                        </div>
                        <div class="row g-4">
                        
                        <!-- 내 농장 바로가기 -->
                            <div class="col-lg-3">
                                <div class="col-md-6 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
			                        <div class="team-item border-top border-5 border-primary rounded shadow overflow-hidden">
			                            <div class="text-center p-4">
			                                <img class="img-fluid rounded-circle mb-4" src="/resources/img/team-1.jpg" alt="">
			                                <h5 class="fw-bold mb-1">Full Name</h5>
			                                <small>Designation</small>
			                            </div>
			                            <div class="d-flex justify-content-center bg-primary p-3">
			                                <a class="btn btn-square text-primary bg-white m-1" href=""><i class="fab fa-facebook-f"></i></a>
			                                <a class="btn btn-square text-primary bg-white m-1" href=""><i class="fab fa-twitter"></i></a>
			                                <a class="btn btn-square text-primary bg-white m-1" href=""><i class="fab fa-instagram"></i></a>
			                            </div>
			                        </div>
			                    </div>
                            </div>
                        <!-- 내 농장 바로가기 끝 -->
                        
                        <!-- 인기농장  -->
                            <div class="col-lg-9">
                            
                            	<div class="mx-auto text-center mb-5" style="max-width: 500px;">
					                <h6 class="text-primary text-uppercase">The Team</h6>
					                <h1 class="display-5">인기 농장</h1>
					            </div>
            
				                
                                <div class="row g-4 justify-content-center">
                                    
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="row g-0">
						                        <div class="col-10">
						                            <div class="position-relative">
						                                <img class="img-fluid w-100" src="/resources/img/team-2.jpg" alt="">
						                                <div class="position-absolute start-0 bottom-0 w-100 py-3 px-4" style="background: rgba(52, 173, 84, .85);">
						                                    <h4 class="text-white">Farmer Name</h4>
						                                    <span class="text-white">Designation</span>
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col-2">
						                            <div class="h-100 d-flex flex-column align-items-center justify-content-around bg-secondary py-5">
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-twitter text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-facebook-f text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-linkedin-in text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-instagram text-secondary"></i></a>
						                            </div>
						                        </div>
                    						</div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="row g-0">
						                        <div class="col-10">
						                            <div class="position-relative">
						                                <img class="img-fluid w-100" src="/resources/img/team-2.jpg" alt="">
						                                <div class="position-absolute start-0 bottom-0 w-100 py-3 px-4" style="background: rgba(52, 173, 84, .85);">
						                                    <h4 class="text-white">Farmer Name</h4>
						                                    <span class="text-white">Designation</span>
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col-2">
						                            <div class="h-100 d-flex flex-column align-items-center justify-content-around bg-secondary py-5">
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-twitter text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-facebook-f text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-linkedin-in text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-instagram text-secondary"></i></a>
						                            </div>
						                        </div>
                    						</div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="row g-0">
						                        <div class="col-10">
						                            <div class="position-relative">
						                                <img class="img-fluid w-100" src="/resources/img/team-2.jpg" alt="">
						                                <div class="position-absolute start-0 bottom-0 w-100 py-3 px-4" style="background: rgba(52, 173, 84, .85);">
						                                    <h4 class="text-white">Farmer Name</h4>
						                                    <span class="text-white">Designation</span>
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col-2">
						                            <div class="h-100 d-flex flex-column align-items-center justify-content-around bg-secondary py-5">
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-twitter text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-facebook-f text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-linkedin-in text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-instagram text-secondary"></i></a>
						                            </div>
						                        </div>
                    						</div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="row g-0">
						                        <div class="col-10">
						                            <div class="position-relative">
						                                <img class="img-fluid w-100" src="/resources/img/team-2.jpg" alt="">
						                                <div class="position-absolute start-0 bottom-0 w-100 py-3 px-4" style="background: rgba(52, 173, 84, .85);">
						                                    <h4 class="text-white">Farmer Name</h4>
						                                    <span class="text-white">Designation</span>
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col-2">
						                            <div class="h-100 d-flex flex-column align-items-center justify-content-around bg-secondary py-5">
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-twitter text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-facebook-f text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-linkedin-in text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-instagram text-secondary"></i></a>
						                            </div>
						                        </div>
                    						</div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="row g-0">
						                        <div class="col-10">
						                            <div class="position-relative">
						                                <img class="img-fluid w-100" src="/resources/img/team-2.jpg" alt="">
						                                <div class="position-absolute start-0 bottom-0 w-100 py-3 px-4" style="background: rgba(52, 173, 84, .85);">
						                                    <h4 class="text-white">Farmer Name</h4>
						                                    <span class="text-white">Designation</span>
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col-2">
						                            <div class="h-100 d-flex flex-column align-items-center justify-content-around bg-secondary py-5">
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-twitter text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-facebook-f text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-linkedin-in text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-instagram text-secondary"></i></a>
						                            </div>
						                        </div>
                    						</div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="row g-0">
						                        <div class="col-10">
						                            <div class="position-relative">
						                                <img class="img-fluid w-100" src="/resources/img/team-2.jpg" alt="">
						                                <div class="position-absolute start-0 bottom-0 w-100 py-3 px-4" style="background: rgba(52, 173, 84, .85);">
						                                    <h4 class="text-white">Farmer Name</h4>
						                                    <span class="text-white">Designation</span>
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col-2">
						                            <div class="h-100 d-flex flex-column align-items-center justify-content-around bg-secondary py-5">
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-twitter text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-facebook-f text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-linkedin-in text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-instagram text-secondary"></i></a>
						                            </div>
						                        </div>
                    						</div>
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