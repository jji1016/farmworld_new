$(document).ready(function(){
	ajaxTest(1);
	
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
				console.log(data);
				var parser = new DOMParser();
				var xmlDoc = parser.parseFromString(data.eduData, "text/xml");
				
				var totalCount = $(xmlDoc).find('totalCount').text();
				var hasDecimal = (totalCount/8) % 1 !== 0;
				var lastPageNum = Math.floor(totalCount / 8);
				
				if(hasDecimal){
					lastPageNum += 1;
				};
				console.log("totalCount::"+totalCount);
				console.log("hasDecimal"+hasDecimal);
				console.log(lastPageNum);
				console.log(xmlDoc);
				
				var str = "<ul>";
				
				$(xmlDoc).find("item").each(function() {
					var item = $(this);
	
					var atchmnflGroupEsntlCode = item.find("atchmnflGroupEsntlCode").text();
					var atchmnflSn = item.find("atchmnflSn").text();
					var atchmnflStreNm = item.find("atchmnflStreNm").text();
					var clCodeNm = item.find("clCodeNm").text();
					var contentCnt = item.find("contentCnt").text();
					var curationImgUrl = item.find("curationImgUrl").text();
					var curationNm = item.find("curationNm").text();
					var curationNo = item.find("curationNo").text();
					var curationSumryDtl = item.find("curationSumryDtl").text();
					var rdcnt = item.find("rdcnt").text();
					var recomendAt = item.find("recomendAt").text();
					var streCours = item.find("streCours").text();
					var svcDt = item.find("svcDt").text();
					var thumbFileNm = item.find("thumbFileNm").text();
	
					console.log("curationNo"+curationNo);
						
					str += "<li class='eduLi'><a>";
	
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
	
				console.log(str);
				let pm = data.page;
	            let p = "";
	            
	            p += num>10 ? "<a class='rounded' href='javascript:ajaxTest(" + 1 + ")'>맨앞으로</a>" : "";
				p += pm.prev ? "<a class='rounded' href='javascript:ajaxTest(" + (pm.startPage-1) + ")'>이전</a>" : "";
				for (let i = pm.startPage ; i < data.page.endPage + 1; i++) {
		            p += i==num ? "<a class='active rounded' href=javascript:ajaxTest(" + i + ")>" + i + "</a> " :"<a class='rounded' href=javascript:ajaxTest(" + i + ")>" + i + "</a> ";
		        }
		        p += pm.next ? "<a class='rounded' href='javascript:ajaxTest(" + (pm.endPage+1) + ")'>다음</a>" : "";
		        p += num<=parseInt(lastPageNum / 10) * 10 ? "<a class='rounded' href='javascript:ajaxTest(" + lastPageNum + ")'>맨뒤로</a>" : "";
		        
		        $("#pagingBox").html("");
		        $("#pagingBox").append(p);
			},
			error : function(e) {
				console.log(e);
			}
		});

	} // ajaxTest()끝