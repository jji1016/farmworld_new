<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    
    <!-- include libraries(jQuery, bootstrap) -->



<%@include file="../includes/header.jsp" %>


<link rel="stylesheet" href="/resources/editor/summernote-lite.css">
<script src="/resources/editor/summernote-ko-KR.js"> </script>
<script src="/resources/editor/summernote-lite.js"> </script>	
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
	                <input type="hidden" value="${vo.farm_num }" name="farm_num" id="farmNum">
	            </div>
            </div>
            <div class="col-lg-3">	
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

                                
                                <div class="col-12">
                                <textarea name="BOARDCONT" id="BOARDCONT" maxlength="10000" cols="30" rows="5" placeholder="내용을 입력해주세요" class="with-border"></textarea>
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


<script type="text/javascript">
    $(document).ready(function () {
    	$('#BOARDCONT').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대3000자까지 쓸 수 있습니다'	,//placeholder 설정
			  toolbar: [
					    // [groupName, [list of button]]
					    ['fontname', ['fontname']],
					    ['fontsize', ['fontsize']],
					    ['color', ['color']],
					    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']]
					  ],
					fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
					fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		          
		});

    	
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