<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="en">

<body data-spy="scroll" data-target="#header">
	<!-- 김지영 test -->
    <!--Start Hedaer Section-->
        <jsp:include page="includes/header.jsp"></jsp:include>
    <!--End of Hedaer Section-->
    <div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
                <h1 class="mb-4">현재 날씨</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">

                            <div class="col-6" id="weatherPlace"></div>

                        </div>

                </div>
            </div>
            </div>
            </div>
            

       <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
       <script type="text/javascript">
		$(document).ready(function() {
			ajaxTest();

    		function ajaxTest() {
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
    	            	for (let key of data.response.body.items.item){
    	            			if(key["fcstTime"]==timeString && key["fcstDate"]==dateString){
    	            					if(key["category"] =="TMP"){	
    	            						html+="<img src='/resources/img/weatherIcon/temperature.png' style='width:10%; height:10%;'>"+"현재기온:"+key["fcstValue"];
    	            						html +="<br>";
    	            					}	

    	            					if(key["category"] =="PCP"){	
    	            						if(key["fcstValue"] !="강수없음"){
    	            							html+="<img src='/resources/img/weatherIcon/rain.png' style='width:10%; height:10%;'>";
    	            						html+="강수량:"+key["fcstValue"];
    	            						html +="<br>";
    	            						}
    	            					}	
    	            					if(key["category"] =="SNO"){	
    	            						if(key["fcstValue"] !="적설없음"){
    	            							html+="<img src='/resources/img/weatherIcon/snow.png' style='width:10%; height:10%;'>";
    	            						html+="적설량:"+key["fcstValue"];
    	            						html +="<br>";
    	            						}
    	            					}    	            
    	            					if(key["category"] =="SKY"){	
    	            						if(key["fcstValue"] == "1"){
    	            						html+="<img src='/resources/img/weatherIcon/sun.png' style='width:10%; height:10%;'>";
    	            						html+="맑음";
    	            						html +="<br>";
    	            					}	
    	            						if(key["fcstValue"] == "2"){
    	            							html+="<img src='/resources/img/weatherIcon/cloud.png' style='width:10%; height:10%;'>";
    	            						html+="구름조금";
    	            						html +="<br>";
    	            					}	
    	            						if(key["fcstValue"] == "3"){
    	            							html+="<img src='/resources/img/weatherIcon/cloud.png' style='width:10%; height:10%;'>";
    	            						html+="구름많음";
    	            						html +="<br>";
    	            					}	
    	            						if(key["fcstValue"] == "4"){
    	            							html+="<img src='/resources/img/weatherIcon/cloud.png' style='width:10%; height:10%;'>";
    	            						html+="흐림";
    	            						html +="<br>";
    	            					}	
    	            				};		
    	            	};
    	            };
    	            	html += "</p>";
						$("#weatherPlace").html(html);
    	                
    	            },
    	            error: function(e) {
    	                console.log(e);
    	                console.log("실패!");
    	            }
    	        });
    	    }


    	});
    	</script>
    			
    			
        <!--Start Footer Section-->
	    <jsp:include page="includes/footer.jsp"></jsp:include>
    	<!--End Footer Section-->




        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->

        <!--Counter UP Waypoint-->
        <script src="/resources/js/waypoints.min.js"></script>
        <!--Counter UP-->
        <script src="/resources/js/jquery.counterup.min.js"></script>

       


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