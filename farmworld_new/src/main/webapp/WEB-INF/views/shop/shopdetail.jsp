<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
<style>
.rvStar{
	font-size: xx-large;
}
.rvScore{
	display: flex;
    justify-content: space-evenly;
    align-items: center;
    font-size: x-large;
}
.mb{
	margin-bottom: 3%;
}
.rbt{
	margin-bottom: 8%;
}

</style>


<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->


<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <div class="row g-4 mb-5">
        
        <!-- 카테고리 -->
            <div class="col-lg-4 col-xl-3">
                <div class="row g-4 fruite">
                    <div class="col-lg-12">
                        <div class="mb-4">
                            <h4>Categories</h4>
                            <ul class="list-unstyled fruite-categorie">
                                <li>
                                    <div class="d-flex justify-content-between fruite-name">
                                     <a href="#"><i class="fas fa-apple-alt me-2"></i>과일</a>
                                    <span>(3)</span>
                                </div>
                            </li>
                            <li>
                                <div class="d-flex justify-content-between fruite-name">
                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>야채</a>
                                    <span>(5)</span>
                                </div>
                            </li>
                            <li>
                                <div class="d-flex justify-content-between fruite-name">
                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>채소</a>
                                    <span>(2)</span>
                                </div>
                            </li>
                            <li>
                                <div class="d-flex justify-content-between fruite-name">
                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>견과류</a>
                                    <span>(8)</span>
                                </div>
                            </li>
                            <li>
                                <div class="d-flex justify-content-between fruite-name">
                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>곡물</a>
                                    <span>(5)</span>
                                    </div>
                                </li>
                               <li>
                                <div class="d-flex justify-content-between fruite-name">
                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>씨앗</a>
                                    <span>(5)</span>
                                    </div>
                                </li>	
                           	   <li>
                                <div class="d-flex justify-content-between fruite-name">
                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>농기구</a>
                                    <span>(5)</span>
                                    </div>
                                </li>	
                            </ul>
                        </div>
                    </div>
                    
                </div>
            </div>
        <!-- 카테고리 끝 -->
        
			<div class="col-lg-8 col-xl-9">
                <div class="row g-4">
                    <div class="col-lg-6">
                        <div class="border rounded">
                            <a href="#">
                                <img src="img/single-item.jpg" class="img-fluid rounded" alt="Image">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h4 class="fw-bold mb-3">브로콜리</h4>
                           <p class="mb-3">채소</p>
                           <h5 class="fw-bold mb-3">1kg / 100원</h5>
                           <div class="d-flex mb-4">
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star"></i>
                           </div>
                           <p class="mb-4">브로콜리는</p>
                           <p class="mb-4">맛없어!</p>
                        <div class="input-group quantity mb-5" style="width: 100px;">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니에 담기</a>
                       </div>
                    <div class="col-lg-12">
                        <nav>
                            <div class="nav nav-tabs mb-3">
                                <button class="nav-link border-white border-bottom-0 active" type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about" aria-controls="nav-about" aria-selected="true">상품 설명</button>
                                <button class="nav-link border-white border-bottom-0" type="button" role="tab" id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission" aria-controls="nav-mission" aria-selected="false">리뷰</button>
                            </div>
                        </nav>
                        <div class="tab-content mb-5">
                        
                        <!-- 상품 설명 -->
                            <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                <p>The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc. 
                                    Susp endisse ultricies nisi vel quam suscipit </p>
                                <p>Sabertooth peacock flounder; chain pickerel hatchetfish, pencilfish snailfish filefish Antarctic 
                                    icefish goldeye aholehole trumpetfish pilot fish airbreathing catfish, electric ray sweeper.</p>
                                <div class="px-2">
                                    <div class="row g-4">
                                        <div class="col-6">
                                            <div class="row bg-light align-items-center text-center justify-content-center py-2">
                                                <div class="col-6">
                                                    <p class="mb-0">Weight</p>
                                                </div>
                                                <div class="col-6">
                                                    <p class="mb-0">1 kg</p>
                                                </div>
                                            </div>
                                            <div class="row text-center align-items-center justify-content-center py-2">
                                                <div class="col-6">
                                                    <p class="mb-0">Country of Origin</p>
                                                </div>
                                                <div class="col-6">
                                                    <p class="mb-0">Agro Farm</p>
                                                </div>
                                            </div>
                                            <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                <div class="col-6">
                                                    <p class="mb-0">Quality</p>
                                                </div>
                                                <div class="col-6">
                                                    <p class="mb-0">Organic</p>
                                                </div>
                                            </div>
                                            <div class="row text-center align-items-center justify-content-center py-2">
                                                <div class="col-6">
                                                    <p class="mb-0">Сheck</p>
                                                </div>
                                                <div class="col-6">
                                                    <p class="mb-0">Healthy</p>
                                                </div>
                                            </div>
                                            <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                <div class="col-6">
                                                    <p class="mb-0">Min Weight</p>
                                                </div>
                                                <div class="col-6">
                                                    <p class="mb-0">250 Kg</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <!-- 상품설명 끝 -->
                        
                        <!-- 리뷰 -->
                            <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                            
                                <!-- 리뷰 리스트 -->
                                <h3 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">3개의 리뷰</h3>
                                
                                <c:forEach var="vo" items="${reviewVOList}">
	                                <div class="d-flex">
	                                    <img src='<c:out value="${vo.user_image}"/>' class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt="">
	                                    <div class="">
	                                        <p class="mb-2" style="font-size: 14px;"><c:out value="${vo.review_date}"/></p>
	                                        <div class="d-flex justify-content-between">
	                                            <h5><c:out value="${review.username}"/></h5>
	                                            
	                                            <!-- 별점 불러오기 -->
	                                            <div class="d-flex mb-3">
	                                            	<c:forEach var="i" begin="1" end="${vo.review_score}">
	                                            		<i class="fa fa-star"></i>
	                                            	</c:forEach>
	                                            	<c:forEach var="i" begin="${vo.review_score}" end="5">
							                            <i class="fa fa-star text-secondary"></i>
							                        </c:forEach>
	                                            </div>
	                                            
	                                        </div>
	                                        <p><c:out value="${vo.review_content}"/></p>
	                                    </div>
	                                </div>
                                </c:forEach>
                                
                                <!-- 리뷰 쓰기 -->
			                    <div class="bg-light rounded p-5">
				                    <h3 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">리뷰쓰기</h3>
				                    <form>
				                        <div class="row g-3">
				                        	<div class="rvScore mb col-12">
				                        		<label id="reviewtitle" for="inputDoctorName">상품 만족도</label>
												<span>
												<i class="fa fa-star rvStar" data-star="1"></i>
										        <i class="fa fa-star rvStar" data-star="2"></i>
										        <i class="fa fa-star rvStar" data-star="3"></i>
										        <i class="fa fa-star rvStar" data-star="4"></i>
										        <i class="fa fa-star rvStar" data-star="5"></i>
												</span>
				                            </div>
				                            <div class="mb col-12 col-sm-6">
				                                <input type="text" class="form-control bg-white border-0" placeholder="닉네임" style="height: 55px;" 
				                                	readonly="readonly"	value="<c:out value="${user_nickname}"/>" id="user_name">
				                            </div>
				                            <div class="mb col-12 col-sm-6">
				                                <input type="text" class="form-control bg-white border-0" placeholder="작성일" style="height: 55px;"
				                                	readonly="readonly" value="" id="review_date">
				                            </div>
				                            <div class="mb col-12">
				                                <textarea class="form-control bg-white border-0" rows="5" placeholder="내용" id="review_content"></textarea>
				                            </div>
				                            <div class="rbt btn-box">
								                <input type="file" name="user_image" accept=".jpg,.jpeg,.png" id="user_image" 
								              	class="btn px-3 rounded position-absolute" >
								          	</div>
				                            <div class="col-12">
				                                <button class="btn btn-primary w-100 py-3" type="submit" id="reviewBtn">등록하기</button>
				                            </div>
				                        </div>
				                    </form>
				                </div>
			                   <!-- 리뷰 쓰기 끝 -->
                            </div>
                            <!--  리뷰 리스트 끝 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>

<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">

//별점 기능
document.addEventListener('DOMContentLoaded', function () {
    const stars = document.querySelectorAll('.rvStar');
    let selectedStars = 0;

    stars.forEach(star => {
        star.addEventListener('click', function () {
            const clickedStarValue = parseInt(this.getAttribute('data-star'));

            // 사용자가 몇 번째 별을 선택했는지 저장
            selectedStars = clickedStarValue;

            // 별 색깔 변경
            stars.forEach((s, index) => {
                if (index < clickedStarValue) {
                    s.classList.add('text-secondary');
                } else {
                    s.classList.remove('text-secondary');
                }
            });

            //선택된 별의 개수(selectedStars)를 서버에 전달
            console.log('Selected Stars: ' + selectedStars);
            
            $.ajax({
                url: "/shop/addReview",
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
            
        });
    });
});




</script>