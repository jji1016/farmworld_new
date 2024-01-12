<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style type="text/css">
#tablesize{
	width: 100%
}
.table th {
    text-align: center;
}
.table td {
    text-align: center;
}
</style>
</head>

<%@include file="includes/header.jsp" %>

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
                        
<%@include file="includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.4.min.js" type="text/javascript">
</script>


<script>

$(document).ready(function () {
    loadTableData();

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
                            url: "/mypage/getreviewlist3",
                            type: "POST",
                            dataType: "json",
                            success: function (data3) {
                                // Assuming data1, data2, and data3 have the same length
                                for (let i = 0; i < data1.length; i++) {

                                    let options = { year: "numeric", month: "2-digit", day: "2-digit", hour: "2-digit", minute: "2-digit" };
                                	
                                    let orderdate = new Date(data1[i].order_date);
                                    let orderformatDate = orderdate.toLocaleString("ko-KR", options);
                                    
                                    let reviewdate = new Date(data3[i].review_date);
                                    let reviewformatDate = reviewdate.toLocaleString("ko-KR", options);

                                    let row = $("<tr>");
                                    row.html("<td>이미지</td><td>" + orderformatDate + "</td><td>" + data1[i].order_num + "</td><td>" + data2[i].goods_title + "</td><td>" + reviewformatDate + "<br>" + data3[i].review_score + "<br>" + data3[i].review_content + "</td><td><button class='btn btn-primary middlebutton deliveryBtn'>수정</button><button class='btn btn-primary middlebutton purchaseViewBtn'>삭제</button></td>");
                                    console.log(row);
                                    $("tbody").append(row);
                                }
                            },
                            error: function (e3) {
                                console.log(e3);
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