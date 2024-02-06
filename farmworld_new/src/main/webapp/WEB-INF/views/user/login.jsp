<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>
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
.btn{
	color: white;
}
.btn:hover{
	color: black;
}
</style>
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
	                <h6 class="text-primary text-uppercase">환영합니다!</h6>
	                <h1 class="display-5">로그인</h1>
	            </div>
            </div>
            
            <div class="col-lg-7">
                    <div class="bg-primary h-100 p-5">
                        <form id="login_form action="/user/login" method="post">
                            <div class="row g-3">
                            
                                <div id="loginbox" class="col-12">
                                    <input type="email" id="user_id" name="user_id"
                                    	class="form-control bg-light border-0 px-4" 
                                    	placeholder="  아이디(이메일)" style="height: 55px;">
                                </div>
                                
                                <div id="loginbox" class="col-12">
                                    <input type="password" id="user_pw" name="user_pw"
                                    	class="form-control bg-light border-0 px-4" 
                                    	placeholder="  비밀번호" style="height: 55px;">
                                </div>
                                
                                <div id="loginbox" class="col-12">
                                    <button class="btn btn-secondary w-100 py-3" type="submit" id="loginBtn">로그인</button>
                                </div>
                                
                            </div>
                        </form>
                    </div>
                </div>
                
                <div id="login_bt_box" class="col-lg-6" style="display: flex; margin-top: 25px;">
                
                <div id="loginbox2" class="col-3">
                    <a href="/user/findId"><button class="btn btn-secondary w-100 py-3" type="button">아이디 찾기</button></a>
                </div>
                
                 <div id="loginbox2" class="col-3">
                    <a href="/user/changePw"><button class="btn btn-secondary w-100 py-3" type="button">비밀번호 찾기</button></a>
                </div>
                
                 <div id="loginbox2" class="col-3">
                    <a href="/user/join"><button class="btn btn-secondary w-100 py-3" type="button">회원가입</button></a>
                </div>
            
            	</div>    
            
        </div>
    </div>
</div>
<!-- login End -->

<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">

//아이디, 비번 틀렸을 시 or 비회원 마이페이지 이동 시 안내 문구
let message = "${message}";
if(message != ""){
	alert(message);
}

</script>

