$(document).ready(function() {
	if (window.location.href.startsWith('http://localhost:8090/board/get')) {
	    clickBoard()
	};
	
	loadTableData();
	boardName();
	loadComments(); // 페이지 로딩 시 댓글 로딩
	hide();
	
	function boardName(){
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
		if ($("#userNumHidden").val() == "") {
		    $(".pagingBtn").css("display", "none");
		}
	
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
					
					let titleLink = $("<a id='titleLink'>").attr("href","/board/get?board_num="+board.board_num
						+"&board_category="+board.board_category+"&board_date="+formatDate)
						.text(board.board_title);
					let titleTd = $("<td>").append(titleLink);
					row.append(titleTd);
					row.append($("<input id='getBoardNum' type='hidden' value='"+board.board_num+"'>"));
					row.append($("<input id='getBoardCategory' type='hidden' value='"+board.board_category+"'>"));
					
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
	
	//댓글 불러오기 기능
    function loadComments() {
    // 게시글 번호와 카테고리 파라미터 가져오기
    var boardNum = $("#boardNum").val();
    console.log("boardNum="+boardNum);

	    // 댓글 목록 가져오기
	    $.ajax({
	        type: "GET",
	        url: "/comment/getComments",
	        data: {
	            board_num: boardNum,
	        },
	        dataType: "json", // 데이터 형식을 JSON으로 지정
	        success: function (comments) {
	            displayComments(comments);
	        },
	        error: function (error) {
	            console.log("Error fetching comments: " + error);
	        }
	    });
	}

	function displayComments(comments) {
	    var commentList = $("#commentList");
	    var commentNick = $(".commentNick").data("user-nickname");
		console.log("세션 닉넴" + commentNick);

	    commentList.empty();
	
	    // 댓글 목록을 표시
	    $.each(comments, function (index, comment) {
	    	let comment_date = new Date(comment.comment_date);
			let options = {year:"numeric",month:"2-digit", day:"2-digit", hour:"2-digit",minute:"2-digit"}
			let formatDate = comment_date.toLocaleString("ko-KR",options);
	        var commentDiv = $("<div class='comment'>");
	        commentDiv.append("<input id='commentNum' type='hidden' value='"+ comment.comment_num +"'>");
	        var commentDiv2 = $("<div class='comRap'>");
		        commentDiv2.append("<p>" + comment.user_nickname + " | " + formatDate + "</p>");
				if (comment.user_nickname === commentNick) {
				    commentDiv2.append("<input type='button' id='modComment' value='수정'>");
				    commentDiv2.append("<input type='button' id='delComment' value='삭제'>");
				}
				commentDiv2.append("</div>");

			commentDiv.append(commentDiv2);
	        commentDiv.append("<p class='commentConP'>" + comment.comment_contents + "</p>");
	        commentDiv.append("</div>");
	
	        commentList.append(commentDiv);
	    });
	}

    // 댓글 등록 폼 제출 시
    $(".comment_register").submit(function (event) {
        event.preventDefault();
        console.log($(".commentCon").val());
        console.log($("#boardNum").val());

        // 댓글 등록
        $.ajax({
            type: "POST",
            url: "/comment/addComment",
            data: {board_num: $("#boardNum").val(),
            	   comment_contents: $(".commentCon").val() },
            success: function (result) {
                if (result === "success") {
                    // 등록 성공 시 댓글 목록 다시 로드
                    loadComments();
                    // 댓글 입력 폼 초기화
                    $(".commentCon").val("");
                }
            },
            error: function (error) {
                console.log("Error adding comment: " + error);
            }
        });
    });

	// 댓글 삭제버튼 클릭시
	$(document).off("click", "#delComment").on("click", "#delComment", function(t) {
	    console.log("삭제 실행");
	
	    // commentNum 변수를 유효성 검사하여 숫자로 변환
	    var commentNum =  $(this).closest('.comment').find('#commentNum').val();
	    console.log(commentNum+"번 댓글 삭제");
	    if (!isNaN(commentNum)) {
	        // 유효한 숫자로 처리
	        $.ajax({
	            type: "POST",
	            url: "/comment/delComment",
	            data: {
	                board_num: $("#boardNum").val(),
	                comment_num: commentNum
	            },
	            success: function(result) {
	                if (result === "success") {
	                    // 등록 성공 시 댓글 목록 다시 로드
	                    loadComments();
	                    // 댓글 입력 폼 초기화
	                    $(".commentCon").val("");
	                }
	            },
	            error: function(error) {
	                console.log("Error adding comment: " + error);
	            }
	        });
	    } else {
	        // 유효하지 않은 숫자 처리
	        console.error("Invalid comment number");
	        // 또는 기본값을 설정하거나 에러 처리를 수행할 수 있습니다.
	    }
	});
	
	// 댓글 수정 버튼 클릭시
	$(document).off("click", "#modComment").on("click", "#modComment", function(t) {
		var commentConP = $(this).closest('.comment').find(".commentConP");
   		var comValue = commentConP.text();
   		console.log("comValue="+comValue);
	
		var hiddenModCom = $('<input>',{
			'id': 'hiddenModCom',
			'type': 'hidden',
			'value': comValue
		});
	    var commentConT = $('<textarea>', {
	        'class': 'commentConT',
	        'text': comValue
	    });
	    var modCommentComplete = $('<input>', {
	        'type': 'button',
	        'id': 'modCommentComplete',
	        'value': '수정완료'
	    });
	    var modCancel = $('<input>', {
	        'type': 'button',
	        'id': 'modCancel',
	        'value': '취소'
	    });
		
	    var modCommentButton = $(this).closest('.comRap').find("#modComment");
	    var delCommentButton = $(this).closest('.comRap').find("#delComment");
	
		$(this).closest('.comment').append(hiddenModCom);
	    commentConP.replaceWith(commentConT);
	    modCommentButton.replaceWith(modCommentComplete);
	    delCommentButton.replaceWith(modCancel);
	});
	
	// 수정 이후 취소버튼 클릭시
	$(document).off("click", "#modCancel").on("click", "#modCancel", function(t) {
		var hiddenModComValue= $(this).closest('.comment').find("#hiddenModCom").val();
		
		console.log(hiddenModComValue);
	    var commentConP = $('<p>', {
	    	'class': 'commentConP',
	    	'text': hiddenModComValue
	    });
	    var modComment = $('<input>', {
	        'type': 'button',
	        'id': 'modComment',
	        'value': '수정'
	    });
	    var delComment = $('<input>', {
	        'type': 'button',
	        'id': 'delComment',
	        'value': '삭제'
	    });
	
	    var commentConT = $(this).closest('.comment').find(".commentConT");
	    var modCommentButton = $(this).closest('.comRap').find("#modCommentComplete");
	    var delCommentButton = $(this).closest('.comRap').find("#modCancel");
	
	    commentConT.replaceWith(commentConP);
	    modCommentButton.replaceWith(modComment);
	    delCommentButton.replaceWith(delComment);
	});
	
	// 댓글 수정완료버튼 클릭시
	$(document).off("click", "#modCommentComplete").on("click", "#modCommentComplete", function(t) {
	    console.log("수정 실행");
	    console.log($(".commentConT").val());
	
	    // commentNum 변수를 유효성 검사하여 숫자로 변환
	    var commentNum =  $(this).closest('.comment').find('#commentNum').val();
	    console.log(commentNum+"번 댓글 수정");
	    if (!isNaN(commentNum)) {
	        // 유효한 숫자로 처리
	        $.ajax({
	            type: "POST",
	            url: "/comment/modComment",
	            data: {
	                board_num: $("#boardNum").val(),
	                comment_contents: $(".commentConT").val(),
	                comment_num: commentNum
	            },
	            success: function(result) {
	                if (result === "success") {
	                    // 등록 성공 시 댓글 목록 다시 로드
	                    loadComments();
	                    // 댓글 입력 폼 초기화
	                    $(".commentConT").val("");
	                }
	            },
	            error: function(error) {
	                console.log("Error adding comment: " + error);
	            }
	        });
	    } else {
	        // 유효하지 않은 숫자 처리
	        console.error("Invalid comment number");
	        // 또는 기본값을 설정하거나 에러 처리를 수행할 수 있습니다.
	    }
	});
	
	function hide(){
		console.log("회원번호"+$("#sesUserNum").val());
		console.log("회원번호보드"+$("#boardUserNum").val());
		// 같은 회원 아니면 수정버튼 사라짐
		if ($("#sesUserNum").val() != $("#boardUserNum").val()) {
		    $("#modBtn").css("display", "none");
		};
		
		// 회원아니면 댓글 버튼 비활성화
		if ($("#sesUserNum").val() == '') {
		    console.log("asdasd");
		    $(".addCommentBtn").prop('disabled', true).css("background-color", "#c1c1c1");
		};
	};

}); // $(document).ready 함수 선언 종료---------------------------------------------------

// 클릭한 게시물의 조회수를 증가시키는 Ajax 요청
function clickBoard() {
	var urlParams = new URLSearchParams(window.location.search);
	var boardNum = urlParams.get('board_num');
	console.log("조회수: "+boardNum);
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
	var previewID = "imagePreview" + replaceID.charAt(replaceID.length-1);
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
            $("#" + previewID).empty();
            console.log("Image deleted successfully");
        },
        error: function(error) {
            console.log("Error: " + error);
        }
    });
});



function previewImage(input, previewId) {
    const maxFileSize = 2 * 1024 * 1024; // 2MB
    var file = input.files[0];
    console.log("file:" + file);

    if (file) {
        if (file.size > maxFileSize) {
            alert("파일 크기는 2MB를 초과할 수 없습니다.");
            input.value = ""; // 파일 선택 초기화
        } else {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#" + previewId).html('<img src="' + e.target.result + '" alt="Image Preview" class="img-fluid">');
            };
            reader.readAsDataURL(file);
        }
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
