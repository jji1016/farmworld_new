<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.msg{
	position: relative;
    bottom: 40px;
    right: 2%;
    float: inline-end;
    color: orangered;
    font-weight: bold;
}
.col-12{
	margin-bottom: 35px;
	max-height: 55px;
}
.letInput{
	width: 53% !important;
    display: inline !important; 
	margin-right:13%;
} 
.letBtn{
	max-width: 33%;
}
#wrqp{
	z-index: 1;
}
.join_label{
	position: relative;
    display: flex;
    margin-left: 31px;
    color: aliceblue;
    font-weight: bold;
}
.error {
    display: block;
    color: orangered;
    font-weight: bold;
}
#wrap{
	z-index:1;
}
</style>
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
	                <h6 class="text-primary text-uppercase">환영합니다!</h6>
	                <h1 class="display-5">회원가입</h1>
	            </div>
            </div>
            
            <div class="col-lg-7">
                    <div class="bg-primary h-100 p-5">
                        <form action="/user/join" method="post" id="frm">
                            <div class="row g-3">
                            
                                <div class="col-12">
                                	<label for="user_id" class="join_label">아이디(이메일)</label>
                                    <input type="email" id="user_id" name="user_id" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  아이디(이메일)" style="height: 55px;" required>
                                </div>
                                
                                <div class="col-12">
                                	<label for="user_pw1" class="join_label">비밀번호</label>
                                    <input type="password" id="user_pw1" name="user_pw1" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  비밀번호"  style="height: 55px;" required>
                                </div>
                                
                                <div class="col-12">
                                	<label for="user_pw" class="join_label">비밀번호 확인</label>
                                    <input type="password" id="user_pw" name="user_pw" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  비밀번호 확인" style="height: 55px;" required>
                                </div>
                                
                                <div class="col-12">
                                	<label for="user_name" class="join_label">이름</label>
                                    <input type="text" id="user_name" name="user_name" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  이름" style="height: 55px;" required>
                                </div>
                                
                                <div class="col-12">
                                	<label for="user_nickname" class="join_label">닉네임</label>
                                    <input type="text" id="user_nickname" name="user_nickname" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  닉네임" style="height: 55px;" required>
                                </div>
                                
                                <div class="col-12">
                                	<label for="user_phone" class="join_label">전화번호</label>
                                    <input type="text" id="user_phone" name="user_phone" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  전화번호" style="height: 55px;" required>
                                </div>
                                
                                <div class="col-12">
                                	<!-- 우편번호 -->
                                	<label for="user_postCode" class="join_label">우편번호</label>
                                	<input type="text" id="user_postCode" name="user_postCode" class="form-control bg-light border-0 px-4 letInput"
                                		placeholder="우편번호" readonly="readonly" style="height: 55px; ">
                                	
                                	<!-- 우편번호 찾기 버튼-->
                                	<input type="button" class="btn btn-secondary w-100 py-3 letBtn" style="" id="postBtn"
                                		onclick="execDaumPostcode()" value="우편번호 찾기">
                                
                                	<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:2" onclick="foldDaumPostcode()" alt="접기 버튼">
									</div>
                                </div>
                                
                                <div class="col-12">    
                                	<!-- 주소 -->
                                	<label for="user_address" class="join_label">주소</label>
                                    <input type="text" id="user_address" name="user_address" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  주소" readonly="readonly" style="height: 55px;" required>
								</div>
								
                                <div class="col-12">	
                                	<!-- 상세주소 -->
                                	<label for="user_detailAddress" class="join_label">상세주소</label>
                                    <input type="text" id="user_detailAddress" name="user_detailAddress" class="form-control bg-light border-0 px-4"
                                    	placeholder="  상세주소" style="height: 55px;">
                                </div>
                                
                                <div style="margin-top: 4%;">
                                    <button class="btn btn-secondary w-100 py-3" type="submit" id="submitBtn">회원가입</button>
                                </div>
                                
                            </div>
                        </form>
                    </div>
                </div>
            
        </div>
    </div>
</div>
<!-- join End -->


<%@include file="../includes/footer.jsp" %>


<script type="text/javascript">

/** 다음 주소 API 사용 **/
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
//주소api사용 끝

//유효성 검사

$('#frm').validate({
	onfocusout: false,  //포커스가 떠날 때 유효성 검사 시작
    focusCleanup: false, //잘못된 필드에 포커스가 가면 에러메세지 지우기
    rules: {        //유효성 검사 규칙
    	user_id: {             		//이름 필드
            required: true,     	//필수 입력
            minlength: 4,			//최소 입력값
            maxlength: 40, 			//최대 입력값
            email: true,			//이메일 형식 검증
            remote: {				//중복 체크 서버 연결
                url: "/user/idCheck",
                type: "POST",
                data: {
                    user_nickname: function () {
                        return $('input[name="user_id"]').val();
                    }
                }
            }
            
    	},
        user_pw1: {            		//비밀번호 필드
            required: true,     
            minlength: 4,			
            maxlength: 20,     
            equalTo: user_pw		//비밀번호 필드와 동일한 값인지 확인
        },
        user_pw: {     				//비밀번호 재확인 필드
            required: true,     
            minlength: 4,			
            maxlength: 20,       
            equalTo: user_pw1    
        },
        user_name: {     			//이름 필드
            required: true,     
            minlength: 2,			
            maxlength: 20,
            regx: /^[a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*$/ //정규식
        },
        user_nickname: {     		//닉네임 필드
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
        user_phone: {     			//전화번호 재확인 필드
            required: true,     
            digits:	true,        	//숫자만 입력 
            minlength: 10,			
            maxlength: 11,
            regx: /^(010|011|016)-?\d{3,4}-?\d{4}$/
        },
        user_address: {     		//주소 필드
            required: true,     
        },
        user_detailAddress: {     	//상세 주소 필드     			
            maxlength: 50
        },
    },
    messages: {     //오류값 발생시 출력할 메시지 수동 지정
    	user_id: {             		
    		required: '필수 입력 항목입니다.',
    		minlength: '4글자 이상 입력해야 합니다.',		
            maxlength: '40글자까지 입력 가능합니다.',
            email: "이메일 형식으로 입력해주세요.",
            remote: "이미 사용중인 아이디입니다." //사용 가능하면 알림 x
    	},
    	user_pw1: {            		
    		required: '필수 입력 항목입니다.',
    		minlength: '4글자 이상 입력해야 합니다.',		
            maxlength: '20글자까지 입력 가능합니다.',    
            equalTo: '동일한 비밀번호를 입력해주세요.'
        },
        user_pw: {            		
    		required: '필수 입력 항목입니다.',
    		minlength: '4글자 이상 입력해야 합니다.',		
            maxlength: '20글자까지 입력 가능합니다.',     
            equalTo: '동일한 비밀번호를 입력해주세요.'
        },
        user_name: {            		
    		required: '필수 입력 항목입니다.',
    		minlength: '2글자 이상 입력해야 합니다.',		
            maxlength: '20글자까지 입력 가능합니다.',
            regx: '숫자와 특수문자는 입력할 수 없습니다.'
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
    		minlength: '9글자 이상 입력해야 합니다.',		
            maxlength: '11글자까지 입력 가능합니다.',
            regx: '형식에 맞게 입력해주세요. 예)01012345678'
        },
        user_address: {            		
    		required: '우편번호를 검색하세요.'
        },
        user_detailAddress: {            		
        	maxlength: '최대 50글자 입력 가능합니다.'  
        }
    },
    submitHandler: function (form) {	//모든 유효성검사 통과해야 폼 제출
    		console("회원가입 완료");
    		$.ajax({
            url: "/join",
            type: "POST",
            data: $(form).serialize(),
            success: function (response) {
                if (response.success) {
                    alert(response.message);
                    window.location.href = "/";
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


//정규식을 적용
$.validator.addMethod("regx", function(value, element, regexpr) {          
    return regexpr.test(value);
});




</script>

