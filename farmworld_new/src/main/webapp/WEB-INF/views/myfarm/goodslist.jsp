<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@include file="../includes/header.jsp" %>

<style>
#bigbox {
    margin-right: 3%;
    margin-left: 3%;
    border: solid #81c408 3px;
    border-radius: 30px;
    min-height: 600px; /* 최소 높이를 600px로 지정 */
    height: 100% !important;
    box-shadow: 5px 5px 10px 0px #888888;
    position: relative;
}
#myimage{
	margin-top: 10%;
	width: 70%;
}
#myintro{
	margin-top: 25%;
	margin-bottom: 1%;
}
#mysearch{
	margin-top: 27%;
	position: absolute;
    bottom: 0;
    right: 0;
    border-radius: 50%;
    border: none;
    margin: 12px;
    margin-bottom: 7%;
}
#farmModify{
	position: absolute !important;
    top: 108%;
    left: 50%;
    transform: translate(-50%, -50%);
    border-radius:50%;
    border:none;
}
.pagination-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.pagination {
    display: flex;
    list-style: none;
    padding: 0;
    margin: 0;
    flex-wrap: wrap; /* 추가: 작은 화면에서 줄 바꿈 */
    gap: 5px;
}
.pagination li {
    margin: 5px; /* 수정: 각 페이지 번호의 간격 조정 */
}
@media screen and (max-width: 995px) {
  #bigbox {
    flex: 0 0 auto;
    width: 90%;
    height: 70%;
	}
	.pagination {
        justify-content: center; /* 추가: 페이지 번호 중앙 정렬 */
    }
    .pagination li {
        margin: 0px; /* 추가: 작은 화면에서 각 페이지 번호의 간격 조정 */
    }
</style>
<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->


<!-- join Start -->
<div class="container-fluid py-5">
    <div class="container py-5 text-center">
        <div class="row justify-content-center">
			 <div class="container">
	            <div class="mx-auto text-center mb-5" style="max-width: 500px;">
	                <h1 class="display-5" id="headName">${vo.farm_name }</h1>
	                <form id="pageForm" method="get" action="/myfarm/goodslist">
	                <input type="hidden" value="${vo.user_num }" name="user_num" id="userNum">
	                <input type="hidden" value="${vo.farm_num }" name="farm_num" id="farmNum">
	                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                   	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                   	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                   	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                   	</form>
	            </div>
            </div>
            <div class="col-lg-3" style="position: relative;">	
			<div id="bigbox" class="h-100 p-3">
			<div style="position: relative;">
			    <img id="myimage" src='/resources/upload/${vo.image_folder_num}/${vo.image1}' class='card-img-top fixed-size-image' alt='농장 이미지'>
			    <a href='/myfarm/modify?farm_num=<c:out value="${vo.farm_num}"/>' id="farmModify" class="btn text-white bg-primary px-3 rounded position-absolute">수정</a>
			</div>
			
			<h6 id="myintro">${vo.farm_intro}</h6>
			<form id="findForm">
			    <div id="mysearch" class="input-group">
			        <input type='text' class="form-control p-3" placeholder="농장 이름 검색" name='keyword' id='keyword'>
			        <span class="input-group-text">
			            <button type="button" id="searchBtn" class="btn"><i class="fa fa-search"></i></button>
			        </span>
			    </div>
			</form>
			</div>
			</div>
            

            
            <div class="col-lg-9">
                    <div id="bigbox" class="h-100 p-5">


                            <div class="row g-3">
                            	<div class="col-12">
								
                                </div>
                            
                                <div class="col-4 dhover">
                                <a href="/myfarm/farm?farm_num=<c:out value='${vo.farm_num}'/>"style="color:black;">HOME</a>
                                </div>
                                <div class="col-4 dhover" >
                                <a href="/myfarm/growlist?farm_num=<c:out value='${vo.farm_num}'/>" style="color:black;">성장일기</a>
                                </div>
                                <div class="col-4 dhover">
                                <a style="color:black;" href="/myfarm/goodslist?farm_num=<c:out value='${vo.farm_num}'/>&user_num=<c:out value='${vo.user_num}'/>" >판매상품</a>
                                </div>
                                
                                

                                
                                <div class="col-12" id="goodsInput">

                                </div>
                                <div class="col-12 pagination-container">
                                <ul class="pagination" style="display:flex; justify-content: flex-start;">
                            		<c:if test="${pageMaker.prev }">
                            			<li class="paginate_button previous" ><button type="button" class="btn"><a href="${pageMaker.startPage -1}">prev</a></button></li>
                            		</c:if>
                            		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
                            			<li class="paginate_button  ${pageMaker.cri.pageNum == num ? 'active': '' }" >
                            			<button type="button" class="btn ${pageMaker.cri.pageNum == num ? 'btn-primary': 'btn-outline-primary' }"
                            			style="padding:0PX;"><a href="${num }">${num }</a></button>
                            			</li>
                            		</c:forEach>
                            		<c:if test="${pageMaker.next }">
                            			<li class="paginate_button next" ><button type="button" class="btn"><a href="${pageMaker.endPage + 1}">Next</a></button></li>
                            		</c:if>
                            	</ul>
								</div>
                         
                            </div>

                    </div>
                </div>
            
        </div>
    </div>
</div>
<!-- join End -->

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function redirectToGoods(goodsNum) {
    // userNum을 사용하여 해당 유저의 팜으로 이동
    if (goodsNum) {
        window.location.href = '/shopdetail?detail=' + goodsNum;
    } else {
        alert('해당 게시글은 존재하지 않습니다.!');
        window.history.back();
    }
}
    $(document).ready(function () {
    	 // 세션에서 user_num을 가져오기
        var sessionUserNum = <%= session.getAttribute("user_num") %>;
        var sessionType = <%= session.getAttribute("user_type") %>;

        // 입력된 user_num 가져오기
        var inputUserNum = document.getElementById("userNum").value;
		console.log("세션"+sessionUserNum+" jsp" +inputUserNum)
        // user_num이 일치하는지 확인
        if (sessionUserNum == inputUserNum || sessionType == 2) {
            document.querySelector('#farmModify').style.display = 'block';
        } else {
            document.querySelector('#farmModify').style.display = 'none';
        }
		
    	loadTableData(); // Ajax 실행 함수 호출
		
    	function loadTableData() {
    	    let farmNum = $("#farmNum").val();
    	    console.log("팜넘" + farmNum);
    	    $.ajax({
    	        url: "/myfarm/goodslist",
    	        type: "POST",
    	        dataType: "json",
    	        data: {
    	            farm_num: farmNum,
    	            user_num: $("#userNum").val(),
    	            pageNum: $("#pageForm").find("input[name='pageNum']").val(),
    	            amount: $("#pageForm").find("input[name='amount']").val(),
    	            keyword: $("#pageForm").find("input[name='keyword']").val(),
    	            type: $("#pageForm").find("input[name='type']").val(),
    	        },
    	        success: function (data1) {
    	            let growBody = $("#goodsInput");
    	            console.log(data1);
    	            if (data1.length === 0) {
    	            	growBody.html("<div style='width: 50%; height: 400px; display: flex; flex-direction: column; justify-content: center; align-items: center; margin: auto;'><p style='font-size: 20px;'>현재 판매상품이 존재하지 않습니다.</p></div>");
					 } else {
						 $.ajax({
								url:"/myfarm/getgoodsimage",
								dataType:"JSON",
								type:"POST",
								data:{
									user_num: $("#userNum").val(),
								},
								success: function(data2){
									console.log(data2);
									let row = "<div class='row g-3' >"; // 새로운 행 시작
				    	            $.each(data1, function (index, goods) {
				    	                // 여기서 grow 항목을 생성하고 클래스 추가
				    	                row += ("<div class='col-md-4 col-lg-4 col-xl-4'>"); // 각 항목의 너비 조절
				    	                row += ("<div class='rounded position-relative fruite-item' style='margin-bottom:40px;' onclick='redirectToGoods(" + goods.goods_num + ")'>");
				    	                row += ("<div class='row g-0'>");
				    	                row += ("<div class='col-10'>");
				    	                row += ("<div class='position-relative'>");
				    	                row += ("<input type='hidden' name='goods_num' value='" + goods.farm_num + "'>")
				    	                row += ("<img src='/resources/"+ data2[index].image1 + "' class='card-img-top fixed-size-image' alt='상품 이미지' style='width:100%; height:200px'>");
				    	                row += ("<div class='position-absolute start-0 bottom-0 w-100 py-3 px-4' style='background: rgba(52, 173, 84, .85);'>");
				    	                row += ("<h4 class='text-white text-truncate'>" +"["+ goods.goods_category +"]"+ goods.goods_title + "</h4>");
				    	                row += ("</div></div></div></div></div></div>");

				    	                if ((index + 1) % 3 === 0) {
				    	                    // 3개의 항목을 한 행으로 처리하고 새로운 행 시작
				    	                    row += "</div>"; // 행을 닫음
				    	                    growBody.append(row);
				    	                    row = "<div class='row g-3'>"; // 새로운 행 시작
				    	                }
				    	            });

				    	            if (data1.length % 3 !== 0) {
				    	                // 남은 항목들을 마저 처리
				    	                row += "</div>"; // 마지막 행을 닫음
				    	                growBody.append(row);
				    	            }
									
								},
								error: function(e){
									console.log(e);
								}
							
							})
    	            


    	            }
    	        },
    	        error: function (e) {
    	            console.log(e);
    	        }
    	    });
    	    
    	    let pageForm = $("#pageForm");
    	    $(".paginate_button a").on("click", function(e) {
				e.preventDefault(); // 기존에 가진 이벤트를 중단
				pageForm.find("input[name='pageNum']").val($(this).attr("href"));
				pageForm.submit();
			});
    	}
        $("#keyword").keypress(function(event) {
            if (event.which === 13) {
                // 엔터 키가 눌렸을 때 실행할 코드
                event.preventDefault();
                $("#searchBtn").click();
            }
        });

        $("#searchBtn").click(function () {
            // AJAX 호출
					var keyword = $("#findForm").find("input[name='keyword']").val();
            		console.log($("#keyword").val());
            $.ajax({
            	type: "POST",
            	contentType: "application/x-www-form-urlencoded",
                url: "/myfarm/searchFarm",
                data: {
                	keyword: keyword
                	},
                dataType: 'json',
                success: function (result) {
                    if (result === "fail") {
                        alert("해당 농장은 존재하지 않습니다.");
                    } else {
                        var farmNum = result;
                        window.location.href = "/myfarm/farm?farm_num=" + farmNum;
                    }
                },
                error: function (xhr, textStatus, errorThrown) {
                    // 서버에서 에러 응답이 왔을 때의 처리
                    if (xhr.status === 400) {
                        alert("해당 농장은 존재하지 않습니다.");
                    } else {
                        console.error("Error: " + errorThrown);
                    }
                }
            });
        });

        
    });
</script>
<%@include file="../includes/footer.jsp" %>