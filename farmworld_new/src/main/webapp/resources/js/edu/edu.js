$(document).ready(function(){
	if (window.location.href.startsWith('http://localhost:8070/edu/agritech')) {
	    ajaxTest(1);
	};
	
	if (window.location.href.startsWith('http://localhost:8070/edu/getDtl')) {
	    CntntsSnnAjax(1);
	};
	
}); // document.ready 끝 

function ajaxTest(num) {
	// 현재 URL의 쿼리 문자열을 가져옴
	var queryString = window.location.search;
	// URLSearchParams 객체 생성
	var params = new URLSearchParams(queryString);
	
	var eduMonth = params.get("eduMonth");
	var srchStr = params.get("srchStr");
	
	$.ajax({
		url : "/edu/agritech",
		type : "POST",
		dataType : "json",
		data : {
			eduMonth: eduMonth,
			srchStr: srchStr,
			pageNum : num
		},
		success : function(data) {
			console.log("aa"+data);
			var parser = new DOMParser();
			var xmlDoc = parser.parseFromString(data.eduData, "text/xml");
			console.log("xmlDoc"+xmlDoc);
			
			var totalCount = $(xmlDoc).find('totalCount').text();
			var hasDecimal = (totalCount/8) % 1 !== 0;
			var lastPageNum = Math.floor(totalCount / 8);
			
			if(hasDecimal){
				lastPageNum += 1;
			};
			
			var str = "<ul>";
			
			$(xmlDoc).find("item").each(function() {
				var item = $(this);
				
				var curationImgUrl = item.find("curationImgUrl").text();
				var curationNm = item.find("curationNm").text();
				var curationNo = item.find("curationNo").text();
				var rdcnt = item.find("rdcnt").text();
				var svcDt = item.find("svcDt").text();
					
				str += "<li class='eduLi'><a href='/edu/getDtl?curationNo="+curationNo+"'>";

				str += "<div class='eduConBox'><img class='eduImg' src='"+curationImgUrl+"'></div>";
				str += "<div class='conRap'>";
				str += "<strong>" +curationNm+ "</strong>";
				str += "<span>";
				str += "<em>" + svcDt + "</em>";
				str += "<em class='check'><em class='material-icons'>visibility</em>"
						+ rdcnt + "</em>";
				str += "</span>";
				str += "</div>";

				str += "</a></li>";
			});
			str += "</ul>";
			$("#resultArea").html("");
			$("#resultArea").append(str);

			let pm = data.page;
            let p = "";
            
            p += num>10 ? "<a class='rounded' href='javascript:ajaxTest(" + 1 + ")'>&laquo;&laquo;</a>" : "";
			p += pm.prev ? "<a class='rounded' href='javascript:ajaxTest(" + (pm.startPage-1) + ")'>&laquo;</a>" : "";
			for (let i = pm.startPage ; i < data.page.endPage + 1; i++) {
	            p += i==num ? "<a class='active rounded' href=javascript:ajaxTest(" + i + ")>" + i + "</a> " :"<a class='rounded' href=javascript:ajaxTest(" + i + ")>" + i + "</a> ";
	        }
	        p += pm.next ? "<a class='rounded' href='javascript:ajaxTest(" + (pm.endPage+1) + ")'>&raquo;</a>" : "";
	        p += num<=parseInt(lastPageNum / 10) * 10 ? "<a class='rounded' href='javascript:ajaxTest(" + lastPageNum + ")'>&raquo;&raquo;</a>" : "";
	        
	        $("#pagingBox").html("");
	        $("#pagingBox").append(p);
		},
		error : function(e) {
			console.log(e);
		}
	});

} // ajaxTest()끝

// 상세페이지
function CntntsSnnAjax(selectedValue) {
console.log("CntntsSnnAjax실행");
	// 현재 URL의 쿼리 문자열을 가져옴
	var queryString = window.location.search;
	// URLSearchParams 객체 생성
	var params = new URLSearchParams(queryString);
	
	var curationNo = params.get("curationNo");
	console.log("curationNo:"+curationNo);
	
	$.ajax({
		url : "/edu/getDtl",
		type : "POST",
		dataType : "json",
		data : {
			curationNo: curationNo, // 컨텐츠 번호
			cntntsSnn: selectedValue // 컨텐츠 내부 순번 
		},
		success : function(data) {
			console.log("data::"+data);
			var parser = new DOMParser();
			var DtlGuideLst = parser.parseFromString(data.DtlGuideLst, "text/xml");
			var DtlDefaultInfo = parser.parseFromString(data.DtlDefaultInfo, "text/xml");
			var Dtl = parser.parseFromString(data.Dtl, "text/xml");
			
			console.log("DtlGuideLst::"+$(DtlGuideLst).find('item').text());
			console.log("DtlDefaultInfo::"+$(DtlDefaultInfo).find('item').text());
			console.log("Dtl::"+$(Dtl).find('item').text());
			
			// 페이지 옵션
			var option = "<select id='cntntsSnnVal'>";
			$(DtlGuideLst).find('item').each(function() {
			    var cntntsSnn = $(this).find('cntntsSnn').text();
			    var cntntsNm = $(this).find('cntntsNm').text();
				option += "<option  value='"+cntntsSnn+"'>"+cntntsNm+"</option>";
			});
			option += "</select>";
			
			$("#DtlGuideLst").html("");
			$("#DtlGuideLst").append(option);
			
			$("#cntntsSnnVal").on("change", function() {
			    var selectedValue = $("#cntntsSnnVal").val();
			    console.log("selectedValue" + selectedValue);
			    CntntsSnnAjax(selectedValue);
			});
			
			//상세 페이지
			$("#Dtl").html("");
			$("#Dtl").append($(Dtl).find('item').text());
			
		},
		error : function(e) {
			console.log(e);
		}
	});

} // CntntsSnnAjax()끝


	
	