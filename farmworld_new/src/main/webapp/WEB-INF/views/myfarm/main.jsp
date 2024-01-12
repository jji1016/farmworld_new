<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->

        
<!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">My Farm</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
	                    <form id="searchForm" action="/myfarm/farmlist" method="get" onsubmit="return validateKeyword()">
	                        <div class="row g-4">
	                            <div class="col-xl-3">
	                            
	                                <div class="input-group w-100 mx-auto d-flex">
	                                    <input type='text' class="form-control p-3" placeholder="keywords"  name='keyword'
											value='<c:out value="${pageMaker.cri.keyword}"/>'>
	                                    <span id="search-icon-1" class="input-group-text p-3"><button class="btn btn-default"><i class="fa fa-search"></i></button></span>
	                                </div>
	                            </div>
	                            <div class="col-6"></div>
	                            <div class="col-xl-3">
	                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
	                                    <label for="type">검색 조건</label>
	                                    <select id="type" name="fruitlist" class="border-0 form-select-sm bg-light me-3">
		                                     <option value="TW" 
		                                     	<c:out value="${pageMaker.cri.type == 'TW'?'selected':''}"/>>전체</option>
		                                     <option value="T" 
		                                     	<c:out value="${pageMaker.cri.type == 'T'?'selected':''}"/>>농장 이름</option>
		                                     <option value="W" 
		                                     	<c:out value="${pageMaker.cri.type == 'W'?'selected':''}"/>>농장주</option>
	                                    </select>
	                                </div>
	                            </div>
	                        </div>
	                    </form>
	                    <div class="pull-right">
                            	<ul class="pagination">
                            		<c:if test="${pageMaker.prev }">
                            			<li class="paginate_button previous" ><a href="${pageMaker.startPage -1}">prev</a></li>
                            		</c:if>
                            		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
                            			<li class="paginate_button  ${pageMaker.cri.pageNum == num ? 'active': '' }" ><a href="${num }">${num }</a></li>
                            		</c:forEach>
                            		<c:if test="${pageMaker.next }">
                            			<li class="paginate_button next" ><a href="${pageMaker.endPage + 1}">Next</a></li>
                            		</c:if>
                            	</ul>
                            </div>
	                    <form id="actionForm" action="/myfarm/farmlist" method="get">
                            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                            	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                            	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                            </form>
                        <div class="row g-4">
                        
                        <!-- 내 농장 바로가기 -->
                            <div class="col-lg-3">
                                <div class="col-md-6 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
			                        <div class="team-item border-top border-5 border-primary rounded shadow overflow-hidden">
			                            <div class="text-center p-4">
			                                <img class="img-fluid rounded-circle mb-4" src="/resources/img/team-1.jpg" alt="">
			                                <h5 class="fw-bold mb-1">내 농장 <br>바로가기</h5>
			                            </div>

			                        </div>
			                    </div>
                            </div>
                        <!-- 내 농장 바로가기 끝 -->
                        
                        <!-- 인기농장  -->
                            <div class="col-lg-9">
                            
                            	<div class="mx-auto text-center mb-5" style="max-width: 500px;">
					                <h1 class="display-5">인기 농장</h1>
					            </div>
            
				                
                                <div class="row g-4 justify-content-center" id="myfarminput1">
                                    
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="row g-0">
						                        <div class="col-10">
						                            <div class="position-relative">
						                                <img class="img-fluid w-100" src="/resources/img/team-2.jpg" alt="">
						                                <div class="position-absolute start-0 bottom-0 w-100 py-3 px-4" style="background: rgba(52, 173, 84, .85);">
						                                    <h4 class="text-white">Farmer Name</h4>
						                                    <span class="text-white">Designation</span>
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col-2">
<!-- 						                            <div class="h-100 d-flex flex-column align-items-center justify-content-around bg-secondary py-5">
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-twitter text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-facebook-f text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-linkedin-in text-secondary"></i></a>
						                                <a class="btn btn-square rounded-circle bg-white" href="#"><i class="fab fa-instagram text-secondary"></i></a>
						                            </div> -->
						                        </div>
                    						</div>
                                        </div>
                                    </div>
                                    
   
                                </div>
                            </div>
                        </div>
                        <!-- 상품 끝 -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script>
		function validateKeyword() {
	        var keyword = document.forms["searchForm"]["keyword"].value;
	        if (keyword.length === 1) {
	            alert("검색어는 2자 이상으로 입력해주세요.");
	            return false;
	        }
	        return true;
	    }
		    $(document).ready(function() {
		        $('.register-div').click(function() {
		            // jQuery를 사용하여 /myfarm/register로 이동
		            // 이동하기 전에 세션에 user_num이 있는지 확인
		            $.ajax({
		                url: '/myfarm/checkSession',  // 세션 체크를 처리하는 컨트롤러 엔드포인트
		                type: 'GET',
		                success: function(response) {
		                    if (response.hasUserNum) {
		                        // 세션에 user_num이 있으면 /myfarm/register로 이동
		                        window.location.href = '/myfarm/register';
		                    } else {
		                        // 세션에 user_num이 없으면 /login으로 이동
		                        alert("로그인을 해주세요!");
		                        window.location.href = '/login';
		                    }
		                },
		                error: function(error) {
		                    console.log('세션 체크 에러:', error);
		                }
		            });
		        });
		    });
		</script>
		
<script type="text/javascript">
	$(document).ready(function() {
		
		loadTableData(); // Ajax 실행 함수 호출
		
		function loadTableData() {

			$.ajax({
				url: "/myfarm/getlist", 
				type: "POST", 
				dataType : "json",
				data:{
					type : $("#type").val(),
					keyword : $("#searchForm").find("input[name='keyword']").val(),
					pageNum: $("#actionForm").find("input[name='pageNum']").val(),
					amount: $("#actionForm").find("input[name='amount']").val()
				},
				success: function(data){
					let myFarmBody = $("#myfarminput1");
					
					$.each(data, function(index,myfarm){

						let row ="";
						row+=("<div class='col-md-6 col-lg-6 col-xl-4'>");
						row+=("<div class='rounded position-relative fruite-item'>");
						row+=("<div class='row g-0'>");
						row+=("<div class='col-10'>");
						row+=("<div class='position-relative'>");
						row+=("<img src='/resources/img/team-2.jpg' class='card-img-top fixed-size-image' alt='농장 이미지'>");
						row+=("<div class='position-absolute start-0 bottom-0 w-100 py-3 px-4' style='background: rgba(52, 173, 84, .85);'>");
						row+=("<h4 class='text-white'>"+myfarm.farm_name+"</h4>");
						let intro = myfarm.farm_intro;
	                        for (let i = 0; i < intro.length; i++) {
	                            row += intro[i];
	                            if ((i + 1) % 17 === 0) {
	                                row += "<br>";
	                            }
	                        }
						row+=("</div></div></div></div></div></div>");

						
						myFarmBody.append(row);
						
					});
				},
				error: function(e){
					console.log(e);
				}

			});
		
			let actionForm = $("#actionForm");
			var searchForm = $("#searchForm");
			
			$(".paginate_button a").on("click", function(e) {
				e.preventDefault(); // 기존에 가진 이벤트를 중단
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$("#searchForm button").on("click", function(e) {
			searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchForm.submit();
			});
		}

		}); // -- $(document).ready 함수 선언 종료
</script>
                        
                        
<%@include file="../includes/footer.jsp" %>