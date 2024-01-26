<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<style type="text/css">
@media (max-width: 770px) {
    .row {
        font-size: 7px; /* 필요에 따라 조절 가능한 글자 크기 */
    }
}

/* 화면 폭이 992px 이하일 때 글자 크기를 조절 */
@media (max-width: 995px) {
    .row {
        font-size: 12px; /* 필요에 따라 조절 가능한 글자 크기 */
    }
}
#footerBox1 {
  width: 35% !important;
  margin-left: 3%;
  margin-right: 3%;
  border-right: 1px solid rgba(226, 175, 24, 0.5)
  
}#footerBox2 {
  width: 15% !important;
  margin-left: 3%;
}
#footerBox3 {
  width: 30% !important;
  margin-left: 3%;
}
.img-fluid {
    clip-path: polygon(0 0, 50% 0, 50% 100%, 0 100%);
}


</style>
</head>

<!-- Footer Start -->
        <div id="footdiv" class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#">
                                <h1 class="text-primary mb-0">Fruitables</h1>
                                <p class="text-secondary mb-0">Fresh products</p>
                            </a>
                        </div>
                        <div class="col-lg-3">
                            <div class="d-flex justify-content-end pt-3">
                                <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div id="footerBox1" class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">100만 농부 육성을 꿈꾼다</h4>
                            <p class="mb-4">쉽게 키우는 작물 가이드 제공,<br>농부들만의 꿀팁 공유,<br>농기구와 농작물 직거래까지<br>Farm World에서 누려보세요</p>
                        </div>
                    </div>
                    <div id="footerBox2" class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3">Account</h4>
                            <a class="btn-link" href="/mypage/myPageMain">My Account</a>
                            <a class="btn-link" href="/shopmain">Shop</a>
                            <a class="btn-link" href="/cartMain">Shopping Cart</a>
                        </div>
                    </div>
                    <div id="footerBox3" class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Contact</h4>
                            <p>Address: 서울 관악구 봉천로 227</p>
                            <p>Email: FarmWorld@gmail.com</p>
                            <p>Phone: +010 - 1234 - 5678</p>
                            <p>Payment Accepted</p>
                            <img src="/resources/img/payment.png" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Copyright Start -->
        <div id="footdiv" class="container-fluid copyright bg-dark py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-end text-white">
                        <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                        <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                        <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->



        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    
    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
    
    <!-- 회원가입 유효성 검사 -->
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	
	<div id="lightboxOverlay" tabindex="-1" class="lightboxOverlay" style="display: none;"></div>
	<div id="lightbox" tabindex="-1" class="lightbox" style="display: none;">
		<div class="lb-outerContainer">
			<div class="lb-container">
				<img class="lb-image" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="">
					<div class="lb-nav">
						<a class="lb-prev" role="button" tabindex="0" aria-label="Previous image" href=""></a>
						<a class="lb-next" role="button" tabindex="0" aria-label="Next image" href=""></a>
					</div>
					<div class="lb-loader">
						<a class="lb-cancel" role="button" tabindex="0"></a>
					</div>
			</div>
		</div>
		<div class="lb-dataContainer">
			<div class="lb-data">
				<div class="lb-details">
					<span class="lb-caption"></span>
					<span class="lb-number"></span>
				</div>
				<div class="lb-closeContainer">
					<a class="lb-close" role="button" tabindex="0"></a>
				</div>
			</div>
		</div>
	</div>
</body>

</html>