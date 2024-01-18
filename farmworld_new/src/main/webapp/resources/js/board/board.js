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
	
	let actionForm = $("#actionForm");
	$(".paginate_button a").on("click",function(e){
		e.preventDefault(); // 이벤트 초기화
		// pageNum값을 사용자가 누른 a태그의 href속성값으로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	}// loadTableData 함수 선언 종료
	
	// summernote 사용
	$('#BOARDCONT').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대3000자까지 쓸 수 있습니다'	,//placeholder 설정
			  toolbar: [
					    // [groupName, [list of button]]
					    ['fontname', ['fontname']],
					    ['fontsize', ['fontsize']],
					    ['color', ['color']],
					    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']]
					  ],
					fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
					fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		          
	});
	
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
   	
   	//get.jsp에서 submit 용도로 사용
   	$(document).ready(function() {
		let formObj = $("form");
		$(".btn").click(function() {
			let operation = $(this).data("oper");
			console.log(operation);
			if(operation == "list"){
				formObj.attr("action","/board/list")
				.attr("method","get");
			}else if(operation == "modify"){
				formObj.attr("action","/board/modify")
				.attr("method","get");
			}
			formObj.submit();
		});
	});
	
}); // $(document).ready 함수 선언 종료
