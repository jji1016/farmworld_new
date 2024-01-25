<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->

<!-- login Start -->
<div class="container-fluid py-5">
    <div class="container py-5 text-center">
        <div class="row justify-content-center">
        	
        	<div class="container">
	            <div class="mx-auto text-center mb-5" style="max-width: 500px;">
	            	<h6 class="text-primary text-uppercase">이메일 본인인증 완료 후 비밀번호를 수정할 수 있습니다.</h6>
	                <h1 class="display-5">비밀번호 수정</h1>
	            </div>
            </div>
            
            <div class="col-lg-6">
                    <div class="bg-primary h-100 p-5">
                        <form id="findId_form" action="/user/findId" method="post">
                            <div class="row g-3">
                            
                            	<div class="col-12">
                                    <input type="email" id="user_id" name="user_id"
                                    	class="form-control bg-light border-0 px-4"  required="required"
                                    	placeholder="  아이디(이메일)" style="height: 55px;">
                                </div>
                            
                                <div class="col-12">
                                    <input type="text" id="user_name" name="user_name"
                                    	class="form-control bg-light border-0 px-4"  required="required"
                                    	placeholder="  이름" style="height: 55px;">
                                </div>
                                
                                <div class="col-12">
                                    <input type="text" id="user_phone" name="user_phone"
                                    	class="form-control bg-light border-0 px-4"  required="required"
                                    	placeholder="  전화번호" style="height: 55px;"
                                    	pattern="[0-9]{11}" title="숫자 11자리를 입력하세요.">
                                </div>
                                
                                <div class="col-12">
                                    <button class="btn btn-secondary w-100 py-3" type="button" id="mailSendBtn"
                                    data-bs-toggle="modal" data-bs-target="#myModal"
                                    >본인 인증</button>
                                </div>
                                
                            </div>
                        </form>
                    </div>
                </div>
                
                <div id="login_bt_box" style="display: flex; margin-top: 25px;">
                
                <div class="col-4">
                    <button class="btn btn-secondary w-100 py-3" type="button"><a href="/user/login">로그인</a></button>
                </div>
                
                 <div class="col-4">
                    <button class="btn btn-secondary w-100 py-3" type="button"><a href="/user/findId">아이디 찾기</a></button>
                </div>
                
                 <div class="col-4">
                    <button class="btn btn-secondary w-100 py-3" type="button"><a href="/user/join">회원가입</a></button>
                </div>
            
            	</div>    
            
        </div>
    </div>
</div>
<!-- login End -->

<!-- Modal start -->

<!-- 메일 전송 결과 및 본인 인증-->
<div class="modal fade" id="myModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel">본인 인증</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="sendResult">
      </div>
      <p id="timeOut" class="modal-body"></p>
      <p id="authResult" class="modal-body"></p>
      <div class="modal-footer">
        <button id="authBtn" class="btn btn-primary" >인증하기</button>
        <button id="nextBtn" class="btn btn-primary" data-bs-target="#changePw" data-bs-toggle="modal" data-bs-dismiss="modal">비밀번호 수정하기</button>
      </div>
    </div>
  </div>
</div>

<!-- 비번 수정 -->
<div class="modal fade" id="changePw" tabindex="-1" aria-labelledby="exampleModalToggleLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="inputAdd">
      </div>
      <div id="pwCheck" class="modal-body"></div>
      <div class="modal-footer" id="modPwResult">
        <button type="reset" class="btn btn-secondary">초기화</button>
        <button type="button" class="btn btn-primary" id="modPwBtn">수정하기</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal end -->


<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">

$(document).ready(function(){
	let user_id;
    let style = { "display": "none" };
    let showStyle = { "display": "block" };
    let timer; // 타이머 변수 추가
	let limiter;
	let ec="";
	
    // 모달 외부를 클릭해도 닫히지 않음
    $(".modal").modal({
        backdrop: 'static',
    });
 
	
 // "비밀번호 수정하기" 버튼 눌렀을 때 1번 모달창(이메일 전송 결과) 활성화
    $("#mailSendBtn").click(function () {
    	clearInterval(timer);
    	
        user_id = $("#user_id").val();
        let user_name = $("#user_name").val();
        let user_phone = $("#user_phone").val();
        
        $("#nextBtn, #authBtn, #authResult, #timeOut").css(style);

        if (user_name.trim() == "" && user_phone.trim() == "" && user_id.trim() == "") {
            $("#sendResult").text("아이디와 이름, 전화번호를 입력해주세요.");
        } else if (user_id.trim() == "") {
            console.log("user_id이 비어 있습니다.");
            $("#sendResult").text("아이디(이메일)를 입력해주세요.");
        } else if (user_name.trim() == "") {
            console.log("user_name이 비어 있습니다.");
            $("#sendResult").text("이름을 입력해주세요.");
        } else if (user_phone.trim() == "") {
            console.log("user_phone이 비어 있습니다.");
            $("#sendResult").text("전화번호를 입력해주세요.");
        } else {
            $.ajax({
                url: "/user/infoCheckForPw",
                type: "POST",
                data: {
                    user_id: user_id,
                    user_name: user_name,
                    user_phone: user_phone
                },
                dataType: "json",
                success: function (result) {
                	console.log("인증 id 확인" + result);
                	//result = true(입력값과 db 일치)
                	if (result) { 
                		$("#sendResult")
                        	.html('요청하신 아이디 ' + user_id + '로 인증번호를 전송했습니다. 아래에 인증번호를 입력하세요.'
                        			+'<br><input id="userCode" type="text">');
                		
                		$("#authResult, #timeOut, #authBtn").css(showStyle);
                        
                		//메일 전송 시작
                		 $.ajax({
				            url: "/user/sendMail",
				            type: "POST",
				            data: { user_id: user_id },
				            dataType: "json",
				            success: function (code) { //코드 받기
				            	console.log("메일 전송 완료: " + code);
				                ec=code;
				                //타이머 및 코드 체크 시작
				                let timer = 180;
				                
				                clearInterval(limiter);
				                limiter = setInterval(() => {
				                    timer -= 1;
				                    $("#timeOut").html(Math.floor(timer / 60) + "분 " + (timer % 60) + "초");

				                    if (timer == 0) {
                                        clearInterval(limiter);
                                        ec="";
                                        $("#timeOut").text("시간 초과"); 
                                                                            
                                    }
                                    
                                }, 1000);
				            },
				            error: function (e) {
				                console.log("메일 전송 실패"+e);
				            }
					    });  //메일 전송 끝 
                	    	
                	}else { //result = false(입력값과 db 일치 x)
                        $("#sendResult").text("아이디 혹은 이름, 전화번호가 일치하지 않습니다.");
                    }
                },
                error: function (e) {
                    console.log("id확인 못함:"+e);
                }
        	}); //ajax infoCheckForPw 끝
                        
        }
        
        clearInterval(timer); // 타이머 초기화
        
     	// 모달 닫힐 때 내용 초기화
        $("#myModal").on("hidden.bs.modal", function () {
            clearInterval(timer);
//          clearInterval(limiter);
            $("#sendResult").text("");
            $("#timeOut, #authResult").text("");
            $("#authBtn, #nextBtn").css(style);
        });
        
	});//1번 모달창 활성화 끝.
	
	//코드 체크
	$("#authBtn").on("click", function () { //"인증하기" 버튼 클릭--여기
			const userCode = $("#userCode").val();
	        console.log("코드체크:" + ec);
	        //인증 완료
	        if (ec == userCode) {
	        	console.log("c"+userCode);
	            $("#authResult").text("인증되었습니다.");
	            $("#timeOut").css(style); //timer 안보이기
	            
            	$("#authBtn").css(style); //'인증하기' 버튼 숨기기
                $("#nextBtn").css(showStyle); //'비밀번호 수정하기' 버튼 표시
                
                //'비밀번호 수정하기' 버튼 누르면 두번째 모달(비밀번호 수정창) 활성화
	         	// 다음 모달이 나타날 때 이벤트 처리
	            $("#changePw").on("shown.bs.modal", function () {
	            	$("#inputAdd").html('비밀번호:\t<input id="pw" type="password"><br>비밀번호 확인: <input id="user_pw" type="password">');
	            });
                
	          //"수정하기" 버튼 누를 때마다 일치 여부 확인-----------------수정
                
                
	            // 모달 닫힐 때 내용 초기화
	            $("#changePw").on("hidden.bs.modal", function () {
	            	$("#inputAdd, #pwCheck").text("");
	            });
	            
	        } else { //인증 실패
	        	console.log("a"+userCode);
	            $("#authResult").text("인증번호가 일치하지 않습니다.");
	        }
	    }); //codeCheck 함수 종료
	        
	//모달에서 "닫기" 버튼 클릭 시 타이머와 모든 내용 초기화
    $(".btn-close").click(function () {
        clearInterval(timer);
        clearInterval(limiter);
        $("#inputAdd").text("");
        $("#pwCheck").text("");
        $("#sendResult").text("");
        $("#timeOut").text("");
        $("#authResult").text("");
        $("#authBtn").hide();
        $("#nextBtn").show();
        codeCheckCalled = false; // 추가: 코드 체크 여부 변수 초기화
    });        

  //비밀번호 일치여부 확인
    $("#modPwBtn").on("click",function(){
    	console.log("비번 수정0");

    	let pw = $("#pw").val();
    	let user_pw = $("#user_pw").val();

        if(pw == user_pw) {
            $("#pwCheck").text("비밀번호가 일치합니다.");
    		console.log("user_id:"+user_id+" /pw:"+pw+" /user_pw:"+user_pw);
           	$.ajax({
                url: "/user/modPw",
                type: "POST",
                data: {
                	user_id: user_id,
                	user_pw: user_pw
                },
                dataType: "json",
                success: function (response) {
                    console.log("---123---");
                    if (response.success) {
                        $("#pwCheck").text("비밀번호 수정되었습니다.");
                        // 성공 시 3초 후 모달 닫기
                        setTimeout(function () {
                            $('#changePw').modal('hide');
                            $(".modal-body").text("");
                        }, 3000);
                    } else {
                        $("#pwCheck").text("서버 오류: " + response.message);
                    }
                },
                error: function (e) {
                    console.log("비번 수정x" + e);
                    $("#pwCheck").text("서버 오류 발생");
                }
          	});
        }else {
            $("#pwCheck").text("비밀번호가 일치하지 않습니다.");
        }
    });
     //checkPwMatch 끝    
	    
});

</script>

