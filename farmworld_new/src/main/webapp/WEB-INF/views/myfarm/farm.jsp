<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
        
<style>
#bigbox {
    margin-right: 3%;
    margin-left: 3%;
    border: solid #81c408 3px;
    border-radius: 30px;
    height: 600px !important;
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
@media screen and (max-width: 995px) {
  #bigbox {
    flex: 0 0 auto;
    width: 25%;
    height: 70%;
	}
</style>

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
	                <input type="hidden" value="${vo.user_num }" name="user_num" id="userNum">
	                <input type="hidden" value="${vo.user_num }" name="user_num" id="user_num">
	                <input type="hidden" value="${vo.farm_num }" name="farm_num" id="farmNum">

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
                    <div id="bigbox" class="h-100 p-4">

                            <div class="row g-3">

                                <div class="col-4 dhover">
                                <a href="/myfarm/farm?farm_num=<c:out value='${vo.farm_num}'/>"style="color:black;">HOME</a>
                                </div>
                                <div class="col-4 dhover">
                                <a href="/myfarm/growlist?farm_num=<c:out value='${vo.farm_num}'/>" style="color:black;">성장일기</a>
                                </div>
                                <div class="col-4 dhover">
                                <a style="color:black;" href="/myfarm/goodslist?farm_num=<c:out value='${vo.farm_num}'/>&user_num=<c:out value='${vo.user_num}'/>" >판매상품</a>
                                </div>
                                
                                <div class="col-12" style="margin-top:1em; margin-bottom:1em;"><h1>최신 글</h1></div>
                                <div class="row g-4 justify-content-center" id="growInput">
     
   
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
		
		loadTableData();
		
    	function loadTableData() {
    	    let farmNum = $("#farmNum").val();
    	    console.log("팜넘" + farmNum);
    	    $.ajax({
    	        url: "/myfarm/growlist",
    	        type: "POST",
    	        dataType: "json",
    	        data: {
    	            farm_num: farmNum
    	        },
    	        success: function (data) {
    	            let growBody = $("#growInput");
    	            console.log(data);
    	            if (data.length === 0) {
    	            	growBody.html("<div style='width: 50%; height: 400px; display: flex; flex-direction: column; justify-content: center; align-items: center; margin: auto; background-color: #f8d7da; border: 1px solid #f5c6cb; border-radius: .25rem;'><p style='font-size: 20px;'>현재 성장일기가 존재하지 않습니다.</p></div>");
					 } else {
    	            let row = "<div class='row g-3 justify-content-center' >"; // 새로운 행 시작

    	            $.each(data.slice(0,3), function (index, grow) {
    	                // 여기서 grow 항목을 생성하고 클래스 추가
    	                row += ("<div class='col-md-3 col-lg-3 col-xl-3'>"); // 각 항목의 너비 조절
    	                row += ("<div class='rounded position-relative' style='margin-bottom:40px;' onclick='redirectToGrow(" + grow.grow_num + ")'>");
    	                row += ("<div class='row g-3 justify-content-center'>");
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
    	                }
    	            });


    	            }
    	        },
    	        error: function (e) {
    	            console.log(e);
    	        }
    	    });
    	    
    	    let pageForm = $("#pageForm");
    	    $(".paginate_button button a").on("click", function(e) {
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