<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>
<%@include file="../includes/header.jsp" %>
<style type="text/css">
#leftPart{
	width: 30%;
	height: 60%;
	text-align: -webkit-match-parent;
}
.col-md-6{
	 width: 33.3% !important;
}
.col-lg-3 {
    flex: 0 0 auto;
    display: table-cell;
}
.g-5{
	display: flex !important;
    flex-direction: row;
    justify-content: space-between;
	
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
    max-width: 100%;
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
/*     color: #495057 */;
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
</style>

</head>
    
        <!-- 상단 -->
        <div class="container-fluid testimonial py-5">
            <div class="container py-5">
                <div class="testimonial-header text-center">
                	<div class="container-xxl py-5">
            			<div class="container px-lg-5">
                			<div class="section-title position-relative text-center mx-auto mb-5 pb-4 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                			</div>
                			<div class="row g-4">
                				<table>
	                				<tr>
	                					<th id="leftpart">
		                					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
			                        			<div id="leftbox" class="team-item border-top border-5 border-primary rounded shadow overflow-hidden">
			                            			<div class="text-center p-4">
			                                			<img id="leftimg" class="img-fluid rounded-circle" src="/resources/upload/profile/${vo.userVO.user_image}" alt="프로필사진">
			                                			
			                           				</div>
			                       	 			</div>
			                    			</div>
	                					</th>
	                					<th id="rightpart">
	                						<!-- book section -->
											  <section class="book_section layout_padding">
											    <div class="container">
											      <div class="row">
											        <div class="col">
											          <form>
											            <h4>
											              My <span>Page</span>
											            </h4>
											            <div class="form-row ">
											              <div id="boxsize" class="form-group col-lg-4">
											                <label for="farm_name">농장 이름</label>
											                <p id="farm_name" class="form-control" ><c:out value="${vo.farm_name}"/></p>
											              </div>
											              <div id="boxsize" class="form-group col-lg-4">
											                <label for="user_id">아이디</label>
											                <p id="user_id" class="form-control" ><c:out value="${vo.userVO.user_id}"/></p>
											              </div>
											              <div id="boxsize" class="form-group col-lg-4">
											                <label for="user_nickname">닉네임</label>
											                <p id="user_nickname" class="form-control" ><c:out value="${user_nickname}"/></p>
											              </div>
											            </div>
											            <div class="btn-box">
											              <button type="button" class="btn " onclick="goMod()">회원정보 수정</button>
											            </div>
											          </form>
											        </div>
											      </div>
											    </div>
											  </section>
											  <!-- 개인정보수정 끝 -->
	                					</th>	
	                				</tr>
                				</table>
                			</div>
            			</div>
        			</div>
        			<!-- 상단 끝 -->
      			</div>
      
	    <!-- 구매내역 / 판매내역 / 리뷰 / 취소 -->
	    <div class="container-fluid py-5">
	        <div class="container">
	            <div class="row g-5">
	                <div class="col-md-6">
	                    <div class="service-item bg-light d-flex p-4">
	                        <i class="flaticon-house display-1 text-primary me-4"></i>
	                        <div>
	                            <h5 class="text-uppercase mb-3">구매내역</h5>
	                            <a class="text-primary text-uppercase" href="/mypage/buylist">More<i class="bi bi-chevron-right"></i></a>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-md-6">
	                    <div class="service-item bg-light d-flex p-4">
	                        <i class="flaticon-grooming display-1 text-primary me-4"></i>
	                        <div>
	                            <h5 class="text-uppercase mb-3">판매내역</h5>
	                            <a class="text-primary text-uppercase" href="/mypage/selllist">More<i class="bi bi-chevron-right"></i></a>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-md-6">
	                    <div class="service-item bg-light d-flex p-4">
	                        <i class="flaticon-food display-1 text-primary me-4"></i>
	                        <div>
	                            <h5 class="text-uppercase mb-3">리뷰관리</h5>
	                            <a class="text-primary text-uppercase" href="/mypage/review">More<i class="bi bi-chevron-right"></i></a>
	                        </div>
	                    </div>
	                </div>      
		        </div>
		    </div>
	    </div>
	    <!-- 구매내역 / 판매내역 / 리뷰 / 취소 끝 -->
            </div>
        </div>
        <!-- Tastimonial End -->
                        
<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">
function goMod() {
	window.location.href = '/mypage/modify';
}
</script>









