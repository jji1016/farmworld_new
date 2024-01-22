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
                <div class="bg-primary h-100 p-5">
                    <div style="position: relative;">
                        <img src='/resources/upload/${farmvo.image_folder_num}/${farmvo.image1}' class='card-img-top fixed-size-image' alt='농장 이미지'>
                        <button style="position: absolute; bottom: 0; right: 0; border-radius:50%; border:none;">
                            <a href='/myfarm/modify?farm_num=<c:out value="${vo.farm_num}"/>'>수정</a>
                        </button>
                    </div>
                    
                    <h4>${farmvo.farm_intro}</h4>
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

                    </div>
					<div class="col-12"><button class="btn btn-info"><a href='/myfarm/growmodify?grow_num=<c:out value="${vo.grow_num}"/>'>수정하기</a></button></div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- growInfo End -->



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