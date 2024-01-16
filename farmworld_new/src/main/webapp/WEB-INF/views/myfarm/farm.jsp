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
	                <h1 class="display-5">${myfarm.farm_name }</h1>
	            </div>
            </div>
            <div class="col-lg-3">

			<div class="bg-primary h-100 p-5">
			</div>
			</div>
            
            
            <div class="col-lg-9">
                    <div class="bg-primary h-100 p-5">

                            <div class="row g-3">
                            
                                <div class="col-12">
                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">

                                </div>
                                
                                <div class="col-12">
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

$(document).ready(function() {
	
	loadTableData(); // Ajax 실행 함수 호출
	
	function loadTableData() {
		$.ajax({
			url:"/myfarm/getUserFarm",
			type:"POST",
			dataType : "JSON",
			data:{
				user_num : 
				
			}
		
		
		})
		}
		
		
	});
<%@include file="../includes/footer.jsp" %>