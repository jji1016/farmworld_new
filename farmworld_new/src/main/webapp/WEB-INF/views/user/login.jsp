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
	                <h6 class="text-primary text-uppercase">환영합니다!</h6>
	                <h1 class="display-5">로그인</h1>
	            </div>
            </div>
            
            <div class="col-lg-6">
                    <div class="bg-primary h-100 p-5">
                        <form action="/user/login" method="post">
                            <div class="row g-3">
                            
                                <div class="col-12">
                                    <input type="email" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  아이디(이메일)" style="height: 55px;">
                                </div>
                                
                                <div class="col-12">
                                    <input type="password" class="form-control bg-light border-0 px-4" 
                                    	placeholder="  비밀번호" style="height: 55px;">
                                </div>
                                
                                <div class="col-12">
                                    <button class="btn btn-secondary w-100 py-3" type="submit">로그인</button>
                                </div>
                                
                                 
                                
                            </div>
                        </form>
                    </div>
                </div>
                
                <div id="login_bt_box" style="display: flex; margin-top: 25px;">
                
                <div class="col-4">
                    <button class="btn btn-secondary w-100 py-3" type="submit">아이디 찾기</button>
                </div>
                
                 <div class="col-4">
                    <button class="btn btn-secondary w-100 py-3" type="submit">비밀번호 찾기</button>
                </div>
                
                 <div class="col-4">
                    <button class="btn btn-secondary w-100 py-3" type="submit">회원가입</button>
                </div>
            
            	</div>    
            
        </div>
    </div>
</div>
<!-- login End -->

<%@include file="../includes/footer.jsp" %>