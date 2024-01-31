<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->
<style type="text/css">
#loginbox{
	margin: 1%;
}
#loginbox2{
	margin: 1%;
	width: 33%;
}
#login_bt_box{
    display: flex;
    margin-top: 25px;
    justify-content: center;
}
</style>
<!-- login Start -->
<div class="container-fluid py-5">
    <div class="container py-5 text-center">
        <div class="row justify-content-center">
        	
        	<div class="container">
	            <div class="mx-auto text-center mb-5" style="max-width: 500px;">
	                <h1 class="display-5">아이디 찾기</h1>
	            </div>
            </div>
            
            <div class="col-lg-7">
                    <div class="bg-primary h-100 p-5">
                        <form id="findId_form" action="/user/findId" method="post">
                            <div class="row g-3">
                            
                                <div id="loginbox" class="col-12">
                                    <input type="text" id="user_name" name="user_name"
                                    	class="form-control bg-light border-0 px-4"  required="required"
                                    	placeholder="  이름" style="height: 55px;">
                                </div>
                                
                                <div id="loginbox" class="col-12">
                                    <input type="text" id="user_phone" name="user_phone"
                                    	class="form-control bg-light border-0 px-4"  required="required"
                                    	placeholder="  전화번호" style="height: 55px;">
                                </div>
                                
                                <div id="loginbox" class="col-12">
                                    <button class="btn btn-secondary w-100 py-3" type="button" id="openModal"
                                    data-bs-toggle="modal" data-bs-target="#myModal"
                                    >아이디 확인</button>
                                </div>
                                
                            </div>
                        </form>
                    </div>
                </div>
                
                <div id="login_bt_box" class="col-lg-6" style="display: flex; margin-top: 25px;">
                
                <div id="loginbox2" class="col-4">
                    <button class="btn btn-secondary w-100 py-3" type="button"><a href="/user/login">로그인</a></button>
                </div>
                
                 <div id="loginbox2" class="col-4">
                    <button class="btn btn-secondary w-100 py-3" type="button"><a href="/user/changePw">비밀번호 찾기</a></button>
                </div>
                
                 <div id="loginbox" class="col-4">
                    <button class="btn btn-secondary w-100 py-3" type="button"><a href="/user/join">회원가입</a></button>
                </div>
            
            	</div>    
            
        </div>
    </div>
</div>
<!-- login End -->

<!-- Modal Start -->
<div class="modal" id="myModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">아이디 찾기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal End -->

<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function () {

	//이름, 번호가 비어 있지 않은 경우에만 AJAX 호출
	$("#openModal").on("click", function () {
		var user_name = $("#user_name").val();
	    var user_phone = $("#user_phone").val();
		
	    if(user_name.trim() == "" && user_phone.trim() == ""){
	    	$(".modal-body").text("이름 또는 번호 입력해주세요."); 
	    }else if(user_name.trim() == ""){
	    	console.log("user_name이 비어 있습니다.");
	    	$(".modal-body").text("이름를 입력해주세요.");
	    }else if(user_phone.trim() == ""){
	    	console.log("user_phone이 비어 있습니다.");
	    	$(".modal-body").text("번호를 입력해주세요.");
	    }else{
	    	$.ajax({
	    		url: "/user/findId",
	    		type: "POST",
	    		data: {
	    			user_name: user_name,
	    			user_phone: user_phone
	    		},
	    		dataType: "json",
	    		success: function (data) {
	    			console.log("아이디찾기"+data.result);
	    			//서버에서 받은 데이터 모달에 출력
	    			$(".modal-body").text(data.result);
	    		},
	    		error: function (e) {
	    			console.log(e);
	    		}
	    	});
	    }
		
		// 모달 열기
        $("#myModal").modal("show");		
		
		// 모달 닫힐 때 내용 초기화
        $("#myModal").on("hidden.bs.modal", function () {
        	$(".modal-body").text("");  
        });
	});
    
});

</script>

