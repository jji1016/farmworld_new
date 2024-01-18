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
                                    <p id="idCheck_msg"></p>
                                </div>
                                
                                <div class="col-12">
                                    <input required="required" type="password" id="user_pw1" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  비밀번호"  style="height: 55px;">
                                    <p id="pw1Check_msg"></p>
                                </div>
                                
                                <div class="col-12">
                                    <input required="required" type="password" id="user_pw" name="user_pw" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  비밀번호 확인" required="required" style="height: 55px;">
                                    <p id="pwCheck_msg"></p>
                                </div>
                                
                                <div class="col-12">
                                    <input required="required" type="text" id="user_name" name="user_name" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  이름" required="required" style="height: 55px;">
                                    <p id="nameCheck_msg"></p>
                                </div>
                                
                                <div class="col-12">
                                    <input type="text" id="user_nickname" name="user_nickname" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  닉네임" required="required" style="height: 55px;">
                                    <p id="nickCheck_msg"></p>
                                </div>
                                
                                <div class="col-12">
                                    <input type="text" id="user_phone" name="user_phone" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  전화번호" required="required" style="height: 55px;">
                                    <p id="phoneCheck_msg"></p>
                                </div>
                                
                                <div class="col-12">
                                    <input type="text" id="user_address" name="user_address" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  주소" required="required" style="height: 55px;">
                                    <p id="addressCheck_msg"></p>
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
	$(document).ready(function(){
		
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
		
	 });
	
</script>

