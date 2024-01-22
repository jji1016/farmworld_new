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

	            </div>
            </div>
            <div class="col-lg-3" style="position: relative;">	
			<div class="bg-primary h-100 p-5">
			<div style="position: relative;">
			    <img src='/resources/upload/${vo.image_folder_num}/${vo.image1}' class='card-img-top fixed-size-image' alt='농장 이미지'>
			    <button style="position: absolute; bottom: 0; right: 0; border-radius:50%; border:none;"><a href='/myfarm/modify?farm_num=<c:out value="${vo.farm_num}"/>'>수정</a></button>
			</div>
			
			<h4>${vo.farm_intro}</h4>
			<form id="findForm" style="position: absolute; bottom: 4%;">
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
								<form method="POST" action="/myfarm/growregister" enctype="multipart/form-data">
								<input type="hidden" value="${vo.user_num }" name="user_num" id="userNum">
	                			<input type="hidden" value="${vo.farm_num }" name="farm_num" id="farmNum">
                                <div class="col-12">
								<input type="text" class="form-control p-3" name="grow_title" placeholder="성장일기 제목" required="required">
                                </div>
                                <div class="col-12">
								<input type="text" class="form-control p-3" name="growup_category" placeholder="카테고리" required>
                                </div>
                                <div class="col-12" style="background-color:white;">
                                <textarea name="grow_content" id="summernote" maxlength="10000" cols="30" rows="5" placeholder="내용을 입력해주세요" class="with-border" ></textarea>
                                </div>
                                <div class="col-12">
                                	이미지 업로드(최소 1개)
                               	</div>
                               	<div class="col-4">
				                <input type="file" name="files" id="image1" class="form-control-file" onchange="previewImage(this, 'imagePreview1')" required="required">
				                </div><div id="imagePreview1" class="col-8"></div>
				                <div class="col-4">
				                <input type="file" name="files" id="image2" class="form-control-file" onchange="previewImage(this, 'imagePreview2')">
				                </div><div id="imagePreview2" class="col-8"></div>
				                <div class="col-4">
				                <input type="file" name="files" id="image3" class="form-control-file" onchange="previewImage(this, 'imagePreview3')">
                                </div><div id="imagePreview3" class="col-8"></div>
                                
                                
                                
                                <div class="col-12">
                                <button type="submit" class="btn btn-default">성장일기 등록</button>
                                </div>
                                </form>

                                
                            </div>

                    </div>
                </div>
            
        </div>
    </div>
</div>
<!-- join End -->


<script type="text/javascript">
    $(document).ready(function () {
            $('#summernote').summernote({
                codeviewFilter: false, // 코드 보기 필터 비활성화
                codeviewIframeFilter: false, // 코드 보기 iframe 필터 비활성화

                height: 500, // 에디터 높이
                minHeight: null, // 최소 높이
                maxHeight: null, // 최대 높이
                focus: true, // 에디터 로딩 후 포커스 설정
                lang: 'ko-KR', // 언어 설정 (한국어)

                toolbar: [
                    ['style', ['style']], // 글자 스타일 설정 옵션
                    ['fontsize', ['fontsize']], // 글꼴 크기 설정 옵션
                    ['font', ['bold', 'underline', 'clear']], // 글자 굵게, 밑줄, 포맷 제거 옵션
                    ['color', ['color']], // 글자 색상 설정 옵션
                    ['table', ['table']], // 테이블 삽입 옵션
                    ['para', ['ul', 'ol', 'paragraph']], // 문단 스타일, 순서 없는 목록, 순서 있는 목록 옵션
                    ['view', ['codeview',]], // 코드 보기, 전체 화면, 도움말 옵션
                ],

                fontSizes: [
                    '8', '9', '10', '11', '12', '14', '16', '18',
                    '20', '22', '24', '28', '30', '36', '50', '72',
                ], // 글꼴 크기 옵션

                styleTags: [
                    'p',  // 일반 문단 스타일 옵션
                    {
                        title: 'Blockquote',
                        tag: 'blockquote',
                        className: 'blockquote',
                        value: 'blockquote',
                    },  // 인용구 스타일 옵션
                    'pre',  // 코드 단락 스타일 옵션
                    {
                        title: 'code_light',
                        tag: 'pre',
                        className: 'code_light',
                        value: 'pre',
                    },  // 밝은 코드 스타일 옵션
                    {
                        title: 'code_dark',
                        tag: 'pre',
                        className: 'code_dark',
                        value: 'pre',
                    },  // 어두운 코드 스타일 옵션
                    'h1', 'h2', 'h3', 'h4', 'h5', 'h6',  // 제목 스타일 옵션
                ],

            })
        })
        
    function previewImage(input, previewId) {
        var file = input.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var preview = document.getElementById(previewId);
                preview.innerHTML = '<img src="' + e.target.result + '" alt="Image Preview" class="img-fluid">';
            };
            reader.readAsDataURL(file);
        }
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
</script>
<%@include file="../includes/footer.jsp" %>