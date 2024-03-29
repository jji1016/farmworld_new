<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.pagination {
    display: flex;
    list-style: none;
    padding: 0;
}

.paginate_button {
    margin-right: 5px; /* 각 페이지 버튼 간의 간격을 조절할 수 있습니다. */
}
.shadowhover {
	transition: box-shadow 0.3s ease;
}
#searchbox{
}
.text-intro{
	color : white;
}
/* 마우스 호버 시 스타일 변경 */
.shadowhover:hover {
	cursor: pointer; /* 마우스를 올릴 때 포인터로 변경 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* 적당한 그림자 효과 */
}
#mybox{
	margin-top: 15%;
	height:280px;
}
#myimage{
	width: 95%;
    height: 100%;
}
#type{
	width: 20%;
	border: 1px solid #ced4da !important;
}
.bg-light {
    display: flex;
    justify-content: center;
    align-items: center; 
}
#bigbox {
       display: flex;
        align-items: center;
        justify-content: center;
	margin-top: 20%;
    margin-right: 3%;
    margin-left: 3%;
    border: solid #81c408 3px;
    border-radius: 30px;
    height: 280px !important;
    box-shadow: 5px 5px 10px 0px #888888;
    position: relative;
}
#bigbox2 {
	margin-top: 10%;
    margin-right: 3%;
    margin-left: 3%;
    border: solid #81c408 3px;
    border-radius: 30px;
    height: 100px !important;
    box-shadow: 5px 5px 10px 0px #888888;
    position: relative;
}
#bigbox div{
text-align: center;
}
#bigbox2:hover{
	background-color: #81c408;
	cursor: pointer;
}
#farms{
    display: flex !important;
    flex-wrap: wrap !important;
	justify-content: center !important;
}
#myFarmLink{
	width: 100%;
	height: 100%;
	text-align: center;
    font-size: 25px;
    line-height: 266%; 
}
#myFarmLink:hover{
	color: white;
	cursor: pointer;
}
</style>

<%@include file="../includes/header.jsp" %>


<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->

        
<!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
            	<div class="row col-lg-12">
            	<div class="col-xl-3">
                	<h1 class="mb-4">My Farm</h1>
                </div>
                <div id="searchbox" class="col-xl-8">
	                 <form id="searchForm" action="/myfarm/main" method="get" onsubmit="return validateKeyword()">
                       <div class="input-group w-100 mx-auto d-flex">
                       	<select id="type" name="type" class="border-0 form-select-sm bg-light input-group-text p-3">
                             <option value="TW" 
                             	<c:out value="${pageMaker.cri.type == 'TW'?'selected':''}"/>>전체</option>
                             <option value="T" 
                             	<c:out value="${pageMaker.cri.type == 'T'?'selected':''}"/>>농장 이름</option>
                             <option value="W" 
                             	<c:out value="${pageMaker.cri.type == 'W'?'selected':''}"/>>농장주</option>
                           </select>
                           <input type='text' class="form-control p-3" placeholder="keywords"  name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
                       		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                  			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                           <span id="search-icon-1" class="input-group-text p-3"><button class="btn btn-default"><i class="fa fa-search"></i></button></span>
                       </div>
                       </form>
                      </div>
                      </div>
                <div class="row g-4">
                            	
	                    <form id="actionForm" action="/myfarm/main" method="get">
                            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                            	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                            	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                            </form>
                        <div class="row g-4">
                        
                        <!-- 내 농장 바로가기 -->
                        <div class="col-lg-3" style="position: relative;">	
                       	<c:if test="${not empty vo}">
							<div id="bigbox" class="h-100 p-3">
								    <img id="myimage" src='/resources/upload/${vo.image_folder_num}/${vo.image1}' class='card-img-top' alt='농장 이미지' style="object-fit: cover;">
							</div>
						</c:if>
						<c:if test="${empty vo}">
						<div id="bigbox" class="h-100 p-3">
								<div style="position: relative;">
								<h4>내 농장이 없습니다!</h4>
								</div></div>
						</c:if>
							<div id="bigbox2" class="h-100 p-3">
							<h5 id="myFarmLink" class="fw-bold mb-1"><span>내 농장 바로가기</span></h5>
							</div>
						</div>

                        
                        <!-- 인기농장  -->
                            <div class="col-lg-9">
                            	<h4 id="f">인기 농장</h4>
                            	<div class="mx-auto text-center" style="max-width: 500px;">
					            </div>
                                <div class="row g-4 justify-content-center" id="myfarminput1">
                                </div>
                                      <ul class="pagination" style="display:flex; justify-content: flex-start;">
                            		<c:if test="${pageMaker.prev }">
                            			<li class="paginate_button previous" ><a href="${pageMaker.startPage -1}">prev</a></li>
                            		</c:if>
                            		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
                            			<li class="paginate_button  ${pageMaker.cri.pageNum == num ? 'active': '' }" >
                            			<button type="button" class="btn ${pageMaker.cri.pageNum == num ? 'btn-primary': 'btn-outline-primary' }"
                            			style="padding:0PX;"><a href="${num }">${num }</a></button>
                            			</li>
                            		</c:forEach>
                            		<c:if test="${pageMaker.next }">
                            			<li class="paginate_button next" ><a href="${pageMaker.endPage + 1}">Next</a></li>
                            		</c:if>
                            	</ul>
                            </div>
                        </div>
                        <!-- 상품 끝 -->
                    </div>
                </div>
            </div>
        <!-- Fruits Shop End-->
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script>
		
		function redirectToFarm(farmNum) {
		    // userNum을 사용하여 해당 유저의 팜으로 이동
		    if (farmNum) {

		        window.location.href = '/myfarm/farm?farm_num=' + farmNum;
		    } else {
		        alert('해당 팜은 없습니다.');
		        window.location.href = '/myfarm/main';
		    }
		}
		
		function validateKeyword() {
	        var keyword = document.forms["searchForm"]["keyword"].value;
	        if (keyword.length === 1) {
	            alert("검색어는 2자 이상으로 입력해주세요.");
	            return false;
	        }
	        return true;
	    }
		
		$(document).ready(function() {
			var user_num = 0;
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
						console.log(data)
						
						$.each(data, function(index,myfarm){
		
							let row ="";
							row+=("<div class='col-md-6 col-lg-6 col-xl-4'>");
							row+=("<div class='row g-0' id='farms'>");
							row+=("<div class='col-10 dhover' style='margin-bottom:40px;' onclick='redirectToFarm(" + myfarm.farm_num + ")'> ");
							row+=("<div class='position-relative shadowhover'>");
							row+=("<input type='hidden' name='farm_num' value='"+myfarm.farm_num+"'>")
							row+=("<img src='/resources/upload/" + myfarm.image_folder_num + "/"+ myfarm.image1 + "' class='card-img-top fixed-size-image' alt='농장 이미지' style='width:100%; height:280px'>");
							row+=("<div class='position-absolute start-0 bottom-0 w-100 py-3 px-4' style='background: rgba(52, 173, 84, .85);'>");
							row+=("<h4 class='text-white text-truncate'>"+myfarm.farm_name+"</h4>");
							let intro = myfarm.farm_intro;
							row+=("<div class='text-truncate text-intro'>")
							 for (let i = 0; i < intro.length; i++) {
		                            row += intro[i];
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
			

			
		    $('#myFarmLink').click(function() {
		        // jQuery를 사용하여 /myfarm/farm로 이동
		        // 이동하기 전에 세션에 user_num이 있는지 확인
		        $.ajax({
		            url: '/myfarm/checkSession',  // 세션 체크
		            type: 'GET',
		            dataType:'JSON',
		            success: function(response) {
		                if (response.hasUserNum) {
		                	if(response.isfarm){
		                		// 세션에 user_num이 있으면 /myfarm/farm로 이동
		                		window.location.href = '/myfarm/farm?farm_num=' + response.farmnum;
		                	}else{
		                		alert("먼저 농장을 만들어야 합니다.");
		                		window.location.href = '/myfarm/register'
		                		}

		                } else {
		                    // 세션에 user_num이 없으면 alert을 띄우고 /login으로 이동
		                    alert("로그인을 해주세요!");
		                    window.location.href = '/user/login';
		                }
		            },
		            error: function(error) {
		                console.log('세션 체크 에러:', error);
		            }
		        });
		    });
		});
		</script>
		
                        
                        
<%@include file="../includes/footer.jsp" %>