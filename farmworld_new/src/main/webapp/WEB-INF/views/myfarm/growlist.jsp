<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@include file="../includes/header.jsp" %>

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
	                <input type="hidden" value="${vo.user_num }" name="user_num" id="user_num">
	                <form id="pageForm" method="get" action="/myfarm/growlist">
	                
	                <input type="hidden" value="${vo.farm_num }" name="farm_num" id="farmNum">
	                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                   	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                   	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                   	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                   	<input type="hidden" name="growup_category" value="${pageMaker.cri.growup_category }">
                   	</form>
	            </div>
            </div>
            <div class="col-lg-3" style="position: relative;">	
			<div class="bg-primary h-100 p-5">
			<div style="position: relative;">
			    <img src='/resources/upload/${vo.image_folder_num}/${vo.image1}' class='card-img-top fixed-size-image' alt='농장 이미지'>
			    <button id="farmModify" style="position: absolute; bottom: 0; right: 0; border-radius:50%; border:none;"><a href='/myfarm/modify?farm_num=<c:out value="${vo.farm_num}"/>'>수정</a></button>
			</div>
			
			<h4>${vo.farm_intro}</h4>
			<form id="findForm">
			    <div class="input-group">
			        <input type='text' class="form-control p-3" placeholder="농장 이름 검색" name='keyword' id='keyword'>
			        <span class="input-group-text">
			            <button type="button" id="searchBtn" class="btn"><i class="fa fa-search"></i></button>
			        </span>
			    </div>
			</form>
			</div>
			</div>
			<div class="col-lg-2" style="position: relative;">	
			<div class="bg-primary h-100 p-5">
			<h5>카테고리</h5>
			<div id="categoryInput"></div>
			</div>
			</div>
            
            
            <div class="col-lg-7">
                    <div class="bg-primary h-100 p-5">


                            <div class="row g-3">
                            
                                <div class="col-4 dhover" style="margin-bottom:10px;">
                                <a href="/myfarm/farm?farm_num=<c:out value='${vo.farm_num}'/>"style="color:black;">HOME</a>
                                </div>
                                <div class="col-4 dhover" style="margin-bottom:10px;">
                                <a href="/myfarm/growlist?farm_num=<c:out value='${vo.farm_num}'/>" style="color:black;">성장일기</a>
                                </div>
                                <div class="col-4 dhover" style="margin-bottom:10px;">
                                <a style="color:black;" href="/myfarm/goodslist?farm_num=<c:out value='${vo.farm_num}'/>&user_num=<c:out value='${vo.user_num}'/>" >판매상품</a>
                                </div>
                                
                                

                                
                                <div class="col-12" id="growInput">

                                </div>
                                <div class="col-12">
                                <ul class="pagination" style="display:flex; justify-content: flex-start;">
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
                                
                                <div class="col-12">
                                <button class="btn btn-success"><a href="/myfarm/growregister?farm_num=<c:out value="${vo.farm_num}" />">성장일기 등록</a></button>
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
function redirectToGrow(growNum) {
    // userNum을 사용하여 해당 유저의 팜으로 이동
    if (growNum) {
        window.location.href = '/myfarm/growboard?grow_num=' + growNum;
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
        var inputUserNum = document.getElementById("user_num").value;
		console.log("세션"+sessionUserNum+" jsp" +inputUserNum)
        // user_num이 일치하는지 확인
        if (sessionUserNum == inputUserNum || sessionType == 2) {
            document.querySelector('#farmModify').style.display = 'block';
            document.querySelector('.btn-success').style.display = 'block';
        } else {
            document.querySelector('#farmModify').style.display = 'none';
            document.querySelector('.btn-success').style.display = 'none';
        }
		
    	loadTableData(); // Ajax 실행 함수 호출
    	loadCategory();
		
    	function loadTableData() {
    	    let farmNum = $("#farmNum").val();
    	    console.log("팜넘" + farmNum);
    	    $.ajax({
    	        url: "/myfarm/growlist",
    	        type: "POST",
    	        dataType: "json",
    	        data: {
    	            farm_num: farmNum,
    	            pageNum: $("#pageForm").find("input[name='pageNum']").val(),
    	            amount: $("#pageForm").find("input[name='amount']").val(),
    	            keyword: $("#pageForm").find("input[name='keyword']").val(),
    	            type: $("#pageForm").find("input[name='type']").val(),
    	            growup_category: $("#pageForm").find("input[name='growup_category']").val()
    	        },
    	        success: function (data) {
    	            let growBody = $("#growInput");
    	            console.log(data);
    	            if (data.length === 0) {
    	            	growBody.html("<div style='width: 50%; height: 400px; display: flex; flex-direction: column; justify-content: center; align-items: center; margin: auto; background-color: #f8d7da; border: 1px solid #f5c6cb; border-radius: .25rem;'><p style='font-size: 20px;'>현재 성장일기가 존재하지 않습니다.</p></div>");
					 } else {
    	            let row = "<div class='row g-3' >"; // 새로운 행 시작

    	            $.each(data, function (index, grow) {
    	                // 여기서 grow 항목을 생성하고 클래스 추가
    	                row += ("<div class='col-md-4 col-lg-4 col-xl-4'>"); // 각 항목의 너비 조절
    	                row += ("<div class='rounded position-relative' style='margin-bottom:40px;' onclick='redirectToGrow(" + grow.grow_num + ")'>");
    	                row += ("<div class='row g-0'>");
    	                row += ("<div class='col-10 dhover'>");
    	                row += ("<div class='position-relative'>");
    	                row += ("<input type='hidden' name='farm_num' value='" + grow.farm_num + "'>")
    	                row += ("<img src='/resources/upload/" + grow.image_folder_num + "/" + grow.image1 + "' class='card-img-top fixed-size-image' alt='성장일기 이미지' style='width:100%; height:200px'>");
    	                row += ("<div class='position-absolute start-0 bottom-0 w-100 py-3 px-4' style='background: rgba(52, 173, 84, .85);'>");
    	                row += ("<h4 class='text-white text-truncate'>" +"["+ grow.growup_category +"]"+ grow.grow_title + "</h4>");
    	                row += ("</div></div></div></div></div></div>");

    	                if ((index + 1) % 3 === 0) {
    	                    // 3개의 항목을 한 행으로 처리하고 새로운 행 시작
    	                    row += "</div>"; // 행을 닫음
    	                    growBody.append(row);
    	                    row = "<div class='row g-3'>"; // 새로운 행 시작
    	                }
    	            });

    	            if (data.length % 3 !== 0) {
    	                // 남은 항목들을 마저 처리
    	                row += "</div>"; // 마지막 행을 닫음
    	                growBody.append(row);
    	            }
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
        
        function loadCategory(){
        	$.ajax({
        		url : "/myfarm/getcategory",
        		type: "POST",
        		dataType:"JSON",
        		data:{
        			farm_num : $("#farmNum").val()
        		},
        		success:function(data){
        			console.log(data);
        			let categoryInput = $("#categoryInput");
        			
        			categoryInput.append("<div class='dhover'><p id='cleanCategory'>전체</p></div>")
        			$.each(data, function (index, category) {
        				console.log(category.growup_category);
        				let row="<p class='dhover'>";
        				row+=category.growup_category;
        				row+="</p>";
        				categoryInput.append(row);
        			});
        			
        		},
        		error:function(e){
        			console.log(e);
        		}
        	})
        	  $("#categoryInput").on("click", "p", function() {
        	        // 클릭된 row의 growup_category 값을 가져와서 input에 설정
        	        
        	        var growupCategory = $(this).text();
        	        if(growupCategory=="전체"){
        	        	$("#pageForm").find("input[name='growup_category']").val("");
        	        }else{
        	        	$("#pageForm").find("input[name='growup_category']").val(growupCategory);
        	        }
					$("#growInput").html("");
					$("#pageForm").find("input[name='pageNum']").val("1");
					
					
        	        // loadTableData() 실행
					$("#pageForm").submit();
        	    });

        }

        
    });
</script>
<%@include file="../includes/footer.jsp" %>