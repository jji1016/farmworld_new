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
    width: 25%;
    height: 70%;
	}
</style>

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
			<div id="bigbox" class="h-100 p-5">
			<div style="position: relative;">
			    <img id="myimage" src='/resources/upload/${vo.image_folder_num}/${vo.image1}' class='card-img-top fixed-size-image' alt='농장 이미지'>
			    <a href='/myfarm/modify?farm_num=<c:out value="${vo.farm_num}"/>' id="farmModify" class="btn text-white bg-primary px-3 rounded position-absolute">수정</a>
			</div>
			
			<h6 id="myintro">${vo.farm_intro}</h6>
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
        <form method="POST" action="/myfarm/growregister" enctype="multipart/form-data">
            <input type="hidden" value="${vo.user_num}" name="user_num" id="userNum">
            <input type="hidden" value="${vo.farm_num}" name="farm_num" id="farmNum">
            <table class="table createTable">
                <tbody>
                    <tr>
                        <td>
                            <label for="grow_title">성장일기 제목</label>
                        </td>
                        <td>
                            <input type="text" class="form-control p-3" name="grow_title" id="grow_title" required="required" placeholder="성장일기 제목">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="growup_category">카테고리</label>
                        </td>
                        <td>
                            <input type="text" class="form-control p-3" name="growup_category" id="growup_category" required placeholder="카테고리">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="summernote">내용</label>
                        </td>
                        <td>
                            <textarea name="grow_content" id="summernote" maxlength="10000" cols="30" rows="5" placeholder="내용을 입력해주세요" class="with-border"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>이미지 업로드(최소 1개)</label>
                        </td>
                        <td>
                            <div class="row">
                                <div class="col-4">
                                    <input type="file" name="files" id="image1" class="form-control-file" accept=".png, .jpg" onchange="previewImage(this, 'imagePreview1')" required="required">
                                    <div id="imagePreview1"></div>
                                </div>
                                <div class="col-4" style="display:none;">
                                    <input type="file" name="files" id="image2" class="form-control-file" accept=".png, .jpg" onchange="previewImage(this, 'imagePreview2')">
                                    <div id="imagePreview2"></div>
                                </div>
                                <div class="col-4" style="display:none;">
                                    <input type="file" name="files" id="image3" class="form-control-file" accept=".png, .jpg" onchange="previewImage(this, 'imagePreview3')">
                                    <div id="imagePreview3"></div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button type="submit" class="btn btn-default">성장일기 등록</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
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

            });
        });
        
    function previewImage(input, previewId) {
    	const maxFileSize = 2 * 1024 * 1024; // 2MB
        const fileInput = input.files[0];

        var preview = document.getElementById(previewId);
        preview.innerHTML = ''; // 미리보기를 초기화

        if (input.files && input.files[0]) {
        	if (fileInput.size > maxFileSize) {
                alert("파일 크기는 2MB를 초과할 수 없습니다.");
                input.value = ""; // 파일 선택 초기화
                document.getElementById(previewId).innerHTML = ""; // 미리보기 초기화
            }else{
            var reader = new FileReader();

            reader.onload = function (e) {
                var img = document.createElement('img');
                img.src = e.target.result;
                img.className = 'img-thumbnail rounded';
                preview.appendChild(img);

                // 현재 input에 대한 id와 번호를 추출
                var currentInputId = input.id;
                var currentNumber = parseInt(currentInputId.charAt(currentInputId.length - 1));

                // 다음 input에 파일이 있으면 보이도록 설정
                var nextInputNumber = currentNumber + 1;
                var nextInputId = 'image' + nextInputNumber;

                var nextInput = document.getElementById(nextInputId);
                if (nextInput) {
                    nextInput.parentElement.style.display = 'block';
                }
            };

            reader.readAsDataURL(input.files[0]); // 파일을 읽어 data URL로 변환
        }
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