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
            <div class="col-lg-3" style="position: relative;">	
			<div class="bg-primary h-100 p-5">
			<div style="position: relative;">
			    <img src='/resources/upload/${vo.image_folder_num}/${vo.image1}' class='card-img-top fixed-size-image' alt='농장 이미지'>
			    <button style="position: absolute; bottom: 0; right: 0; border-radius:50%; border:none;"><a href='/myfarm/modify?farm_num=<c:out value="${vo.farm_num}"/>'>수정</a></button>
			</div>
			
			<h4>${vo.farm_intro}</h4>
			<form id="findForm">
			    <div class="input-group">
			        <input type='text' class="form-control p-3" placeholder="농장 이름 검색" name='keyword' id='keyword'>
			        <span class="input-group-text">
			            <button type="button" id="searchBtn" class="btn"><i class="fa fa-search"></i></button>
			        </span>
			    </div>
			</form>
			</div>
			</div>
            
            
            <div class="col-lg-9">
                    <div class="bg-primary h-100 p-5">

                            <div class="row g-3">

                                <div class="col-4">
                                <a href="/myfarm/farm?farm_num=<c:out value='${vo.farm_num}'/>"style="color:black;">HOME</a>
                                </div>
                                <div class="col-4">
                                <a href="/myfarm/growlist?farm_num=<c:out value='${vo.farm_num}'/>" style="color:black;">성장일기</a>
                                </div>
                                <div class="col-4">
                                <a href="/myfarm/goodslist?farm_num=<c:out value='${vo.farm_num}'/>" style="color:black;">판매상품</a>
                                </div>
                                
                                
                                <div class="row g-4 justify-content-center" id="growupinput1">
                                    

                                    
   
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
    	
        $("#keyword").keypress(function(event) {
            if (event.which === 13) {
                // 엔터 키가 눌렸을 때 실행할 코드
                event.preventDefault();
                $("#searchBtn").click();
            }
        });

        $("#searchBtn").click(function () {
            // AJAX 호출
					var keyword = $("#findForm").find("input[name='keyword']").val();
            		console.log($("#keyword").val());
            $.ajax({
            	type: "POST",
            	contentType: "application/x-www-form-urlencoded",
                url: "/myfarm/searchFarm",
                data: {
                	keyword: keyword
                	},
                dataType: 'json',
                success: function (result) {
                    if (result === "fail") {
                        alert("해당 농장은 존재하지 않습니다.");
                    } else {
                        var farmNum = result;
                        window.location.href = "/myfarm/farm?farm_num=" + farmNum;
                    }
                },
                error: function (xhr, textStatus, errorThrown) {
                    // 서버에서 에러 응답이 왔을 때의 처리
                    if (xhr.status === 400) {
                        alert("해당 농장은 존재하지 않습니다.");
                    } else {
                        console.error("Error: " + errorThrown);
                    }
                }
            });
        });
    });
</script>
<%@include file="../includes/footer.jsp" %>