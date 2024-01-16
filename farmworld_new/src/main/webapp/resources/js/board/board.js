$(document).ready(function() {
	let categorie = "/board/searchList" 
	loadTableData();
	
	$(".notice").on("click",function(){
		loadTableData();
	});
	
	$(".free_board").on("click",function(){
		categorie = "/board/searchList2"
		loadTableData();
	});

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
			url: categorie,
			type: "POST",
			dataType : "json",
			data: {
				pageNum : $("#actionForm").find("input[name='pageNum']").val(),
				amount : $("#actionForm").find("input[name='amount']").val(),
				type : $("#type").val(),
				keyword : $("#searchForm").find("input[name='keyword']").val()
			},
			success:function(data){
				
				// 아래에 $("tbody") 부분에 원래 #boardTbody있었는데 일단 안나와서 지움
				let boardTbody = $("tbody");
				boardTbody.empty();
				// for( let item of items) -> 여기서 items 은 data와 같고 item은 board와 같음
				$.each(data, function(index,board){
					console.log(board);
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
	
	let actionForm = $("#actionForm");
	$(".paginate_button a").on("click",function(e){
		e.preventDefault(); // 이벤트 초기화
		// pageNum값을 사용자가 누른 a태그의 href속성값으로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	var searchForm = $("#searchForm");

	$("#searchForm button").on(
			"click",
			function(e) {

				if (!searchForm.find("option:selected")
						.val()) {
					if(searchForm.find("option:selected")
							.val()=""){
						return true;
					}
					alert("검색종류를 선택하세요");
					return false;
				}

				if (!searchForm.find(
						"input[name='keyword']").val()) {
					if(searchForm.find("option:selected")
							.val()=""){
						return true;
					}
					alert("키워드를 입력하세요");
					return false;
				}

				e.preventDefault();

				searchForm.submit();

			});
			
	// 카테고리 기능
	
	}// loadTableData 함수 선언 종료
	
}); // $(document).ready 함수 선언 종료
