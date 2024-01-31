<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../includes/header.jsp" %>
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
#box{
	display: flex;
    justify-content: space-evenly;
}
</style>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->

<div class="container-fluid py-5 mt-5">
    <div class="container py-5" id="box">
        
			<div class="col-lg-6">
				<div class="bg-light rounded p-5">
					<h3 class="text-uppercase border-start border-5 border-primary ps-3 mb-4">리뷰쓰기</h3>
					<form action="/mypage/reviewRegister" method="POST" id="reviewForm" enctype="multipart/form-data">
				    	<div class="row g-3">
				    		<div class="rbt btn-box">
				            	<input type="file" name="image1" accept=".jpg,.jpeg,.png" id="ReviewImg" 
				          			class="btn px-3 rounded position-absolute" >
				      		</div>
				       		<div class="rvScore mb col-12">
							<label id="review_score" for="inputDoctorName">상품 만족도</label>
								<span>
									<i class="fa fa-star rvStar" data-star="1"></i>
								    <i class="fa fa-star rvStar" data-star="2"></i>
								    <i class="fa fa-star rvStar" data-star="3"></i>
								    <i class="fa fa-star rvStar" data-star="4"></i>
								    <i class="fa fa-star rvStar" data-star="5"></i>
								</span>
				            </div>
				            
				            <div class="mb col-12">
				            	<input type="hidden" name="review_score" id="review_score_input" value="0">
				            	<input type="hidden" name="order_num" value="${order_num}">
				            	<input type="hidden" name="goods_num" value="${goods_num}">
				                <textarea name="review_content" class="form-control bg-white border-0" rows="5" placeholder="내용" id="review_content"></textarea>
				            </div>
				            
				            <div class="col-12">
				                <button class="btn btn-primary w-100 py-3" type="submit" id="reviewBtn">등록하기</button>
				            </div>
				        </div>
				    </form>
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

         	// 선택된 별의 개수를 hidden input에 설정
            document.getElementById('review_score_input').value = selectedStars;
            
            console.log('Selected Stars: ' + selectedStars);
        });
    });
});

</script>