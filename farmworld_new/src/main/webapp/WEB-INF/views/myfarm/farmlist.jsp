<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <!-- Animated CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/css/animate.min.css">
    <!-- Bootstrap -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Carousel -->
    <link type="text/css" rel="stylesheet" href="/resources/css/carousel.css" />
    <link rel="stylesheet" href="/resources/css/isotope/style.css">
    <!-- Main Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <!-- Responsive Framework -->
    <link href="/resources/css/responsive.css" rel="stylesheet">
	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	    <link
      href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
      rel="stylesheet"
    />
<style>
    .fixed-size-image {
		max-width: 200px;
        max-height: 200px;

        object-fit: fill;
    }
</style>

</head>
<body data-spy="scroll" data-target="#header">

    <!--Start Hedaer Section-->
        <jsp:include page="../includes/header.jsp"></jsp:include>
    <!--End of Hedaer Section-->
    <div class="row" style="width: 30%; height: 40em; float:left;">
    	<div class="register-div" 
    	style="width: 100%; height: 60%; margin-left: 6%; margin-top: 30%; background-color: #20c997;"
    	onclick="redirectToRegister()">
    		<div style="margin-top:5%; width: 80%; height: 60%; text-align:center;">
    			<img src='/resources/img/harvest.png'/> <h3 style="margin-top:4%">내 농장 만들기</h3>
    		</div>
    	</div>
    </div>
    
            <div class="row" style="width:70%; float:right; margin-top: 2%;">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
							<p>농장 검색<p>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                        	<form id="searchForm" action="/myfarm/farmlist" method="get" onsubmit="return validateKeyword()">
	                        	<div class="form-group col-xs-6">
	                                 <select id="type" class="border-0 form-select-sm bg-light me-3" name="type">
	                                     <option value="TW" 
	                                     	<c:out value="${pageMaker.cri.type == 'TW'?'selected':''}"/>>전체</option>
	                                     <option value="T" 
	                                     	<c:out value="${pageMaker.cri.type == 'T'?'selected':''}"/>>농장 이름</option>
	                                     <option value="W" 
	                                     	<c:out value="${pageMaker.cri.type == 'W'?'selected':''}"/>>농장주</option>
	                                 </select>
	                             </div>
	                              <div class="col-xs-6">
			                        <div class="form-group input-group" >
			                           <input type='text' style="width:90%" name='keyword'
											value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                            			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			                            <span class="input-group-btn">
			                                <button class="btn btn-default">
			                                    <i class="fa fa-search"></i>
			                                </button>
			                            </span>
			                        </div>
			                    </div>
                        	</form>
                        	
							<div class="grid-wrapper">
                                <div class="grid text-center" id="myfarminput1" style="width:100%" style="display:block">

							    </div>
							</div>
							
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
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->




        <!--Start Footer Section-->
	    <jsp:include page="../includes/footer.jsp"></jsp:include>
    	<!--End Footer Section-->


    <!--Scroll to top-->
    <a href="#" id="back-to-top" title="Back to top">&uarr;</a>
    <!--End of Scroll to top-->



        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>

        <!--Counter UP Waypoint-->
        <script src="/resources/js/waypoints.min.js"></script>
        <!--Counter UP-->
        <script src="/resources/js/jquery.counterup.min.js"></script>
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

       


        <!--Isotope-->	
        <script src="/resources/js/isotope/min/scripts-min.js"></script>
        <script src="/resources/js/isotope/cells-by-row.js"></script>
        <script src="/resources/js/isotope/isotope.pkgd.min.js"></script>
        <script src="/resources/js/isotope/packery-mode.pkgd.min.js"></script>
        <script src="/resources/js/isotope/scripts.js"></script>




        <!--JQuery Click to Scroll down with Menu-->
        <script src="/resources/js/jquery.localScroll.min.js"></script>
        <script src="/resources/js/jquery.scrollTo.min.js"></script>

        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="/resources/js/bootstrap.min.js"></script>
        <!-- Custom JavaScript-->
        <script src="/resources/js/main.js"></script>
    </body>

</html>