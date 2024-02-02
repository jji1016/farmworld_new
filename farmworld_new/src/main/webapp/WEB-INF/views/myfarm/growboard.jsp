<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    
    <!-- include libraries(jQuery, bootstrap) -->



<%@include file="../includes/header.jsp" %>
<style>
    .grow-info {
        background-color: #ffffff; /* 하얀색 배경 */
        padding: 20px; /* 내용과 경계 사이 여백 조절 */
        border: 1px solid #e0e0e0; /* 경계선 추가 */
        border-radius: 8px; /* 모서리 둥글게 만듦 */
    }

    .info-item {
        margin-bottom: 10px; /* 각 항목 아래 여백 추가 */
    }
    .grow-info img {
    max-width: 100%; /* 이미지의 최대 폭을 부모 요소(grow-info)의 100%로 설정 */
    height: auto;    /* 높이는 자동으로 조절되도록 설정 */
	}
	#bigbox {
    margin-right: 3%;
    margin-left: 3%;
    border: solid #81c408 3px;
    border-radius: 30px;
    min-height: 600px; /* 최소 높이를 600px로 지정 */
    height: 100% !important;
    box-shadow: 5px 5px 10px 0px #888888;
    position: relative;
}
#myimage{
	margin-top: 10%;
	width: 70%;
}
#myintro{
	margin-top: 25%;
	margin-bottom: 1%;
}
#mysearch{
	margin-top: 27%;
	position: absolute;
    bottom: 0;
    right: 0;
    border-radius: 50%;
    border: none;
    margin: 12px;
    margin-bottom: 7%;
}
#farmModify{
	position: absolute !important;
    top: 108%;
    left: 50%;
    transform: translate(-50%, -50%);
    border-radius:50%;
    border:none;
}
@media screen and (max-width: 995px) {
  #bigbox {
    flex: 0 0 auto;
    width: 90%;
    height: 70%;
	}
</style>


<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->


<!-- growInfo Start -->
<div class="container-fluid py-5">
    <div class="container py-5 text-center">
        <div class="row justify-content-center">


            
            <div class="container">
	            <div class="mx-auto text-center mb-5" style="max-width: 500px;">
	                <h1 class="display-5" id="headName">${farmvo.farm_name }</h1>
	            </div>
            </div>
            <div class="col-lg-3" style="position: relative;">	
			<div id="bigbox" class="h-100 p-3">
			<div style="position: relative;">
			    <img id="myimage" src='/resources/upload/${farmvo.image_folder_num}/${farmvo.image1}' class='card-img-top fixed-size-image' alt='농장 이미지'>
			    <a href='/myfarm/modify?farm_num=<c:out value="${vo.farm_num}"/>' id="farmModify" class="btn text-white bg-primary px-3 rounded position-absolute">수정</a>
			</div>
			
			<h6 id="myintro">${farmvo.farm_intro}</h6>
			<form id="findForm">
			    <div id="mysearch" class="input-group">
			        <input type='text' class="form-control p-3" placeholder="농장 이름 검색" name='keyword' id='keyword'>
			        <span class="input-group-text">
			            <button type="button" id="searchBtn" class="btn"><i class="fa fa-search"></i></button>
			        </span>
			    </div>
			</form>
			</div>
			</div>

            <div class="col-lg-9">
                <div id="bigbox" class="h-100 p-5">
                <form action="/myfarm/growdelete" method="post">
				<input type="hidden" name="grow_num" value='${vo.grow_num }'>
				<input type="hidden" name="user_num" id="user_num" value='${vo.user_num }'>
						<div class="col-12">
						    <!-- Grow 정보 표시 -->
						    <div class="grow-info">
						        <div class="info-item text-left"><strong>[${vo.growup_category}] ${vo.grow_title}</strong> </div>
						        <div class="info-item text-right"><strong>작성일:</strong> ${vo.grow_date}</div>
						        <c:if test="${not empty vo.image_folder_num and not empty image.image1}">
						            <div class="info-item"><img src="/resources/upload/${vo.image_folder_num}/${image.image1}"> </div>
						        </c:if>
						        
						        <c:if test="${not empty vo.image_folder_num and not empty image.image2}">
						            <div class="info-item"><img src="/resources/upload/${vo.image_folder_num}/${image.image2}"> </div>
						        </c:if>
						        
						        <c:if test="${not empty vo.image_folder_num and not empty image.image3}">
						            <div class="info-item"><img src="/resources/upload/${vo.image_folder_num}/${image.image3}"> </div>
						        </c:if>
						        <div class="info-item"> ${vo.grow_content}</div>
						    </div>
						</div>

                        <!-- 기타 필요한 정보들을 추가로 표시 -->

                    <div class="row">
					    <div class="col-2"><button class="btn btn-info"><a href='/myfarm/growmodify?grow_num=<c:out value="${vo.grow_num}"/>'>수정하기</a></button></div>
					    <div class="col-2"><button type="submit" class="btn btn-danger">삭제하기</button></div>
					    <div class="col-5"></div>
					    <div class="col-2"><button class="btn btn-warning"><a href="javascript:window.history.go(-1);">뒤로가기</a></button></div>
					</div>
					</form>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- growInfo End -->



<script type="text/javascript">
    $(document).ready(function () {
    	

        // 세션에서 user_num을 가져오기
        var sessionUserNum = <%= session.getAttribute("user_num") %>;
        var sessionType = <%= session.getAttribute("user_type") %>;
        // 입력된 user_num 가져오기
        var inputUserNum = document.getElementById("user_num").value;
	
        console.log("세션"+sessionUserNum+" jsp" +inputUserNum)
        // user_num이 일치하는지 확인
        if (sessionUserNum == inputUserNum || sessionType == 2) {
            document.querySelector('.btn-info').style.display = 'block';
            document.querySelector('.btn-danger').style.display = 'block';
        } else {
            document.querySelector('.btn-info').style.display = 'none';
            document.querySelector('.btn-danger').style.display = 'none';
        }

    	
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