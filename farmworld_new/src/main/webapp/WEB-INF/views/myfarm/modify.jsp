<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="en">
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
    <!--[if lt IE 9]>
    
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body data-spy="scroll" data-target="#header">
	<!-- 김지영 test -->
    <!--Start Hedaer Section-->
        <jsp:include page="../includes/header.jsp"></jsp:include>
    <!--End of Hedaer Section-->
<div id="page-wrapper mx-auto" class="mx-auto">
            <div class="row">
                <div class="col-md-6 text-center mx-auto">
                    <h1 class="page-header">내 농장 만들기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="panel panel-default">

                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <form role="form" enctype="multipart/form-data" id="modifyForm">
	                           <input type="hidden" name="farm_num" value="${vo.farm_num }">
	                           <input type="hidden" id="image1" value="${vo.image1 }">
	                            <div class="form-group">
	                                <label>농장 이름</label>
	                                <input class="form-control" name="farm_name" maxlength="15" placeholder="농장 이름을 입력해주세요 (최대 15자)" value="${vo.farm_name }">
	                            </div>
	                            
	                            <div class="form-group">
                                   <label>농장 소개</label>
                                   <textarea class="form-control" rows="5" cols="40" 
                                   name="farm_intro" maxlength="50" 
                                   placeholder="농장 소개를 입력해주세요 (최대 50자)">${vo.farm_intro }</textarea>
                               </div>
                                <div class="form-group">
					                <label for="image1">이미지 업로드</label>
					                <input type="file" name="image1" id="image1" class="form-control-file" onchange="previewImage(this)">
					            </div>
					
					            <!-- 미리보기를 표시할 DIV -->
					            <div id="imagePreview" class="mt-3"></div>
                            
	                            <button type="button" class="btn btn-success" data-oper="modify">농장 수정</button>
	                            <button type="button" class="btn btn-danger" data-oper="remove">농장 삭제</button>
	                            <button type="button" class="btn btn-info" data-oper="list">리스트로 돌아가기</button>
	                       </form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
       	
       	
       	
       	
       <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
       <script type="text/javascript">
       
	       function previewImage(input) {
	           var preview = document.getElementById('imagePreview');
	           preview.innerHTML = ''; // 미리보기를 초기화
	
	           if (input.files && input.files[0]) {
	               var reader = new FileReader();
	
	               reader.onload = function (e) {
	                   var img = document.createElement('img');
	                   img.src = e.target.result;
	                   img.className = 'img-fluid rounded';
	                   preview.appendChild(img);
	               };
	
	               reader.readAsDataURL(input.files[0]); // 파일을 읽어 data URL로 변환
	           }
	       }
	       
	       $(document).ready(function() {
	    	   
	    	   let isImage =$("#image1").val();
	    	   
	    	   if(isImage!=null){
	    		   $("#imagePreview").append("<img src='/resources/upload/${vo.image_folder_num}/${vo.image1}' alt='농장 이미지'>");
	    	   }
	    		
	    		let formObj = $("#modifyForm");
	    		
	    			$(".btn").click(function() {
	    				let operation = $(this).data("oper");
	    				console.log(operation);
	    				
	    				if(operation == "list"){
	    					formObj.attr("action","/myfarm/main")
	    						.attr("method", "get");
	    				}else if(operation == "remove"){
	    					formObj.attr("action","/myfarm/removefarm")
	    						.attr("method", "post");
	    				}else if(operation == "modify"){
	    					formObj.attr("action","/myfarm/modify")
	    					.attr("method", "post");
	    				}
	    				formObj.submit();
	    			});
	    		});
    	</script>
    			
    			
        <!--Start Footer Section-->
	    <jsp:include page="../includes/footer.jsp"></jsp:include>
    	<!--End Footer Section-->


        <!-- Custom JavaScript-->
        <script src="/resources/js/main.js"></script>
    </body>

</html>