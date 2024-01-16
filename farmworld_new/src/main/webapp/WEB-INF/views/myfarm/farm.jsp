<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@include file="../includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->


<!-- join Start -->
<div class="container-fluid py-5">
    <div class="container py-5 text-center">
        <div class="row justify-content-center">
        	
        	<div class="container">
	            <div class="mx-auto text-center mb-5" style="max-width: 500px;">
	                <h1 class="display-5" id="headName">${vo.farm_name }</h1>
	                <input type="hidden" value="${vo.user_num }" name="user_num" id="userNum">
	            </div>
            </div>
            <div class="col-lg-3">	
			<div class="bg-primary h-100 p-5">
			<img src='/resources/upload/${vo.image_folder_num}/${vo.image1}' class='card-img-top fixed-size-image' alt='농장 이미지'>
			
			<h2>${vo.farm_intro}</h2>
			<form id="searchForm" method="post" action="/myfarm/searchFarm">
			    <div class="input-group">
			        <input type='text' class="form-control p-3" placeholder="농장 이름 검색"  name='keyword' id='keyword'>
			        <span class="input-group-text">
			            <button type="button" class="btn btn-default"><i class="fa fa-search"></i></button>
			        </span>
			    </div>
			</form>
			</div>
			</div>
            
            
            <div class="col-lg-9">
                    <div class="bg-primary h-100 p-5">

                            <div class="row g-3">
                            
                                <div class="col-12">
                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">
                                </div>
                                
                            </div>

                    </div>
                </div>
            
        </div>
    </div>
</div>
<!-- join End -->

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    // 버튼 클릭 시 AJAX 호출
    $("#searchBtn").submit(function (event) {

        event.preventDefault();
        
        var formData = {
            keyword: $("#keyword").val()
        };

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/myfarm/searchFarm",
            data: JSON.stringify(formData),
            dataType: 'text',
            success: function (result) {
                if (result === "fail") {
                    alert("해당 농장은 존재하지 않습니다.");
                } else {
                    var farmNum = result;
                    window.location.href = "/myfarm/farm?farm_num=" + farmNum;
                }
            },
            error: function (xhr, textStatus, errorThrown) {
                console.error("Error: " + errorThrown);
            }
        });
    });
});


</script>
<%@include file="../includes/footer.jsp" %>