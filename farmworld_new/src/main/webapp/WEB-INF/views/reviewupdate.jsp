<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style type="text/css">
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
#productreview{
	display: block
}
</style>

</head>


<%@include file="includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->
    
<!-- 상단 -->
<div class="container-fluid fruite py-5">
	<div class="container py-5">
        <h1 class="mb-4">리뷰수정</h1>
        <div class="container py-5">
			<div class="col-md-6 col-lg-4 mt-lg-n5">
				<table>
					<tr>
						<th>
							<div id="productinfo" class="bg-light rounded" style="padding: 30px;">
						        <input type="text" class="form-control border-0 py-2 mb-2" placeholder="Name">
						        <input type="email" class="form-control border-0 py-2 mb-2" placeholder="Email">
						        <textarea class="form-control border-0 mb-2" rows="2" placeholder="Message"></textarea>
						        <button class="btn btn-primary w-100 py-2">Send Message</button>
						   	</div>
			    		</th>
						<th>
							<div id="productinfo" class="bg-light rounded" style="padding: 30px;">
						        <input type="text" class="form-control border-0 py-2 mb-2" placeholder="Name">
						        <input type="email" class="form-control border-0 py-2 mb-2" placeholder="Email">
						        <textarea class="form-control border-0 mb-2" rows="2" placeholder="Message"></textarea>
						        <button class="btn btn-primary w-100 py-2">Send Message</button>
						   	</div>
			    		</th>
			    	</tr>
				</table>
			    
		</div>
	</div>
</div>
      
	    <!-- 구매내역 / 판매내역 / 리뷰 / 취소 -->
	    <div class="container-fluid py-5">
	        <div class="container">
	            <div class="row g-5">
	                <div class="col-md-6">
	                    <div class="service-item bg-light d-flex p-4">
	                        <i class="flaticon-house display-1 text-primary me-4"></i>
	                        <div>
	                            <h5 class="text-uppercase mb-3">Pet Boarding</h5>
	                            <p>Kasd dolor no lorem sit tempor at justo rebum rebum stet justo elitr dolor amet sit</p>
	                            <a class="text-primary text-uppercase" href="">Read More<i class="bi bi-chevron-right"></i></a>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-md-6">
	                    <div class="service-item bg-light d-flex p-4">
	                        <i class="flaticon-food display-1 text-primary me-4"></i>
	                        <div>
	                            <h5 class="text-uppercase mb-3">Pet Feeding</h5>
	                            <p>Kasd dolor no lorem sit tempor at justo rebum rebum stet justo elitr dolor amet sit</p>
	                            <a class="text-primary text-uppercase" href="">Read More<i class="bi bi-chevron-right"></i></a>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-md-6">
	                    <div class="service-item bg-light d-flex p-4">
	                        <i class="flaticon-grooming display-1 text-primary me-4"></i>
	                        <div>
	                            <h5 class="text-uppercase mb-3">Pet Grooming</h5>
	                            <p>Kasd dolor no lorem sit tempor at justo rebum rebum stet justo elitr dolor amet sit</p>
	                            <a class="text-primary text-uppercase" href="">Read More<i class="bi bi-chevron-right"></i></a>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-md-6">
	                    <div class="service-item bg-light d-flex p-4">
	                        <i class="flaticon-cat display-1 text-primary me-4"></i>
	                        <div>
	                            <h5 class="text-uppercase mb-3">Pet Training</h5>
	                            <p>Kasd dolor no lorem sit tempor at justo rebum rebum stet justo elitr dolor amet sit</p>
	                            <a class="text-primary text-uppercase" href="">Read More<i class="bi bi-chevron-right"></i></a>
	                        </div>
	                    </div>
	                </div>
	             
	        </div>
	    </div>
	    <!-- 구매내역 / 판매내역 / 리뷰 / 취소 끝 -->
                 
                </div>
            </div>
        </div>
        <!-- Tastimonial End -->
 						                        
                        
<%@include file="includes/footer.jsp" %>