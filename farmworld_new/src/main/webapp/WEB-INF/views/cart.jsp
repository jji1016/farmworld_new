<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->
<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<div class="row col-lg-12">
	    	<div class="col-xl-3">
	    		<h1 class="mb-4">장바구니</h1>
    		</div>
    		<div id="searchbox" class="col-xl-8">
    			<div class="input-group w-100 mx-auto d-flex">
    				<select id="type" name="type" class="border-0 form-select-sm bg-light input-group-text p-3">
    					<option value="">전체</option>
    					<option value="">상품명</option>
					</select>
					<input type="search" class="form-control p-3" id="searchKeyword" placeholder="keywords" aria-describedby="search-icon-1">
					<span id="search-icon-1" class="input-group-text p-3" onclick="kewordSearch()"><button class="btn btn-default"><i class="fa fa-search"></i></button></span>
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
									<h4>Categories</h4>
									<ul class="list-unstyled fruite-categorie" id="categoryHtml">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- 카테고리 끝 -->
					<div class="col-lg-9">
						<!-- 보드 -->
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">상품</th>
										<th scope="col">이름</th>
										<th scope="col">가격</th>
										<th scope="col">수량</th>
										<th scope="col">금액</th>
										<th scope="col">상품삭제</th>
									</tr>
								</thead>
								<tbody id="bodyHtml"></tbody>
							</table>
						</div>
						<button class="btn btn-md bg-light border mt-4" onclick="buy()" style="margin-left: 45%;">
							구매하기
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
    <!-- Fruits Shop End-->
    
    <script>
	    $(document).ready(function() {
	        init();
	    });
	    
	 	// 검색영역에서 엔터키 누를시
	    $("#searchKeyword").on("keyup", function(key){
	        
	    });
	 	
	 	// 초기화 되었을 경우
	 	$("#searchKeyword").on("propertychange change keyup paste input", function(key) {
	 		if(key.keyCode==13) {
	 			kewordSearch();
	 		} else {
	 			if($("#searchKeyword").val() == "") kewordSearch();
	 		}
	 	});
	    
	    var sendData = {
	    	"keywords": "",
	    	"category": ""
	    };
	    
	    function buy() {
	    	location.href = "/chackout";
	    }
	    
	    function chagneCnt(state, id, cnt) {
	    	if(state == "1" && cnt == "1") state = "0"; 
	    	
	    	$.ajax({
			    type:"POST",
			    url: "/changeCart",
			    contentType:"application/json;charset=UTF-8",
			    dataType : "json",
			    data: JSON.stringify({"state": state, "id": id}),
			    success: function(rs) {
			    	var msg = "";
			      	if(rs.result == "Y") {
			      		msg = "변경에 성공하였습니다.";
			      	} else {
			      		msg = "변경에 실패하였습니다.";
			      	}
			      	
			      	init();
		    	},
			    error: function(err) {
			      console.log("err:", err)
			    }
		    });
	    }
	    
	    function kewordSearch() {
	    	sendData.keywords = $("#searchKeyword").val();
	    	init();
	    }
	    
	    function search(category) {
	    	if(category == "전체보기") category = "";
	    	
	    	sendData.category = category;
	    	init();
	    }
	    
	    function init() {
	    	$.ajax({
			    type:"POST",
			    url: "/cartData",
			    contentType:"application/json;charset=UTF-8",
			    dataType : "json",
			    data: JSON.stringify(sendData),
			    success: function(rs) {
			    	if(rs.result == "Y") {
			    		var html = '';
				    	for(var i=0; i<rs.cntList.length; i++) {
				    		html += '<li>';
				    		html += '	<div class="d-flex justify-content-between fruite-name" onclick="search(\''+ rs.cntList[i].category +'\');">';
				    		html += '		<a href="javascript:void(0);" class="category-btn"><i class="fas fa-apple-alt me-2"></i>'+ rs.cntList[i].category +'</a>';
				    		html += '		<span>('+ rs.cntList[i].cnt +')</span>';
				    		html += '	</div>';
				    		html += '</li>';
				    	}
				    	
				    	$("#categoryHtml").html(html);
				    	
				    	html = '';
				    	
				    	for(var i=0; i<rs.cartList.length; i++) {
				    		html += '<tr>';
				    		html += '	<th scope="row">';
				    		html += '		<div class="d-flex align-items-center">';
				    		html += '			<img src="/resources/'+ rs.cartList[i].image1 +'" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">';
				    		html += '		</div>';
				    		html += '	</th>';
				    		html += '	<td>';
				    		html += '		<p class="mb-0 mt-4">'+ rs.cartList[i].goods_title +'</p>';
				    		html += '	</td>';
				    		html += '	<td>';
				    		html += '		<p class="mb-0 mt-4">'+ rs.cartList[i].make_price +' 원</p>';
				    		html += '	</td>';
				    		html += '	<td>';
				    		html += '		<div class="input-group quantity mt-4" style="width: 100px;">';
				    		html += '			<div class="input-group-btn">';
				    		html += '				<button class="btn btn-sm btn-minus rounded-circle bg-light border" onclick="chagneCnt(\'1\', \''+ rs.cartList[i].cart_num +'\', \''+ rs.cartList[i].count +'\')">';
				    		html += '					<i class="fa fa-minus"></i>';
				    		html += '				</button>';
				    		html += '			</div>';
				    		html += '			<input type="text" class="form-control form-control-sm text-center border-0" value="'+ rs.cartList[i].count +'" readonly="readonly">';
				    		html += '			<div class="input-group-btn">';
				    		html += '				<button class="btn btn-sm btn-plus rounded-circle bg-light border" onclick="chagneCnt(\'2\', \''+ rs.cartList[i].cart_num +'\', \''+ rs.cartList[i].count +'\')">';
				    		html += '					<i class="fa fa-plus"></i>';
				    		html += '				</button>';
				    		html += '			</div>';
				    		html += '		</div>';
				    		html += '	</td>';
				    		html += '	<td>';
				    		html += '		<p class="mb-0 mt-4">'+ rs.cartList[i].total_amt +' $</p>';
				    		html += '	</td>';
				    		html += '	<td>';
				    		html += '		<button class="btn btn-md rounded-circle bg-light border mt-4"  onclick="chagneCnt(\'0\', \''+ rs.cartList[i].cart_num +'\', \''+ rs.cartList[i].count +'\')">';
				    		html += '			<i class="fa fa-times text-danger"></i>';
				    		html += '		</button>';
				    		html += '	</td>';
				    		html += '</tr>';
				    	}
				    	
				    	$("#bodyHtml").html(html);
			    	} else {
			    		if(!alert("오류가 발생하였습니다.")) {
			      			location.href = "/";
		      			}
			    	}
		    	},
			    error: function(err) {
			      console.log("err:", err)
			    }
		    });
	    }
    </script>
<%@include file="includes/footer.jsp" %>

<style>
    .fruite-categorie  {
         padding-right: 70px; 
    }
</style>