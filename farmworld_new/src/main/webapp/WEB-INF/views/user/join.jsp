<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                        <form action="/user/join" method="post">
                            <div class="row g-3">
                            
                                <div class="col-12">
                                    <input required="required" type="email" id="user_id" name="user_id" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  아이디(이메일)" required="required" style="height: 55px;">
                                    <span id="idCheck_msg"></span>
                                </div>
                                
                                <div class="col-12">
                                    <input required="required" type="password" id="user_pw1" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  비밀번호"  style="height: 55px;">
                                    <span id="pw1Check_msg"></span>
                                </div>
                                
                                <div class="col-12">
                                    <input required="required" type="password" id="user_pw" name="user_pw" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  비밀번호 확인" required="required" style="height: 55px;">
                                    <span id="pwCheck_msg"></span>
                                </div>
                                
                                <div class="col-12">
                                    <input required="required" type="text" id="user_name" name="user_name" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  이름" required="required" style="height: 55px;">
                                    <span id="nameCheck_msg"></span>
                                </div>
                                
                                <div class="col-12">
                                    <input type="text" id="user_nickname" name="user_nickname" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  닉네임" required="required" style="height: 55px;">
                                    <span id="nickCheck_msg"></span>
                                </div>
                                
                                <div class="col-12">
                                    <input type="text" id="user_phone" name="user_phone" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  전화번호" required="required" style="height: 55px;">
                                    <span id="phoneCheck_msg"></span>
                                </div>
                                
                                <div class="col-12">
                                	<!-- 우편번호 -->
                                	<input type="text" id="user_postCode" name="user_postCode" class="form-control bg-light border-0 px-4"
                                		placeholder="우편번호" readonly="readonly" required="required" style="height: 55px; width:53%; display:inline; margin-right:13%">
                                	
                                	<!-- 우편번호 찾기 버튼-->
                                	<input type="button" class="btn btn-secondary w-100 py-3" style="max-width: 33%;" 
                                		onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                                
                                	<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
									</div>
                                </div>
                                
                                <div class="col-12">    
                                	<!-- 주소 -->
                                    <input type="text" id="user_address" name="user_address" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  주소" readonly="readonly" required="required" style="height: 55px;">
									<span id="addressCheck_msg"></span>
								</div>
                                <div class="col-12">	
                                	<!-- 상세주소 -->
                                    <input type="text" id="user_detailAddress" name="user_detailAddress" class="form-control bg-light border-0 px-4"
                                    	placeholder="  상세주소" required="required" style="height: 55px;">
                                </div>
                                
                                <div class="col-12">
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


	
	//인풋 태그 안에서 발생한 인풋 이벤트 처리
	$('.row.g-3').on('input', 'input', function () {
           // 각 입력 필드의 값을 확인하여 모든 필드가 비어있지 않으면 버튼 활성화
           var allFieldsFilled = true;
           $('.row.g-3 input').each(function () {
               if ($(this).val() === '') {
                   allFieldsFilled = false;
                   return false;
               }
           });

           // 버튼 활성화 또는 비활성화
           $('#submitBtn').prop('disabled', !allFieldsFilled);
       });
  
	
        //아이디 중복 체크
	$("#user_id").on("blur", function (){
			$.ajax({
				url:"/user/idCheck",
				type: "POST",
				data: {user_id : $("#user_id").val()},
				dataType: "json",
				success: function (result) {
					console.log(result)
					if (result) {
                        $("#idCheck_msg").text("사용 가능한 아이디입니다.");
                    } else {
                        $("#idCheck_msg").text("이미 사용 중인 아이디입니다.");
                    }
				},
				error: function (e) {
					console.log(e);
				}
			});
		});
       
	
	
	 //닉네임 중복 체크
	$("#user_nickname").on("blur", function (){
		$.ajax({
			url:"/user/nickCheck",
			type: "POST",
			data: {user_nickname : $("#user_nickname").val()},
			dataType: "json",
			success: function (result) {
				console.log(result);
				if(result){ //닉네임 중복 x
					$("#nickCheck_msg").text("사용 가능한 닉네임입니다.");
				}else{
					$("#nickCheck_msg").text("이미 사용 중인 닉네임입니다.");
				}
			},
			error: function (e) {
				console.log(e);
			}
			
		});
	});

	
	$("#user_pw1, #user_pw").on("blur", function() {
        pwCheck();
    });
	
	function pwCheck() { //비번1,2 일치 확인
		let user_pw1 = $("#user_pw1").val();
		let user_pw = $("#user_pw").val();
		if(user_pw1===user_pw){
			$("#pwCheck_msg").text("비밀번호가 일치합니다.");
		}else{
			$("#pwCheck_msg").text("비밀번호가 일치하지 않습니다.");
		}
	}
	


</script>

