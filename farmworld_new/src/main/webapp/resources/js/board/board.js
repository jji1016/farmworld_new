$(document).ready(function() {
	loadTableData();
	boardName();
	
	function boardName(){
		console.log($("#board_ENname").val());
		if($("#board_ENname").val() == "notice"){
			$(".board_name").text("공지사항");
			
		}else if($("#board_ENname").val() == "free_board"){
			$(".board_name").text("자유게시판");
		};
	};

	let result = '${alert}';
	console.log(result);
	checkModal(result);
	function checkModal(result) {
		if(result==''){
			return;
		}
		// 수정,삭제 시 메세지
		if(result == "success"){
			$(".modal-body").html("정상처리완료");
		// 글 등록 시 메세지
		}else if(parseInt(result)>0){
			$(".modal-body").html(parseInt(result)+"번 글이 등록 되었습니다.");
		}
		$("#myModal").modal("show");
	}
	$("#regBtn").click(function() {
		self.location = "/board/register";
	});
	
	function loadTableData(){
		$.ajax({
			url: "/board/searchList",
			type: "POST",
			dataType : "json",
			data: {
				pageNum : $("#actionForm").find("input[name='pageNum']").val(),
				amount : $("#actionForm").find("input[name='amount']").val(),
				type : $("#type").val(),
				keyword : $("#searchForm").find("input[name='keyword']").val(),
				board_category : $("#actionForm").find("input[name='board_category']").val()
			},
			success:function(data){
				
				// 아래에 $("tbody") 부분에 원래 #boardTbody있었는데 일단 안나와서 지움
				let boardTbody = $("tbody");
				boardTbody.empty();
				// for( let item of items) -> 여기서 items 은 data와 같고 item은 board와 같음
				$.each(data, function(index,board){
					console.log("검색결과: "+board);
					let board_date = new Date(board.board_date);
					let options = {year:"numeric",month:"2-digit", day:"2-digit", hour:"2-digit",minute:"2-digit"}
					let formatDate = board_date.toLocaleString("ko-KR",options);
					
					let row = $("<tr>");
					row.append($("<td>").text(board.board_num));
					
					let titleLink = $("<a>").attr("href","/board/get?board_num="+board.board_num).text(board.board_title);
					let titleTd = $("<td>").append(titleLink);
					row.append(titleTd);
					row.append($("<td>").text(board.user_nickname));
					row.append($("<td>").text(formatDate));
					row.append($("<td>").text(board.board_view));
					
					
					boardTbody.append(row);
				});
			},
			error: function(e) {
				console.log(e);
			}
		});
	
	}// loadTableData 함수 선언 종료
	
}); // $(document).ready 함수 선언 종료
