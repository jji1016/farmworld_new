<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style type="text/css">
#leftPart{
	width: 30%;
	height: 60%;
	text-align: -webkit-match-parent;
}
.col-lg-3 {
    flex: 0 0 auto;
    display: table-cell;
}
#boxsize {
    flex: 0 0 auto;
    width: 100%;
    padding : 2%;
}
#leftbox {
    width: 25%;
    height: 100%;
}
#img {
    max-width: 100%;
    height: 15%;
}
#rightPart{
	width: 70%;
	height: 60%;
	text-align: -webkit-match-parent;
}
#mpg_frm{
	padding: 4%;
    display: grid;
    
}
.book_section form {
	box-shadow: 0 0.5rem 1rem rgba(0,0,0,.15) !important;
	border-top: 1px solid #dee2e6 !important;
	border-radius: 10px !important;
	border-width: 5px !important;
	border-color: #81c408 !important;
	display: block;
	box-sizing: border-box;
	padding: 5%;
    padding-bottom: 10%;
}
.form-row{
	width: 100%;
}
.book_section form .form-control {
    width: 100%;
    background-color: transparent;
    border: 1px solid #88b44e;
    height: 12%;
    outline: none;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-radius: 5px;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    display: block;
}
.book_section form button.btn {
    background-color: #88b44e;
    color: #ffffff;
    padding: 2% 4%;
    border-radius: 5px;
    margin-top: 2%;
    text-transform: uppercase;
   	float : right;
}
.my_mod_Label{
	width: 25% !important;
    margin: auto;
}
.my_mod_input{
	width: 75% !important;
}
.post_input{
	width: 35% !important;
    margin-right: 7%;
}

</style>

</head>


<%@include file="../includes/header.jsp" %>

    
        <!-- 상단 -->
        <div class="container-fluid testimonial py-5">
            <div class="container py-5">
                <div class="testimonial-header text-center">
                	<div class="container-xxl py-5">
            			<div class="container px-lg-5">
                			<div class="section-title position-relative text-center mx-auto mb-5 pb-4 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                			</div>
                			<div class="row g-4">
	                			<form action="/mypage/modify" method="post" enctype="multipart/form-data" id="frm">
		                			<div class="team-item border-top border-5 border-primary rounded shadow overflow-hidden" id="mpg_frm">
		                				<table>
		                						<h2>My <span>Page</span></h2>
	                						<tr>
		                					<th id="leftbox">
			                					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
				                        			<div id="" class="team-item border-5">
				                            			<div class="text-center p-4">
				                                		<img id="img" src="/resources/upload/profile/${vo.userVO.user_image}" alt="프로필사진">
				                           				</div>
				                       	 			</div>
				                    			</div>
				                    			<div class="btn-box">
				                    				<label for="user_image">
						                    			<div id="imgBtn" type="button" class="btn text-white bg-primary px-3 rounded position-absolute">사진 선택</div>	
				                    				</label>
									              <input type="file" name="user_image" accept=".jpg,.jpeg,.png" id="user_image" style="display:none;"
									              	class="btn text-white bg-primary px-3 rounded position-absolute" >
									          	</div>
		                					</th>
		                					<th id="rightbox">
		                						<!-- book section -->
												  <section class="book_section layout_padding">
												    <div class="container">
												      <div class="row">
												        <div class="col">
												            <div class="form-row ">
											            	 <input type="hidden" id="user_num" name="user_num" value="${vo.userVO.user_num}">
											            	 <input type="hidden" id="user_isFarm" name="user_isFarm" value="${vo.userVO.user_isFarm}">
												              <div id="boxsize" class="form-group row g-4">
												                <label for="farm_name" class="my_mod_Label">농장 이름</label>
												                <input type="text" class="my_mod_input form-control" readonly="readonly"
												                	id="farm_name" name="farm_name" value="${vo.farm_name}" placeholder="농장을 만들어주세요!">
												              </div>
												              <div id="boxsize" class="form-group row g-4">
												                <label for="user_id" class="my_mod_Label">아이디</label>
												                <input type="text" class="my_mod_input form-control" readonly="readonly" style="background-color: lightgrey;"
												                	id="user_id" name="user_id" value="${vo.userVO.user_id}">
												              </div>
												              <div id="boxsize" class="form-group row g-4">
												                <label for="user_pw" class="my_mod_Label">비밀번호</label>
												                <input type="password" class="my_mod_input form-control"
												                	id="user_pw" name="user_pw" value="${vo.userVO.user_pw}">
												              </div>
												              <div id="boxsize" class="form-group row g-4">
												                <label for="user_name" class="my_mod_Label">이름</label>
												                <input type="text" class="my_mod_input form-control"
												                	id="user_name" name="user_name" value="${vo.userVO.user_name}">
												              </div>
												              <div id="boxsize" class="form-group row g-4">
												                <label for="user_nickname" class="my_mod_Label">닉네임</label>
												                <input type="text" class="my_mod_input form-control" 
												                	id="user_nickname" name="user_nickname" value="${vo.userVO.user_nickname}">
												              </div>
												              <div id="boxsize" class="form-group row g-4">
												                <label for="user_phone" class="my_mod_Label">전화번호</label>
												                <input type="text" class="my_mod_input form-control" 
												                	id="user_phone" name="user_phone" value="${vo.userVO.user_phone}">
												              </div>
												              <div id="boxsize" class="form-group row g-4">
												                <label for="user_postCode" class="my_mod_Label">우편번호</label>
												                <input type="text" class="post_input my_mod_input form-control" readonly="readonly"
												                	id="user_postCode" name="user_postCode" value="${vo.userVO.user_postCode}">
	
												              <!-- 우편번호 찾기 버튼-->
							                                	<input type="button" class="btn text-white bg-primary px-3 rounded " style="max-width: 33%;" 
							                                		onclick="execDaumPostcode()" value="우편번호 찾기">
							                                
							                                	<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
																	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
																</div>
															  </div>
												              <div id="boxsize" class="form-group row g-4">
												                <label for="user_address" class="my_mod_Label">주소</label>
												                <input type="text" class="my_mod_input form-control" readonly="readonly"
												                	id="user_address" name="user_address" value="${vo.userVO.user_address}">
												              </div>
												              <div id="boxsize" class="form-group row g-4">
												                <label for="user_detailAddress" class="my_mod_Label">상세 주소</label>
												                <input type="text" class="my_mod_input form-control" 
												                	id="user_detailAddress" name="user_detailAddress" value="${vo.userVO.user_detailAddress}">
												              </div>
												            </div>
												            <div class="btn-box">
												              <button type="button" class="btn text-white bg-primary px-3 rounded" id="openModal"
												              	data-bs-toggle="modal" data-bs-target="#checkPw">회원 탈퇴</button>
												              <button type="submit" class="btn text-white bg-primary px-3 rounded">회원 정보 수정</button>
												          </div>
												          
												        </div>
												      </div>
												    </div>
												  </section>
												  <!-- 개인정보수정 끝 -->
		                						</th>	
	                						</tr>
                						</table>
		                			</div>
                				</form>
                			</div>
            			</div>
        			</div>
        			<!-- 상단 끝 -->
      			</div>
      
                 
                </div>
            </div>
        </div>
        <!-- Tastimonial End -->


<!-- 비번 확인 -->
<div class="modal fade" id="checkPw" tabindex="-1" aria-labelledby="exampleModalToggleLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div id="pwCheck" class="modal-body">
      비밀번호를 입력해주세요.
      </div>
      <form>
      <input type="password" id="checkPwInput" name="user_pw">
      </form>
      <div class="modal-body" id="inputAdd">
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-primary" id="checkPwBtn" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Start -->
<div class="modal" id="myModal" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">회원 탈퇴</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      정말 탈퇴하시겠습니까?
      (그동안 작성하신 게시판 및 리뷰는 모두 삭제됩니다.
      구매자를 위해 판매자 활동 정보는 한 달 뒤 삭제 예정입니다.)
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오.</button>
        <button type="button" class="btn btn-primary" id="delBtn" data-bs-dismiss="modal">네, 탈퇴하겠습니다</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal End -->

                        
<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">

/* //수정 완료 시
let message = "${message}";
if(message != ""){
	alert(message);
} */

//이미지 확장자 검사
function validateType(file) {
    const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
    return allowedExtensions.test(file.name);
}

//이미지 변화 감지 후 미리보기
document.getElementById("user_image").addEventListener('change', function(e){
    let elem = e.target;
    if(validateType(elem.files[0])){
        let preview = document.querySelector("#img");
        preview.src = URL.createObjectURL(elem.files[0]); //파일 객체에서 이미지 데이터 가져옴.
        preview.onload = function() {
            URL.revokeObjectURL(preview.src); //URL 객체 해제
        }
    } else {
    	alert("이미지 파일이 아닙니다.");
        console.log('이미지 파일이 아닙니다.');
    }
});
 
//이미지 업로드

//탈퇴 위한 비번 확인
$("#checkPwBtn").click(function () {
	var user_pw = $("#checkPwInput").val();
	$.ajax({
		url:"/mypage/pwCheck",
		type: "POST",
		data: {user_pw : user_pw},
		dataType: "json",
		success: function (result) {
			console.log(result)
			if (result) {
                console.log("비번 확인 완료");
             // 비밀번호 확인이 완료되면 myModal 모달창을 토글
                $("#checkPwInput").val("");
                $("#myModal").modal("toggle");
            } else {
                $("#checkPwInput").val("");
                console.log("비번 틀림");
            	alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
            }
		},
		error: function (e) {
			console.log(e);
		}
	});
})

//탈퇴(user_num이용)
$("#delBtn").click(function () {
	console.log("비활성회원 전환 시작");
	$.ajax({
		url:"/mypage/changeDisabled",
		type: "POST",
		dataType: "json",
		success: function (result) {
			console.log(result)
			if (result.success) {
                console.log("비활성 완료");
                
                setTimeout(function () {
                    $('#myModal').modal('hide');
                }, 1000);
                
                alert("정상적으로 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
                
                // 사용자 세션 정보 지우기
                sessionStorage.clear();
                console.log("사용자 세션 정보 삭제");
                
             	// 서버 세션 정보 지우기
                $.ajax({
                    url: "/user/logout", // 로그아웃을 수행하는 서버의 URL
                    type: "GET",
                    success: function () {
                    	console.log("비활성 후 로그아웃 완료");
                    	window.location.href = "/"; //메인페이지 이동
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
                
            } else {
                console.log("비활성 오류");
                alert("오류가 발생했습니다. 다시 시도해주세요.");
            }
		},
		error: function (e) {
			console.log(e);
		}
	});
})


//유효성 검사
$('#frm').validate({
	onfocusout: false,  // 포커스가 떠날 때 유효성 검사 시작
    focusCleanup: false, // 잘못된 필드에 포커스가 가면 에러메세지 지우기
    rules: {        // 유효성 검사 규칙
    	user_pw: {     				// 비밀번호 필드
            required: true,     
            minlength: 4,			
            maxlength: 20,           
        },
        user_name: {     			// 이름 필드
            required: true,     
            minlength: 2,			
            maxlength: 20,       
        },
        user_nickname: {     		// 닉네임 필드
            required: true,     
            minlength: 1,			
            maxlength: 20,
            remote: {
                url: "/user/nickCheck",
                type: "POST",
                data: {
                    user_nickname: function () {
                        return $('input[name="user_nickname"]').val();
                    }
                }
            }	
        },
        user_phone: {     			// 전화번호 재확인 필드
            required: true,     
            digits:	true,        	// 숫자만 입력 
            minlength: 10,			
            maxlength: 11
        },
        user_address: {     		// 주소 필드
            required: true,     
        },
        user_detailAddress: {     	// 상세 주소 필드     			
            maxlength: 50
        },
    },
    messages: {		// 오류값 발생시 출력할 메시지 수동 지정
    	user_pw: {            		
    		required: '필수 입력 항목입니다.',
    		minlength: '4글자 이상 입력해야 합니다.',		
            maxlength: '20글자까지 입력 가능합니다.'    
        },
        user_name: {            		
    		required: '필수 입력 항목입니다.',
    		minlength: '2글자 이상 입력해야 합니다.',		
            maxlength: '20글자까지 입력 가능합니다.'  
        },
        user_nickname: {            		
    		required: '필수 입력 항목입니다.',
    		minlength: '1글자 이상 입력해야 합니다.',		
            maxlength: '20글자까지 입력 가능합니다.',
            remote: "이미 사용중인 닉네임입니다."
        },
        user_phone: {            		
    		required: '필수 입력 항목입니다.',
        	digits: '-없이 숫자만 입력하세요.',
    		minlength: '10글자 이상 입력해야 합니다.',		
            maxlength: '11글자까지 입력 가능합니다.'
        },
        user_address: {            		
    		required: '우편번호를 검색하세요.'
        },
        user_detailAddress: {            		
        	maxlength: '최대 50글자 입력 가능합니다.'  
        }
    },
    submitHandler: function (form) {	// 모든 유효성검사 통과해야 폼 제출
    		console.log("회원 정보 수정 완료");
    		$.ajax({
            url: "/mypage/modify",
            type: "POST",
            data: new FormData(form),
            processData: false,
            contentType: false,
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    alert(response.message);
                    console.log("수정끝22");
                    //수정 페이지 불러오기
                    window.location.href = "/mypage/modify";
                } else {
                    alert(response.message);
                }
            },
            error: function (error) {
                console.error(error);
            }
        	});
        return false;
    }
});




//다음 주소 API 사용
var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function execDaumPostcode() {
    // 현재 scroll 위치를 저장해놓는다.
    const currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#user_postCode").val(data.zonecode);
            $("#user_address").val(addr);
            // 커서를 상세주소 필드로 이동한다.
            $("#user_detailAddress").focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_wrap.style.display = 'none';

            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
        onresize : function(size) {
            element_wrap.style.height = size.height+'px';
            element_wrap.style.width = 100+'%';
        },
        width : '100%',
        height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
}


</script>









