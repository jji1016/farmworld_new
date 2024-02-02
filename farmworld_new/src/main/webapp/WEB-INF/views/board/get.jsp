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

<%
    // 경로 변수에서 값 가져오기
    String board_date = request.getParameter("board_date");
%>
<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<div id="page-wrapper">
			<div class="row conMargin">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form method="get" class="modForm" action="/board/modify">
								<div class="form-group">
									<input class="form-control" type="hidden" name="board_num"
										value="${board.board_num }">
									<input id="sesUserNum" type="hidden" value="${user_num }">
									<input id="boardUserNum" type="hidden" value="${board.user_num }">
								</div>
								<div class="rapTWD">
									<div class="form-group BTitleWidth">
									<input class="form-control mod_form-control BTitle" name="title"
										readonly="readonly" value="${board.board_title }">
								</div>
								<div class="form-group rapWD">
									<input class="form-control mod_form-control BNick" name="writer"
										readonly="readonly" value="${board.user_nickname }">
									<div class="form-control mod_form-control BDate"> | <%= board_date %></div>
								</div>
								</div>
								<div class="form-group rapCI">
									
									<div class="form-control mod_form-control">${board.board_content }</div>
									<div class="form-control mod_form-control rapI">
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
								<button type="button" class="btn btn-default btnRight" 
									onclick="location.href='/board/list?board_category=${param.board_category}'">목록으로</button>
								<button type="submit" id="modBtn" class="btn btn-default btnRight" data-oper="modify">수정하기</button>
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
                            <input type="hidden" id="user_nickname" value="${user_nickname}">
                        </div>
                        <div class="commentNick" data-user-nickname="${user_nickname}">
						    <c:if test="${user_nickname == null}">
						        로그인 해주세요
						    </c:if>
						    <c:if test="${user_nickname != null}">
						        ${user_nickname}
						    </c:if>
						</div>

                        <textarea class="commentCon" name="comment_contents" placeholder="댓글을 입력하세요"></textarea>
                        <input type="submit" class="addCommentBtn" value="등록하기" >
                    </form>
                </div>
                
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
</div>
<script src="/resources/js/board/board.js" type="text/javascript"></script>
<%@include file="../includes/footer.jsp"%>
