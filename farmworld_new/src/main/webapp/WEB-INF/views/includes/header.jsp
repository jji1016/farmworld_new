
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>FarmWorld</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
    
    <!-- jQuery 변경 : 반응형 버전이 최적화 / jsp에서 jQuery 사용이 필요하므로 header에 -->
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	
	<!-- 카카오 우편번호 서비스 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<!-- 캐시 비활성화 -->
	<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, post-check=0, pre-check=0">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
</head>

<body>

<!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">123 Street, New York</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a id="user_nickname" href="#" class="text-white"><c:out value="${user_nickname}"/></a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                        <a href="../user/login" id="loginBtn" class="text-white"><small class="text-white mx-2">로그인</small>/</a>
                        <a href="../user/logout" id="logoutBtn" class="text-white" style="display: none;"><small class="text-white ms-2">로그아웃</small></a>
                        <a href="../user/join" id="joinBtn" class="text-white"><small class="text-white ms-2">회원가입</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="../home.jsp" class="navbar-brand"><h1 class="text-primary display-6">Fruitables</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="../home" class="nav-item nav-link active">Home</a>
                            <a href="../shopmain" class="nav-item nav-link">Shop</a>
                            <a href="../shopdetail" class="nav-item nav-link">Shop Detail</a>
                            <a href="../myfarm/main" class="nav-item nav-link">My Farm</a>
                            <a href="../board/list" class="nav-item nav-link">Board</a>

                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="../cart.jsp" class="dropdown-item">Cart</a>
                                    <a href="../chackout.jsp" class="dropdown-item">Chackout</a>
                                    <a href="../testimonial.jsp" class="dropdown-item">Testimonial</a>
                                    <a href="../404.jsp" class="dropdown-item">404 Page</a>
                                </div>
                            </div>
                            <a href="../contact.jsp" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                            <a href="#" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                                <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
                            </a>
                            <a href="../mypage" class="my-auto">
                                <i class="fas fa-user fa-2x"></i>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->

</body>
</html>

<script type="text/javascript">
	var isLoggedIn = false;

	//로그인 상태인지 확인
	function checkLoginStatus() {
		$.ajax({
			url: "/user/checkLogin",
			type: "POST",
			dataType: "json",
			success: function (result) {
				console.log(result);
				if(result){ //user_num 있으면 로그인 상태로 간주
					isLoggedIn = true;
					toggleBtn();
				}
			},
			error: function (e) {
				console.log(e);
			}
		});
	};
	
	//버튼 바꾸기
	function toggleBtn() {
		if (isLoggedIn) { //로그인 상태
	        $("#loginBtn, #joinBtn").hide();
	        $("#logoutBtn").show();
	    } else {
	        $("#loginBtn, #joinBtn").show();
	        $("#logoutBtn").hide();
	    }
	}

	$(document).ready(function () {
	    // 페이지 로드 시 로그인 상태 확인
	    checkLoginStatus();

	    // 로그아웃 버튼 클릭 시 처리
	    $("#logoutBtn").on("click", function () {
	    	alert("로그아웃 성공");
	        // 로그아웃이 성공하면 버튼 갱신
	        checkLoginStatus();
	        toggleBtn();
	    });
	});


</script>
