<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>

<div class="container-fluid py-5">
    <!-- Your existing HTML code for billing details form -->
</div>

<div class="container-fluid py-5">
    <div class="container py-5">
        <h1 class="mb-4 title-name">상품등록하기</h1>
        <div id="goodsForm">
        	<!-- Product Information Form -->
	        <div class="mb-3">
	            <label for="productName" class="form-label">이름</label>
	            <input type="text" class="form-control" id="productName" name="productName" required>
	        </div>
	
	        <div class="mb-3">
	            <label for="productType" class="form-label">작물</label>
	            <select class="form-control" id="productType" name="productType" required>
	                <option value="과일">과일</option>
	                <option value="야채">야채</option>
	                <option value="견과류">견과류</option>
	                <option value="곡물">곡물</option>
	                <option value="씨앗">씨앗</option>
	                <option value="농기구">농기구</option>
	            </select>
	        </div>
	
	        <div class="mb-3">
	            <label for="weightPrice" class="form-label">가격</label>
	            <input type="text" class="form-control" id="weightPrice" name="weightPrice" required placeholder="- 1kg당 가격을 작성해주세요.">
	        </div>
	
	        <div class="mb-3">
	            <label for="description" class="form-label">설명</label>
	            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
	        </div>
	
	        <div class="mb-3">
	            <label for="origin" class="form-label">원산지</label>
	            <input type="text" class="form-control" id="origin" name="origin" required>
	        </div>
	
	        <div class="mb-3">
	            <label for="expiryDate" class="form-label">유통기한</label>
	            <input type="text" class="form-control" id="expiryDate" name="expiryDate" required>
	        </div>
	
	        <!-- Photo Upload -->
	        <form id="fileForm" enctype="multipart/form-data">
	        	<div class="mb-3">
		            <label for="photo" class="form-label">사진등록</label>
		            <input type="file" class="form-control" id="photo" name="photo" accept="image/*" required>
		        </div>
	        </form>
        </div>
        
        <button type="button" class="btn btn-primary" id="insertGoods" onclick="insertGoods()">상품 등록하기</button>
		<button type="button" class="btn btn-primary" id="modifyGoods" onclick="insertGoods()">상품 수정하기</button>
    </div>
</div>

<script>
var paramData = new FormData();

$(document).ready(function() {
	init();
});

function init(){
	var urlData=getQueryStringObject();
	if(!isEmptyObj(urlData)){ // 수정의 경우

		$('.title-name').text('상품수정하기');
		$('#insertGoods').hide();
		$('#modifyGoods').show();
		paramData.set("goods_num", urlData.goods_num);

		var goodsData = {goods_num : urlData.goods_num}
		ajaxCall("shop-detail","POST", goodsData, function(reData) {
			console.log(reData);
			var shopDetail = reData.shopDetail;

			$('#productName').val(shopDetail.goods_title);
			$('#productType option:selected').val(shopDetail.goods_category);
			$('#weightPrice').val(shopDetail.goods_price);
			$('#description').val(shopDetail.goods_content);
			$('#origin').val(shopDetail.goods_inventory);
			$('#expiryDate').val(shopDetail.goods_view);
		});

	}else{ // 등록의 경우
		$('.title-name').text('상품등록하기');
		$('#insertGoods').show();
		$('#modifyGoods').hide();
	}
};

function insertGoods() {
	// 입력 값 검사
	var msg = validation();
	
	if(msg == "") {
		$.ajax({
		    type:"POST",
		    url: "/saveGoods",
		    processData: false,
		    contentType: false,
		    dataType : "json",
		    data: paramData,
		    success: function(rs) {
		    	if(rs.imageChk == "N") {
		      		alert("이미지 저장에 실패하였습니다.");
		      	} else if(rs.goodsChk == "N") {
		    	  	alert("상품 등록에 실패하였습니다.");
		      	} else {
		      		if(!alert("상품을 성공적으로 등록하였습니다.")) {
		      			location.href = "../shopmain";
	      			}
	      		}
	    	},
		    error: function(err) {
		      console.log("err:", err)
		    }
	    });
	} else {
		alert(msg);
	}
}

function validation() {
	//var a = 2* 1024*1024;
	var getGoodsData	= $("#goodsForm input[type=text]");		// input text 값 가져오기
	var fileData		= $("#photo")[0].files;					// 업로드한 파일
	var category		= $("#productType").val();				// 작물
	var content			= $("#description").val();				// 설명
	var inputList		= ["이름", "무게/가격", "원산지" , "유통기한"];	// input 명 리스트
	var msg				= "";									// 메시지
	
	
	for(var i=0; i<getGoodsData.length; i++) {
		console.log(getGoodsData[i]);
		
		if(getGoodsData[i].value == "") {
			msg = inputList[i] + " 을(를) 입력해주세요.";
			i = getGoodsData.length;
		} else if(i!=0) {
			console.log(getGoodsData[i].value+"g"+i);
			if(i==1 && $.isNumeric(getGoodsData[i].value)){
				
			}
			else if(i==2 && !$.isNumeric(getGoodsData[i].value)){
				
			}
			else if(i==3 && $.isNumeric(getGoodsData[i].value)){
				
			}else{
				msg = inputList[i] + " 을(를) 숫자로 입력해주세요.";
				i = getGoodsData.length;
			}
		}
	}
	
	if(msg == "") {
		if(content == "") {
			msg = "설명을 입력해주세요.";
		} else if($("#photo")[0].files.length == "0") {
			msg = "사진을 등록해주세요."
		} else {
			paramData.append("goods_category", category);
			paramData.append("goods_title", getGoodsData[0].value);
			paramData.append("goods_content", content);
			paramData.append("goods_price", getGoodsData[1].value);
			paramData.append("goods_inventory", getGoodsData[2].value);
			paramData.append("goods_view", getGoodsData[3].value);
			paramData.append("file", fileData[0]);
		}
	}
	
	return msg;
}

function isEmptyObj(obj)  {
	if(obj.constructor === Object
			&& Object.keys(obj).length === 0)  {
		return true;
	}

	return false;
}

function getQueryStringObject() {
	var a = window.location.search.substr(1).split('&');
	if (a == "") return {};
	var b = {};
	for (var i = 0; i < a.length; ++i) {
		var p = a[i].split('=', 2);
		if (p.length == 1)
			b[p[0]] = "";
		else
			b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
	}
	return b;
}


function ajaxCall(url, type, paramData, callback){
	$.ajax({
		url: url,
		type: type,
		dataType : "json",
		data: paramData,
		success:function(data){
			console.log(data);
			return callback(data);

		},
		error: function(e) {
			console.log(e);
			return callback(e);

		}
	});
}
</script>

<%@ include file="includes/footer.jsp" %>