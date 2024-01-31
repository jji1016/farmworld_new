<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp" %>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5">
</div>
<!-- 상단 공백 추가 끝 -->    
    
<!-- Checkout Page Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <h1 class="mb-4">결제 페이지</h1>
        <form action="#">
            <div class="row g-5">
                <div class="col-md-12 col-lg-6 col-xl-7">
                    <div class="row">
                        <div class="col-md-12 col-lg-6">
                            <div class="form-item w-100">
                                <label class="form-label my-3">성<sup>*</sup></label>
                                <input type="text" id="name_first" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6">
                            <div class="form-item w-100">
                                <label class="form-label my-3">이름<sup>*</sup></label>
                                <input type="text" id="name_last" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3">Company Name<sup>*</sup></label>
                        <input type="text" id="company_name" class="form-control">
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3">주소 <sup>*</sup></label>
                        <input type="text" id="addr" onclick="execDaumPostcode()" class="form-control" readonly="readonly" placeholder="House Number Street Name">
                        
                        <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3">Town/City<sup>*</sup></label>
                        <input type="text" id="city" class="form-control">
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3">Country<sup>*</sup></label>
                        <input type="text" id="country" class="form-control">
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3">Postcode/Zip<sup>*</sup></label>
                        <input type="text" id="postcode" class="form-control" readonly="readonly">
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3">핸드폰<sup>*</sup></label>
                        <input type="tel" id="mobile" class="form-control" placeholder="- 없이 숫자만 입력해주세요.">
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3">이메일<sup>*</sup></label>
                        <input type="email" id="email" class="form-control">
                    </div>
                    <div class="form-item">
                    	<label class="form-label my-3">요구사항</label>
                        <textarea name="text" class="form-control" id="shipDetail" spellcheck="false" cols="30" rows="11" placeholder="Oreder Notes (Optional)"></textarea>
                    </div>
                </div>
                
                <div class="col-md-12 col-lg-6 col-xl-5">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Products</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody id="goodsList">
                            </tbody>
                            
                        </table>
                    </div>
                    
                    <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                        <button type="button" onclick="goPay()" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">상품 주문하기</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Checkout Page End -->

<script>
	$(document).ready(function() {
	    init();
	});
	
	var element_wrap	= document.getElementById('wrap');
	var filter			= /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	var totalAmt		= "";
	
	function execDaumPostcode() {
	    // 현재 scroll 위치를 저장해놓는다.
	    const currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = data.userSelectedType === "R" ? data.roadAddress : data.jibunAddress;
	            $("#addr").val(addr);
	            $("#postcode").val(data.zonecode);
	            
	            element_wrap.style.display = 'none';
	        },
	        onresize : function(size) {
	            element_wrap.style.height = size.height+'px';
	            element_wrap.style.width = 100+'%';
	        },
	        width : '100%',
	        height : '100%'
	    }).embed(element_wrap);

	    // iframe을 넣은 element를 보이게 한다.
	    element_wrap.style.display = 'block';
	}
	
	function foldDaumPostcode() {
	    // iframe을 넣은 element를 안보이게 한다.
	    element_wrap.style.display = 'none';
	}
	
	function init() {
		$.ajax({
		    type:"POST",
		    url: "/getMyCart",
		    contentType:"application/json;charset=UTF-8",
		    dataType : "json",
		    data: JSON.stringify({}),
		    success: function(rs) {
		      	if(rs.result == "Y") {
		      		var html = '';
		      		for(var i=0; i<rs.cartList.length; i++) {
		      			html += '<tr>';
		      			html += '	<th scope="row">';
		      			html += '		<div class="d-flex align-items-center mt-2">';
		      			html += '			<img src="/resources/'+ rs.cartList[i].image1 +'" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">';
		      			html += '		</div>';
		      			html += '	</th>';
		      			html += '	<td class="py-5">'+ rs.cartList[i].goods_title +'</td>';
		      			html += '	<td class="py-5">$ '+ rs.cartList[i].make_price +'</td>';
		      			html += '	<td class="py-5">'+ rs.cartList[i].count +'</td>';
		      			html += '	<td class="py-5">$ '+ rs.cartList[i].total_amt +'</td>';
		      			html += '</tr>';
		      		}
		      		
		      		html += '<tr>';
		      		html += '	<th scope="row">';
		      		html += '	</th>';
		      		html += '	<td class="py-5"></td>';
		      		html += '	<td class="py-5"></td>';
		      		html += '	<td class="py-5">';
		      		html += '		<p class="mb-0 text-dark py-3">Subtotal</p>';
		      		html += '	</td>';
		      		html += '	<td class="py-5">';
		      		html += '		<div class="py-3 border-bottom border-top">';
		      		html += '			<p class="mb-0 text-dark">$ '+ rs.cartList[0].bill_amt +'</p>';
		      		html += '		</div>';
		      		html += '	</td>';
		      		html += '</tr>';
		      		
                    $("#goodsList").html(html);
                    totalAmt = rs.cartList[0].bill_amt;
		      		
		      	} else {
		      		
		      	}
	    	},
		    error: function(err) {
		      console.log("err:", err)
		    }
	    });
	}
	
	// 결제
	function goPay() {
		// 정합성 검증
		var msg = validation();
		
		if(msg != "") {
			alert(msg);
		} else {
			var IMP = window.IMP;
			var param = {
				"name_first":	$("#name_first").val(),
				"name_last":	$("#name_last").val(),
				"company_name": $("#company_name").val(),
				"addr":			$("#addr").val(),
				"postcode":		$("#postcode").val(),
				"city":			$("#city").val(),
				"country":		$("#country").val(),
				"mobile":		$("#mobile").val(),
				"email":		$("#email").val(),
				"shipDetail":	$("#shipDetail").val(),
				"amt":			totalAmt.replace(/,/g,""),
			}
					
		    IMP.init("imp46513847"); 
		    IMP.request_pay({
		    	pg : "kakaopay", 
		        pay_method : "card",
		        merchant_uid : "merchant_" + new Date().getTime(),
		        name : "장바구니 결제",
		        amount : param.amt,
		        buyer_email : param.email,
		        buyer_name : param.name_first + param.name_last,
		        buyer_addr : param.addr,
		        buyer_postcode : param.postcode,
		        m_redirect_url : 'redirect url'
		    }, function(rsp) {
		        if(rsp.success) {
		        	saveHistory(param);
		        } else {
		        	alert("결제에 실패하였습니다.");	            
		        }
		    });
		}
	}
	
	// 이력 저장
	function saveHistory(param) {
		$.ajax({
		    type:"POST",
		    url: "/saveHistory",
		    contentType:"application/json;charset=UTF-8",
		    dataType : "json",
		    data: JSON.stringify(param),
		    success: function(rs) {
		    	if(rs.result == "Y") {
		    		if(!alert("주문완료하였습니다.")) {
		    			location.href = "/";
		    		}
		    	} else {
		    		alert("이력쌓기에 실패하였습니다.");
		    	}
		    },
		    error: function(err) {
		      console.log("err:", err)
		    }
	    });
	}
	
	// 입력값 검증
	function validation() {
		var msg		= "";
		var email	= $("#email").val();
		var mobile	= $("#mobile").val();
		
		if($("#name_first").val() == "") { // 성
			msg = "성을 입력해주세요.";
		} else if($("#name_last").val() == "") { // 이름
			msg = "이름을 입력해주세요.";
		} else if($("#company_name").val() == "") { // company Name
			msg = "회사명을 입력해주세요.";
		} else if($("#addr").val() == "" || $("#postcode").val() == "") { // 주소 / Postcode/Zip
			msg = "주소를 선택해주세요.";
		} else if($("#city").val() == "") { // Town/City
			msg = "Town/City를 입력해주세요.";
		} else if($("#country").val() == "") { // Country
			msg = "Country를 입력해주세요.";
		} else if(mobile == "") { // Moblie
			msg = "핸드폰 번호를 입력해주세요.";
		} else if(!$.isNumeric(mobile)) { // Moblie 숫자만 체크
			msg = "핸드폰 형식을 확인해주세요.";
		} else if(mobile.length < 10 || mobile.length > 11) { // Moblie 형식체크
			msg = "핸드폰 형식을 확인해주세요.";
		} else if(email == "") { // 이메일
			msg = "이메일을 입력해주세요.";
		} else if(!filter.test(email)) { // 이메일 형식체크
			msg = "이메일 형식을 확인해주세요.";
		}
		
		return msg;
	}
</script>

<%@include file="includes/footer.jsp" %>