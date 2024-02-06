<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp" %>
<style type="text/css">
#leftform{
	margin-right: 6%;
}
#rightimage{
	margin-top: 2%;
	margin-left: 0%;
}
.featurs-item{
	margin: 2%;
}
#mainbox{
	height: 90% !important;
}
#mainI{
	color: #000 !important;
}
</style>

<!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div id="leftform" class="col-md-12 col-lg-5">
                        <h4 class="mb-3 text-secondary">100만 농부 육성 프로젝트</h4>
                        <h1 class="mb-5 display-3 text-primary">Welcome<br>Farm World</h1>

                    </div>
                    <div id="rightimage" class="col-md-12 col-lg-6">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="/resources/img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="/resources/img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- Featurs Section Start -->
        <div class="container-fluid featurs py-5">
            <div class="container py-5">
                <div class="row g-4">
                    <div class="col-md-6 col-lg-3">
	                    <a href="/shopmain"  class="position-relative me-4 my-auto">
	                        <div id="mainbox" class="featurs-item text-center rounded bg-light p-4">
	                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
	                                <i id="mainI" class="fas fa-store fa-3x text-white"></i>
	                            </div>
	                            <div class="featurs-content text-center">
	                                <h5>Shopping</h5>
	                            </div>
	                        </div>
	                    </a>
                    </div>
                    <div class="col-md-6 col-lg-3">
                    	<a href="/edu/agritech"  class="position-relative me-4 my-auto">
	                        <div  id="mainbox" class="featurs-item text-center rounded bg-light p-4">
	                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
	                            	<i id="mainI" class="fas fa-microphone fa-3x text-white"></i>
	                            </div>
	                            <div class="featurs-content text-center">
	                                <h5>Edu</h5>
	                            </div>
	                        </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-3">
                    	<a href="/board/list?board_category=notice"  class="position-relative me-4 my-auto">
	                        <div  id="mainbox" class="featurs-item text-center rounded bg-light p-4">
	                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
	                                <i id="mainI" class="fas fa-user-shield fa-3x text-white"></i>
	                            </div>
	                            <div class="featurs-content text-center">
	                                <h5>Notice</h5>
	                                <p class="mb-0"></p>
	                            </div>
	                        </div>
                    	</a>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div id="mainbox" class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto weatherIcon">
                            </div>
                            <div class="featurs-content text-center">
                                <h5 id="temper">Weather</h5>
                                <div id="weatherPlace"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featurs Section End -->

<%@include file="includes/footer.jsp" %>

<script>
	$(document).ready(function(){
	if (window.location.href.startsWith="http://localhost:8082/weather"){
		weatherAjax();
	}
	});
	
	function weatherAjax() {
		$("#weatherPlace").empty();
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var dateString = year + '' + month  +'' + day;    	
		var hours = ('0' + today.getHours()).slice(-2);     	
		var timeString = (hours*100);
		
		$.ajax({
	        url: "/weather",
	        type: "post",
	        contentType: "application/json; charset=utf-8;",
	        dataType: "json",
	        success: function(data) {
	        	let html = "<p>";
	        	let weatherIcon = "";
	        	for (let key of data.response.body.items.item){
	        			if(key["fcstTime"]==timeString && key["fcstDate"]==dateString){
	        					if(key["category"] =="TMP"){	
	        						html+="<img src='/resources/img/weatherIcon/temperature.png' style='width:10%; height:10%;'>"+"현재기온 : "+key["fcstValue"]+"°C";
	        						html +="<br>";
	        					}	
	
	        					if(key["category"] =="PCP"){	
	        						if(key["fcstValue"] !="강수없음"){
	        						html+="<img src='/resources/img/weatherIcon/rain.png' style='width:10%; height:10%;'>";
	        						html+="강수량:"+key["fcstValue"];
	        						}
	        					}	
	        					if(key["category"] =="SNO"){	
	        						if(key["fcstValue"] !="적설없음"){
	        						html+="<img src='/resources/img/weatherIcon/snow.png' style='width:10%; height:10%;'>";
	        						html+="적설량:"+key["fcstValue"];
	        						}
	        					}    	            
	        					if(key["category"] =="SKY"){	
	        						if(key["fcstValue"] == "1"){
	        							weatherIcon+="<img src='/resources/img/weatherIcon/sun.png' style='width:70%; height:70%;'>";
	        						$("#temper").html("맑음");
	        					}	
	        						if(key["fcstValue"] == "2"){
	        							weatherIcon+="<img src='/resources/img/weatherIcon/cloud.png' style='width:70%; height:70%;'>";
	        						$("#temper").html("구름조금");
	        					}	
	        						if(key["fcstValue"] == "3"){
	        							weatherIcon+="<img src='/resources/img/weatherIcon/cloud.png' style='width:70%; height:70%;'>";
	        						$("#temper").html("구름많음");
	        					}	
	        						if(key["fcstValue"] == "4"){
	        							weatherIcon+="<img src='/resources/img/weatherIcon/cloud.png' style='width:70%; height:70%;'>";
	        						$("#temper").html("흐림");
	        					}	
	        				};		
	        	};
	        };
	        	html += "</p>";
	        	$(".weatherIcon").html(weatherIcon);
				$("#weatherPlace").html(html);
	            
	        },
	        error: function(e) {
	            console.log(e);
	            console.log(e);
	        }
	    });
	}
</script>
