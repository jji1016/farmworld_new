<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 깃테스트 박사라 -->
<head>
<style type="text/css">
/* 기본 스타일 */
.table {
  font-size: 16px !important; /* 기본 글씨 크기 */
  white-space: nowrap;
}
#purchasebutton{
	margin: 1%;
	font-size: 16px !important;
}

/* 995px 이하일 때 */
@media screen and (max-width: 995px) {
  .table {
    font-size: 12px !important;/* 중간 크기 화면에서의 글씨 크기 */
    white-space: nowrap;
  }
  #purchasebutton{
  	margin: 1%;
	font-size: 12px !important;
} 
}
/* 770px 이하일 때 */
@media screen and (max-width: 770px) {
  .table {
    font-size: 7px !important; /* 작은 화면에서의 글씨 크기 */
    white-space: nowrap;
  }
    #purchasebutton{
    margin: 1%;
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
</style>
</head>

<%@include file="../includes/header.jsp" %>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->

<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <h1 class="mb-4">구매내역</h1>                     
         <div id="tablesize" class="col-lg-9">
         	<!-- 보드 -->
         	<div class="table-responsive">
     			<table class="table">
         			<thead>
		              <tr>
		                <th scope="col">제품사진</th>
		                <th scope="col">주문일자</th>
		                <th scope="col">주문번호</th>
		                <th scope="col">농장이름</th>
		                <th scope="col">제품이름</th>
		                <th scope="col">제품가격</th>
		                <th scope="col">별점</th>
		                <th scope="col">상세보기</th>
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

let data1;

$(document).ready(function () {
    loadTableData();

    function loadTableData() {
        $.ajax({
            url: "/mypage/getbuylist1",
            type: "POST",
            dataType: "json",
            success: function (data) {
            	console.log(data);
            	data1 = data;
                $.ajax({
                    url: "/mypage/getbuylist3",
                    type: "POST",
                    dataType: "json",
                    success: function (data3) {
                    	console.log(data3);
                        $.ajax({
                            url: "/mypage/getbuylistimg",
                            type: "POST",
                            dataType: "json",
                            success: function (data4) {
                            	console.log(data4);
		                    	$.ajax({
		                            url: "/mypage/getbuylist2",
		                            type: "POST",
		                            dataType: "json",
		                            success: function (data2) {
		                            	console.log(data2);
		                                // Assuming data1, data2, and data3 have the same length
		                                for (let i = 0; i < data1.length; i++) {
		                                    let orderdate = new Date(data1[i].order_date);
		                                    let options = { year: "numeric", month: "2-digit", day: "2-digit", hour: "2-digit", minute: "2-digit" };
		                                    let formatDate = orderdate.toLocaleString("ko-KR", options);
		
		                                    let row = $("<tr>");
		                                    row.html("<td>"+"<img id='purchaseimg' src='/resources/upload/product/"+ data4[i].image_folder_num +"/"+ data4[i].image1 + "'></td>"+
		                                    		"<td>" + formatDate + "</td>"+
		                                    		"<td>" + data1[i].order_num + "</td>"+
		                                    		"<td>" + data3[i].farm_name + "</td>"+
		                                    		"<td>" + data2[i].goods_title + "</td>"+
		                                    		"<td>" + data2[i].goods_price + "</td>"+
		                                    		"<td>" + data2[i].goods_price + "</td>"+
		                                    		"<td><button id='purchasebutton' class='btn btn-primary middlebutton deliveryBtn'>배송상세</button>"+
		                                    		"<form name='returnpurchase' action='/mypage/returnpurchase'  method='post'>" +
                                        	        "<input type='hidden' class='order_num' id='order_num' name='order_num' value='" + data1[i].order_num + "'>" +                                    	        
		                                    		"<button id='purchasebutton' name='order_num' onclick='returnpurchase(" + i + ")' class='btn btn-primary middlebutton purchaseViewBtn'>주문취소</button></form></td>");
		                                    console.log(row);
		                                    $("tbody").append(row);
		                                }
		                            },
		                            error: function (e2) {
		                                console.log(e2);
		                            }
		                        });
		                    },
		                    error: function (e4) {
	                            console.log(e4);
	                        }
	                    });
	                },
	                    error: function (e3) {
	                        console.log(e3);
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