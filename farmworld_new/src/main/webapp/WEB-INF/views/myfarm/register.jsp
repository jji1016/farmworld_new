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
                           <form action="/myfarm/register" method="post" role="form" enctype="multipart/form-data">
	                           
	                            <div class="form-group">
	                                <label>농장 이름</label>
	                                <input class="form-control" name="farm_name" maxlength="15" placeholder="농장 이름을 입력해주세요 (최대 15자)" required="required">
	                            </div>
	                            
	                            <div class="form-group">
                                   <label>농장 소개</label>
                                   <textarea class="form-control" rows="5" cols="40" 
                                   name="farm_intro" maxlength="50" 
                                   placeholder="농장 소개를 입력해주세요 (최대 50자)" required="required"></textarea>
                               </div>
                                <div class="form-group">
					                <label for="image1">이미지 업로드</label>
					                <input type="file" name="image1" id="image1" class="form-control-file" accept=".png, .jpg" onchange="previewImage(this)" required>
					            </div>
					
					            <!-- 미리보기를 표시할 DIV -->
					            <div id="imagePreview" class="mt-3"></div>
                            
	                            <button type="submit" class="btn btn-success">농장 등록</button>
	                            <button type="reset" class="btn btn-secondary">리셋</button>
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
	    	   const maxFileSize = 2 * 1024 * 1024; // 2MB
	    	   const fileInput = input.files[0];
	           var preview = document.getElementById('imagePreview');
	           preview.innerHTML = ''; // 미리보기를 초기화
	
	           if (input.files && input.files[0]) {
	        	   if (fileInput.size > maxFileSize) {
	                   alert("파일 크기는 2MB를 초과할 수 없습니다.");
	                   input.value = ""; // 파일 선택 초기화
	                   document.getElementById(previewId).innerHTML = ""; // 미리보기 초기화
	               }else{
	               var reader = new FileReader();
	
	               reader.onload = function (e) {
	                   var img = document.createElement('img');
	                   img.src = e.target.result;
	                   img.className = 'img-thumbnail rounded';
	                   preview.appendChild(img);
	               };
	
	               reader.readAsDataURL(input.files[0]); // 파일을 읽어 data URL로 변환
	           }
	           }
	       }
    	</script>
    			
    			
        <!--Start Footer Section-->
	    <jsp:include page="../includes/footer.jsp"></jsp:include>
    	<!--End Footer Section-->




    </body>

</html>