<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp" %>

<style>
.dd{
	align-items: flex-end;
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
                                <img src="" class="img-fluid rounded" alt="Image" id="image1">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h4 class="fw-bold mb-3" id="goods_title"></h4>
                           <p class="mb-3" id="goods_category"></p>
                           <h5 class="fw-bold mb-3">1kg / <i id="goods_price">100원</i></h5>
                           <div class="d-flex mb-4">
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star text-secondary"></i>
                               <i class="fa fa-star"></i>
                           </div>
                           <p class="mb-4" id="goods_content"></p>
                        <div class="input-group quantity mb-5" style="width: 100px;">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control form-control-sm text-center border-0" id="addCnt" value="1">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" id="modifyBtn"><i class="fa fa-shopping-bag me-2 text-primary"></i> 수정</a>
                        <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" id="deleteBtn"><i class="fa fa-shopping-bag me-2 text-primary"></i> 삭제</a>
                        <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" id="addCart"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니에 담기</a>
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
                        
                        <!-- 리뷰 리스트 -->
                            <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
	                            	<input type="hidden" id="goods_num" name="goods_num" value="${goods_num}"/>
<!--                                 <h3 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">3개의 리뷰</h3> -->
                                
                                	<div id="review-container">
		                                
                                	</div>
                            </div>
                        <!--  리뷰 리스트 끝 -->
                        </div>
                    </div>
                    
                     
                    
                </div>
            </div>


            
        </div>
   </div>
</div>


<script src="/resources/js/shop/detail.js" type="text/javascript"></script>
<%@include file="includes/footer.jsp" %>

<script>
$(document).ready(function () {
    // URL에서 goods_num 추출
    const urlParams = new URLSearchParams(window.location.search);
    const goodsNumFromUrl = urlParams.get('detail');

    // goods_num값을 input에 설정
    $('#goods_num').val(goodsNumFromUrl);

    // 리뷰 탭 누르면 리뷰 리스트 가져오기
    $("#nav-mission-tab").on('click', function () {
        $.ajax({
            url: '/getReviewlist',
            method: 'POST',
            data: { goods_num: $('#goods_num').val() },
            dataType: "json",
            success: function (response) {
            	console.log("리뷰응답"+response);
                displayReviews(response);
            },
            error: function (error) {
                console.error('리뷰를 불러오는 중 에러 발생:', error);
            }
        });
    });
});


// 리뷰 표시하는 함수
function displayReviews(reviews) {
    var reviewContainer = $('#review-container');
    reviewContainer.empty(); // 기존 리뷰 비우기

    for (var i = 0; i < reviews.length; i++) {
        var list = reviews[i];

        if (list.reviewVo) {
        	// null 처리 추가
        	// 날짜를 'yy-mm-dd' 형식으로 형식화
            var formattedDate = list.reviewVo.review_date ? formatDate(new Date(list.reviewVo.review_date)) : 'null';
            
            // 이미지 가져오기
            var imageSrc = list.reviewVo.image_folder_num && list.imageVo && list.imageVo.image1 ?
                '/resources/upload/review/' + list.reviewVo.image_folder_num + '/' + list.imageVo.image1 : '/path/to/default-image.jpg';

            var reviewHtml =
                '<div class="d-flex dd">\n' +
                    '<img src="' + imageSrc + '" class="img-fluid p-3" style="width: 195px; height: 160px;" alt="">\n' +
                    '<div class="">\n' +
                      '<p class="mb-2" style="font-size: 14px;">' + formattedDate + '</p>\n' +
                        '<div class="d-flex">\n' +
                            '<h5>' + (list.userVo && list.userVo.user_nickname ? list.userVo.user_nickname : 'null') + '</h5>\n' +
                            '<div class="d-flex mb-3">\n';

            // 별점 불러오기
            for (var j = 1; j <= 5; j++) {
                if (j <= (list.reviewVo ? list.reviewVo.review_score : 0)) {
                    reviewHtml += '<i class="fa fa-star text-secondary"></i>';
                } else {
                    reviewHtml += '<i class="fa fa-star"></i>';
                }
            }

            reviewHtml += '</div>\n' +
                '</div>\n' +
                '<p class="text-dark">' + (list.reviewVo ? list.reviewVo.review_content : '') + '</p>\n' +
                '</div>\n' +
                '</div>\n';

            reviewContainer.append(reviewHtml);
        }
    }
}

//날짜를 'yy-mm-dd' 형식으로 형식화하는 함수
function formatDate(date) {
    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}

</script>