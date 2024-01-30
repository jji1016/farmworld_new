<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<style type="text/css">

@charset "UTF-8";
#leftPart{
	width: 30%;
	height: 60%;
	text-align: -webkit-match-parent;
}
.col-lg-3 {
    flex: 0 0 auto;
    display: table-cell;
}
#boxsize {
    flex: 0 0 auto;
    width: 100%;
}
#leftbox {
    width: 100%;
    height: 100%;
}
#leftimg {
    max-width: 50%;
    height: 15%;
}
#rightPart{
	width: 70%;
	height: 60%;
	text-align: -webkit-match-parent;
}
.book_section form {
	box-shadow: 0 0.5rem 1rem rgba(0,0,0,.15) !important;
	border-top: 1px solid #dee2e6 !important;
	border-radius: 10px !important;
	border-width: 5px !important;
	border-color: #81c408 !important;
	display: block;
	box-sizing: border-box;
	padding: 5%;
    padding-bottom: 10%;
}
.form-row{
	width: 100%;
}
.book_section form .form-control {
    width: 100%;
    background-color: transparent;
    border: 1px solid #88b44e;
    height: 12%;
    outline: none;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-radius: 5px;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    display: block;
}
.book_section form button.btn {
    background-color: #88b44e;
    color: #ffffff;
    padding: 2% 4%;
    border-radius: 5px;
    margin-top: 2%;
    text-transform: uppercase;
   	float : right;
}
#productinfo{
	display: block
}
#productimg{
	width: 100% ;
	max-width: 500px;
    display: flex;
    justify-content: center;
    place-self: center;
}
#box {
    display: flex !important;
    flex-direction: column;
    display: flex;
  	flex-direction: column;
  	align-items: center; 
  	justify-content: center;
}
#button1 {
    width: 30% !important;
    margin: 3%;
}
#button2 {
    width: 30% !important;
    margin: 3%;
}
#button3 {
    width: 100% !important;
    margin-right: 3%;
    margin-top: 200%;
}
#boxbutton{
	width: 70%;
    display: flex;
    text-align: center;
    justify-content: center;
    place-self: center !important;
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
#reviewtitle{
	margin-bottom: 1%;
}
#reviewscore{
	margin-bottom: 5% !important;
	background-color: white !important;
}
</style>
</head>

<%@include file="../includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->
    
<!-- 상단 -->
<div class="container-fluid fruite py-5">
	<div class="container py-5">
        <h1 class="mb-4">리뷰수정</h1>
        <div class="container py-5">
        	<form name="updatereview" id="updateReviewForm" action="/mypage/updatereview" method="post" enctype="multipart/form-data">
       			<div id="box" class="service-item bg-light d-flex p-4">
					<div class="bg-light rounded" style="padding: 30px;">
						<div>
							<table id="producttable">
								<tr>
									<td>
										<img id="productimg" src="/resources/upload/review/${getreview.image_folder_num}/${getreviewVOimage.image1}" class="border-0 py-2 mb-2"  value="${getimage.image1}">
										<input type="file" name="file" id="file" accept=".jpg, .jpeg, .png" onchange="previewImage(event)">
									</td>
								</tr>
							</table>
						</div>
						<label id="reviewtitle" for="inputDoctorName">상품 만족도</label><br>
                   <%--      <div class="d-flex mb-3">
		                  	<c:forEach var="i" begin="1" end="${getreview.review_score}" >
		                  		<i class="fa fa-star text-secondary"></i>
		                  	</c:forEach>
		                  	<c:forEach var="i" begin="${getreview.review_score}" end="4">
						        <i class="fa fa-star"></i>
						    </c:forEach>
		                 </div> --%>
							<span id="starContainer" name="review_score" value="${getreview.review_score}">
								<i class="fa fa-star rvStar" data-star="1"></i>
						        <i class="fa fa-star rvStar" data-star="2"></i>
						        <i class="fa fa-star rvStar" data-star="3"></i>
						        <i class="fa fa-star rvStar" data-star="4"></i>
						        <i class="fa fa-star rvStar" data-star="5"></i>
							</span><br><br>
						<%-- <select id="reviewscore" name="review_score" class="form-control py-2 mb-2" value="${getreview.review_score}">
			               	<option value="1" <c:if test="${getreview.review_score eq 1}">selected</c:if>>'<i class="fa fa-star text-secondary"></i>' </option>
			               	<option value="2" <c:if test="${getreview.review_score eq 2}">selected</c:if>><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i> </option>
			               	<option value="3" <c:if test="${getreview.review_score eq 3}">selected</c:if>><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i> </option>
			               	<option value="4" <c:if test="${getreview.review_score eq 4}">selected</c:if>><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i> </option>
			               	<option value="5" <c:if test="${getreview.review_score eq 5}">selected</c:if>><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i><i class="fa fa-star text-secondary"></i> </option>
			         	</select> --%>
						<input type="hidden" name="review_num" value="${getreview.review_num}">
						<input type="hidden" name="review_score" value="${getreview.review_score}">
						<input type="hidden" id="folderNum" name="image_folder_num" value="${getreview.image_folder_num}">
						<input type="hidden" name="image1" value="${getreviewVOimage.image1}">
						<label id="reviewtitle" for="inputDoctorName">상품평가</label><br>
						<textarea name="review_content" class="form-control mb-2" rows="2">${getreview.review_content}</textarea>
					</div>
					<div id="boxbutton">
						<button id="button1" type="submit" class="btn btn-primary w-100 py-2" >완료</button>
						<button id="button2" class="btn btn-primary w-100 py-2" onclick="window.location.href='/mypage/review'">목록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
                        
<%@include file="../includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.4.min.js" type="text/javascript">
</script>

<script>
$(document).ready(function() {
	let a = $("#folderNum").val();
	
	var ratingValue = parseInt("${getreview.review_score}");

	// 리뷰별점 표시
	function setRating(rating) {
	    var stars = document.querySelectorAll('.rvStar');
	    for (var i = 0; i < stars.length; i++) {
	        if (i < rating) {
	            stars[i].classList.add('text-secondary');
	        } else {
	            stars[i].classList.remove('text-secondary');
	        }
	    }
	}
	setRating(ratingValue);
})


function previewImage(event) {
    if (event.target.files && event.target.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            document.getElementById('productimg').src = e.target.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    }
}


//별점 기능


document.addEventListener('DOMContentLoaded', function () {
	const form = document.getElementById('updateReviewForm');
    const stars = document.querySelectorAll('.rvStar');
    let selectedStars = 0;
    console.log('어디오나1' + selectedStars);
    stars.forEach(star => {
        star.addEventListener('click', function () {
            const clickedStarValue = parseInt(this.getAttribute('data-star'));

            console.log('어디오나2' + clickedStarValue);
            // 사용자가 몇 번째 별을 선택했는지 저장
            selectedStars = clickedStarValue;
            console.log('어디오나3' + selectedStars);
            // 별 색깔 변경
            stars.forEach((s, index) => {
                console.log('어디오나4' + index);
                if (index < clickedStarValue) {
                    s.classList.add('text-secondary');
                } else {
                    s.classList.remove('text-secondary');
                }
            });
            
            const formData = new FormData(form);
            formData.append('review_score', selectedStars);
            console.log('어디오나5' + selectedStars);
            
            //선택된 별의 개수(selectedStars)를 서버에 전달
            $.ajax({
                url: "/mypage/updatereview",
                type: "POST",
                data: new FormData(form),
                processData: false,
                contentType: false,
                dataType: "json",
                success: function (response) {
                    if (response.success) {
                        alert(response.message);
                        console.log("별점수정");
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
</html>