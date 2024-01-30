<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style type="text/css">
/* 기본 스타일 */
.table {
  font-size: 16px !important; /* 기본 글씨 크기 */
}
#reviewbutton1{
	font-size: 16px !important;
}
#reviewbutton2{
	font-size: 16px !important;
}

/* 1200px 이하일 때 */
@media screen and (max-width: 995px) {
  .table {
    font-size: 12px !important;/* 중간 크기 화면에서의 글씨 크기 */
  }
 #reviewbutton1{
	font-size: 12px !important;
}
#reviewbutton2{
	font-size: 12px !important;
} 
}
/* 600px 이하일 때 */
@media screen and (max-width: 770px) {
  .table {
    font-size: 7px !important; /* 작은 화면에서의 글씨 크기 */
  }
#reviewbutton1{
	font-size: 7px !important;
}
#reviewbutton2{
	font-size: 7px !important;
} 
}

#tablesize{
	width: 100%
}
.table th {
    text-align: center;
}
.table td {
    vertical-align: middle;
    text-align: center;
}
.table tr td:first-child {
	width: 20%;
}
.table tr td:second-child {
	width: 15%;
}
#purchaseimg{
	width: 85%;
}
#reviewbutton1{
	margin-top: 15% !important;
	width: 100%;
}
#reviewbutton2{
	margin-top: 2% !important;
	width: 100%;
}
</style>
</head>

<%@include file="../includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->

<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <h1 class="mb-4">리뷰관리</h1>                     
         <div id="tablesize" class="col-lg-9">
         	<!-- 보드 -->
         	<div class="table-responsive">
         	
     			<table class="table">
         			<thead>
		              <tr>
		                <th scope="col">제품사진</th>
		                <th scope="col">주문일자</th>
		                <th scope="col">주문번호</th>
		                <th scope="col">제품이름</th>
		                <th scope="col" colspan="2">리뷰</th>

		              </tr>
		            </thead>
		            <tbody>
		       		<!-- AJAX 작동 -->
		            </tbody>
        		</table>
        		
    		</div>
    	</div>
	</div>
</div>                      
                        
<%@include file="../includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.4.min.js" type="text/javascript">
</script>


<script>

let data3; // 전역 변수로 선언

$(document).ready(function () {
    loadTableData();
	let testNum = "";
    function loadTableData() {
        $.ajax({
            url: "/mypage/getreviewlist1",
            type: "POST",
            dataType: "json",
            success: function (data1) {
                $.ajax({
                    url: "/mypage/getreviewlist2",
                    type: "POST",
                    dataType: "json",
                    success: function (data2) {
                    	$.ajax({
                            url: "/mypage/getreviewimage",
                            type: "POST",
                            dataType: "json",
                            success: function (data4) {
		                        $.ajax({
		                            url: "/mypage/getreviewlist3",
		                            type: "POST",
		                            dataType: "json",
		                            success: function (data) {
		                                data3 = data; // 전역 변수에 저장
		
		                                // Assuming data1, data2, and data3 have the same length
		                                for (let i = 0; i < data1.length; i++) {
		                                    let options = { year: "numeric", month: "2-digit", day: "2-digit", hour: "2-digit", minute: "2-digit" };
		                                    let orderdate = new Date(data1[i].order_date);
		                                    let orderformatDate = orderdate.toLocaleString("ko-KR", options);
		
		                                    let reviewdate = new Date(data[i].review_date);
		                                    console.log(data);
		                                    let reviewformatDate = reviewdate.toLocaleString("ko-KR", options);
		                                    
		                                    let stars = "";
		                                    for (let j = 0; j < data3[i].review_score; j++) {
		                                      stars += '<i class="fa fa-star text-secondary"></i>';
		                                    }		                                    
		
		                                    let row = $("<tr>");
		                                    row.html(
		                                    		"<td>"+"<img id='purchaseimg' src='/resources/upload/product/"+ data2[i].image_folder_num +"/"+ data4[i].image1 + "'></td>" +
		                                    	    "<td>" + orderformatDate + "</td>" +
		                                    	    "<td>" + data1[i].order_num + "</td>" +
		                                    	    "<td>" + data2[i].goods_title + "</td>" +
		                                    	    "<td>" + reviewformatDate +
		                                    	    "<br>" + stars +
		                                    	    "<br>" + data3[i].review_content + "</td>" +
		                                    	    "<td>" +
	                                    	            "<form name='review1' action='/mypage/reviewupdate' method='post'>"+
	                                        	        "<input type='hidden' class='review_num' id='review_num' name='review_num' value='" + data3[i].review_num + "'>" +
														"<button id='reviewbutton1' type='submit' class='btn btn-primary middlebutton deliveryBtn'>수정</button></form>" +
	                                    	            "<form name='review2' action='/mypage/reviewdelete'  method='post'>" +
	                                        	        "<input type='hidden' class='review_num' id='review_num' name='review_num' value='" + data3[i].review_num + "'>" +
	                                    	            "<button id='reviewbutton2' name='review_num3' onclick='reviewdelete(" + i + ")' class='btn btn-primary middlebutton purchaseViewBtn'>삭제</button></form>" +
	                                    	        "</td>"
		                                    	    
		                                    	);
		                                    console.log(row);
		                                    testNum=data2[i].image_folder_num
		                                    console.log(testNum);
		                                    $("tbody").append(row);
		                                }
		                            },
		                            error: function (e3) {
		                                console.log(e3);
		                            }
		                        });
		                    },
		                    error: function (e4) {
		                        console.log(e4);
		                    }
		                });
		            },
                    error: function (e2) {
                        console.log(e2);
                    }
                });
            },
            error: function (e1) {
                console.log(e1);
            }
        });
    }
});




</script>


</html>