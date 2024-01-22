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
					
					let titleLink = $("<a>").attr("href","/board/get?board_num="+board.board_num+"&board_category="+board.board_category)
						.text(board.board_title).on("click",function(){clickBoard(board.board_num, board.board_category);
				    	});
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
	
	// 클릭한 게시물의 조회수를 증가시키는 Ajax 요청
	function clickBoard(boardNum, boardCategory) {
        $.ajax({
            type: "POST",
            url: "/board/increaseViewCount",
            data: {
                board_num: boardNum
            },
            success: function(result) {
            },
            error: function(error) {
                console.log("Error: " + error);
            }
        });
    };
	
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
	
}); // $(document).ready 함수 선언 종료


// post방식 modify 넘기기
let formObj = $("#modify_form");
let category = $("#category").val();
$(".btn").click(function() {
	let operation = $(this).data("oper");
	console.log(operation);
	
	if(operation == "remove"){
		formObj.attr("action","/board/remove")
			.attr("method","get");
		// formObj.submit(); remove랑 modify쪽에 둘다 이걸 넣어줘야하지만 밖에 하나만 넣음
	}else if(operation == "modify"){
		formObj.attr("action","/board/modify")
		.attr("method","post");
	}
	formObj.submit();
});

// 게시글 수정시 삽입된 이미지 삭제
$(".del_image").on("click", function () {
    var id = $(this).attr("id");
    console.log(id);
	var replaceID = id.replace("del_", "");
	console.log(replaceID);

    $.ajax({
        type: "POST",
        url: "/board/deleteImage",
        data: { del_image_id: replaceID,
        		image_folder_num : $("#image_FN").val() },
        success: function(result) {
            // 성공적으로 삭제되면 해당 이미지를 화면에서 제거
            console.log(result);
             $("#" + replaceID).empty();
            console.log("Image deleted successfully");
        },
        error: function(error) {
            console.log("Error: " + error);
        }
    });
});



function previewImage(input, previewId) {
    var file = input.files[0];
    if (file) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#" + previewId).html('<img src="' + e.target.result + '" alt="Image Preview" class="img-fluid">');
        };
        reader.readAsDataURL(file);
    }
}

$("#image1").change(function () {
    previewImage(this, 'imagePreview1');
});

$("#image2").change(function () {
    previewImage(this, 'imagePreview2');
});

$("#image3").change(function () {
    previewImage(this, 'imagePreview3');
});


