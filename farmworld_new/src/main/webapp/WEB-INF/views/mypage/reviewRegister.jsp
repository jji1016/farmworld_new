<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../includes/header.jsp" %>
<style>
#box {
    display: flex !important;
    flex-direction: column;
    display: flex;
  	flex-direction: column;
  	align-items: center; 
  	justify-content: center;
}
.btn-primary{
	color: white !important;
}
#reviewBtn {
    width: 30% !important;
    margin: 3%;
}
#button2 {
    width: 30% !important;
    margin: 3%;
}
/* .rvStar{ */
/* 	font-size: xx-large; */
/* } */
.rvScore{
/* 	display: flex; */
/*     justify-content: space-evenly; */
/*     align-items: center; */
    font-size: x-large;
}
.mb{
	margin-bottom: 3%;
}
.rbt{
	margin-bottom: 8%;
}
#producttable{
	margin-bottom: 3%;
}
#producttable td{
	padding: 3% !important;
}
#producttable td:first-child{
	width: 75%;
}
#producttable td:second-child{
	
}
#boxbutton{
	width: 70%;
    display: flex;
    text-align: center;
    justify-content: center;
    place-self: center !important;
    color: white !important;
}
/* #box{ */
/* 	display: flex; */
/*     justify-content: space-evenly; */
/* } */
#reviewBtn:hover{
	color: black !important
}
#button2:hover{
	color: black !important
}
</style>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->

<div class="container-fluid fruite py-5">
    <div class="container py-5">
		<h1 class="mb-4">리뷰쓰기</h1>
	    <div class="container py-5">
			<form action="/mypage/reviewAdd" method="POST" id="reviewForm" enctype="multipart/form-data">
				<div id="box" class="service-item bg-light d-flex p-4">
				    <div class="bg-light rounded" style="padding: 30px;">
<!-- 				    		<div class="rbt btn-box"> -->
<!-- 				            	<input type="file" name="image1" accept=".jpg,.jpeg,.png" id="ReviewImg"  -->
<!-- 				          			class="btn px-3 rounded position-absolute" > -->
<!-- 				      		</div> -->
				      		
				      		<div>
							<table id="producttable">
								<tr>
									<td>
										<img id="img" src="" class="border-0 py-2 mb-2"  value="">
										<input type="file" name="image1" accept=".jpg,.jpeg,.png" id="ReviewImg" required="required">
									</td>
								</tr>
							</table>
						</div>
						<label id="review_score" for="inputDoctorName">상품 만족도</label>
							<div class="rvScore mb col-12">
								<span>
									<i class="fa fa-star rvStar" data-star="1"></i>
								    <i class="fa fa-star rvStar" data-star="2"></i>
								    <i class="fa fa-star rvStar" data-star="3"></i>
								    <i class="fa fa-star rvStar" data-star="4"></i>
								    <i class="fa fa-star rvStar" data-star="5"></i>
								</span><div id="reviewText" style="color:red;"></div><br>
							</div>
		            		<input type="hidden" name="review_score" id="review_score_input" value="0">
			            	<input type="hidden" name="order_num" value="${order_num}">
			            	<input type="hidden" name="goods_num" value="${goods_num}">
			                <label id="reviewtitle" for="inputDoctorName">상품평가</label><br>
			                <textarea name="review_content" class="form-control bg-white border-0" rows="2" placeholder="내용" id="review_content" required="required"></textarea>
				        </div>
				            
			            <div id="boxbutton">
			                <button class="btn btn-primary w-100 py-2" type="button" id="reviewBtn">등록하기</button>
							<button id="button2" class="btn btn-primary w-100 py-2" onclick="window.location.href='/mypage/review'">목록</button>	
			            </div>
				            
					</div>
			    </form>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">

let selectedStars = 0; //전역변수 선언

//별점 기능
document.addEventListener('DOMContentLoaded', function () {
    const stars = document.querySelectorAll('.rvStar');
	
    stars.forEach(star => {
        star.addEventListener('click', function () {
            const clickedStarValue = parseInt(this.getAttribute('data-star'));

            //사용자가 선택한 별 개수 저장
            selectedStars = clickedStarValue;
            
            $("#reviewText").text(""); //만족도 선택 시 안내문구 초기화
            $("#reviewBtn").attr("type", "submit"); //폼 제출 허용
            
            //별 색깔 변경
            stars.forEach((s, index) => {
                if (index < clickedStarValue) {
                    s.classList.add('text-secondary');
                } else {
                    s.classList.remove('text-secondary');
                }
            });
            
           	//선택된 별의 개수를 hidden input에 설정
           	document.getElementById('review_score_input').value = selectedStars;
            
            console.log('Selected Stars: ' + selectedStars);
        });
    });
});

$("#reviewBtn").click(function (event) {
	console.log("클릭");
	// 만족도 필수 선택 안내
	if(selectedStars === 0){
		$("#reviewText").text("만족도를 평가해주세요.");
	}
})

//이미지 확장자 검사
function validateType(file) {
    const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
    return allowedExtensions.test(file.name);
}

//이미지 변화 감지 후 미리보기
document.getElementById("ReviewImg").addEventListener('change', function(e){
    let elem = e.target;
    if(validateType(elem.files[0])){
        let preview = document.querySelector("#img");
        preview.src = URL.createObjectURL(elem.files[0]); //파일 객체에서 이미지 데이터 가져옴.
        preview.onload = function() {
            URL.revokeObjectURL(preview.src); //URL 객체 해제
        }
    } else {
    	alert("이미지 파일이 아닙니다.");
        console.log('이미지 파일이 아닙니다.');
    }
});

</script>