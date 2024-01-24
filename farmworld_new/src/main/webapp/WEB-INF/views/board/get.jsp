<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="/resources/editor/summernote-lite.css">
<link href="/resources/css/board/board.css" rel="stylesheet">
<script src="/resources/editor/summernote-ko-KR.js">
	
</script>
<script src="/resources/editor/summernote-lite.js">
	
</script>

<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Board Get</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form method="get" action="/board/modify">
								<div class="form-group">
									<input class="form-control" type="hidden" name="board_num"
										value="${board.board_num }">
								</div>
								<div class="form-group">
									<label>제목</label> <input class="form-control" name="title"
										readonly="readonly" value="${board.board_title }">
								</div>
								<div class="form-group">
									<label>작성자</label> <input class="form-control" name="writer"
										readonly="readonly" value="${board.user_nickname }">
								</div>
								<div class="form-group">
									<label>내용</label>
									<div class="form-control">${board.board_content }</div>
									<div class="form-control">
										<c:if test="${board.image1 != null}">
											<img
												src="/resources/upload/${board.image_folder_num }/${board.image1}">
										</c:if>
										<c:if test="${board.image2 != null}">
											<img
												src="/resources/upload/${board.image_folder_num }/${board.image2}">
										</c:if>
										<c:if test="${board.image3 != null}">
											<img
												src="/resources/upload/${board.image_folder_num }/${board.image3}">
										</c:if>
									</div>
								</div>

								<button type="submit" class="btn btn-default" data-oper="modify">수정하기</button>
								<button type="button" class="btn-default"
									onclick="location.href='/board/list?board_category=${param.board_category}'">목록으로</button>
							</form>
						</div>
					</div>
				</div>
				
				<!-- 댓글 부분 -->
				<div id="commentRap">
                    <h2>댓글</h2>
                    <div id="commentList">
                        <!-- 댓글 목록을 동적으로 추가할 자리 -->
                    </div>

                    <form class="comment_register" id="commentForm" method="post">
                        <div class="form-group">
                            <input type="hidden" id="boardNum" name="board_num" value="${board.board_num}">
                        </div>
                       <div class="commentNick">nickname 자리</div>
                        <textarea class="commentCon" name="comment_contents" placeholder="댓글을 입력하세요"></textarea>
                        <input type="submit" class="addCommentBtn" value="등록하기">
                    </form>
                </div>
                
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
</div>
<script src="/resources/js/board/board.js" type="text/javascript"></script>
<%@include file="../includes/footer.jsp"%>
