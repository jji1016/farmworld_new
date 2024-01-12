<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->

        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">게시판</h1>
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
                            <!-- 보드 -->
                            	<div class="table-responsive">
				                    <table class="table">
				                        <thead>
				                          <tr>
				                            <th scope="col">Products</th>
				                            <th scope="col">Name</th>
				                            <th scope="col">Price</th>
				                            <th scope="col">Quantity</th>
				                            <th scope="col">Total</th>
				                            <th scope="col">Handle</th>
				                          </tr>
				                        </thead>
				                        <tbody>
				                            <tr>
				                                <th scope="row">
				                                    <div class="d-flex align-items-center">
				                                        <img src="/resources/img/vegetable-item-3.png" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
				                                    </div>
				                                </th>
				                                <td>
				                                    <p class="mb-0 mt-4">Big Banana</p>
				                                </td>
				                                <td>
				                                    <p class="mb-0 mt-4">2.99 $</p>
				                                </td>
				                                <td>
				                                    <div class="input-group quantity mt-4" style="width: 100px;">
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
				                                </td>
				                                <td>
				                                    <p class="mb-0 mt-4">2.99 $</p>
				                                </td>
				                                <td>
				                                    <button class="btn btn-md rounded-circle bg-light border mt-4" >
				                                        <i class="fa fa-times text-danger"></i>
				                                    </button>
				                                </td>
				                            
				                            </tr>
				                            <tr>
				                                <th scope="row">
				                                    <div class="d-flex align-items-center">
				                                        <img src="/resources/img/vegetable-item-5.jpg" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="" alt="">
				                                    </div>
				                                </th>
				                                <td>
				                                    <p class="mb-0 mt-4">Potatoes</p>
				                                </td>
				                                <td>
				                                    <p class="mb-0 mt-4">2.99 $</p>
				                                </td>
				                                <td>
				                                    <div class="input-group quantity mt-4" style="width: 100px;">
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
				                                </td>
				                                <td>
				                                    <p class="mb-0 mt-4">2.99 $</p>
				                                </td>
				                                <td>
				                                    <button class="btn btn-md rounded-circle bg-light border mt-4" >
				                                        <i class="fa fa-times text-danger"></i>
				                                    </button>
				                                </td>
				                            </tr>
				                            <tr>
				                                <th scope="row">
				                                    <div class="d-flex align-items-center">
				                                        <img src="/resources/img/vegetable-item-2.jpg" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="" alt="">
				                                    </div>
				                                </th>
				                                <td>
				                                    <p class="mb-0 mt-4">Awesome Brocoli</p>
				                                </td>
				                                <td>
				                                    <p class="mb-0 mt-4">2.99 $</p>
				                                </td>
				                                <td>
				                                    <div class="input-group quantity mt-4" style="width: 100px;">
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
				                                </td>
				                                <td>
				                                    <p class="mb-0 mt-4">2.99 $</p>
				                                </td>
				                                <td>
				                                    <button class="btn btn-md rounded-circle bg-light border mt-4" >
				                                        <i class="fa fa-times text-danger"></i>
				                                    </button>
				                                </td>
				                            </tr>
				                        </tbody>
				                    </table>
				                </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Fruits Shop End-->
						                        
                        
<%@include file="includes/footer.jsp" %>