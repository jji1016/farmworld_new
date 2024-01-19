<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="/resources/editor/summernote-lite.css">
<script src="/resources/editor/summernote-ko-KR.js"> </script>
<script src="/resources/editor/summernote-lite.js"> </script>

<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Board Modify</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form id="modify_form" role="form" enctype="multipart/form-data">
								<input name="board_num" type="hidden" value="${board.board_num }">
								<input name="image_folder_num" type="hidden" value="${board.image_folder_num }">
								<input id="category" name="board_category" type="hidden" value="${board.board_category }">
								<div class="form-group">
									<label>제목</label><input class="form-control" name="board_title" required="required" value="${board.board_title}">
								</div>
								<div class="form-group">
									<label>작성자</label><input class="form-control" name="user_nickname" readonly="readonly" value="${board.user_nickname }">
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea name="board_content" id="BOARDCONT" required="required" 
										maxlength="10000" cols="30" rows="5" placeholder="내용을 입력해주세요" class="with-border">
										${board.board_content}
									</textarea>
								</div>
								<div class="form-group">
                                    <label for="image1">이미지 업로드</label>
                                    <input type="file" name="files" id="image1" class="form-control-file"  value="${board.image1}">
                                    <div id="imagePreview1" class="col-8">
                                    	<c:if test="${board.image1 != null}">
                                    		<img src="/resources/upload/${board.image_folder_num }/${board.image1}">
                                    	</c:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="image2">이미지 업로드</label>
                                    <input type="file" name="files" id="image2" class="form-control-file">
                                    <div id="imagePreview2" class="col-8">
                                    	<c:if test="${board.image2 != null}">
                                    		<img src="/resources/upload/${board.image_folder_num }/${board.image2}">
                                    	</c:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="image3">이미지 업로드</label>
                                    <input type="file" name="files" id="image3" class="form-control-file">
                                    <div id="imagePreview3" class="col-8">
                                    	<c:if test="${board.image3 != null}">
                                    		<img src="/resources/upload/${board.image_folder_num }/${board.image3}">
                                    	</c:if>
                                    </div>
                                </div>
								
								<button type="button" class="btn btn-default" data-oper = "modify">수정완료</button>
								<button type="button" class="btn btn-default" data-oper = "remove">삭제</button>
                                <button type="button" class="btn-default" onclick ="location.href='/board/list?board_category=${board.board_category}'">목록으로</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
				
			
		</div>
		<!-- /#page-wrapper -->
	</div>
</div>

<script src="/resources/js/board/board.js" type="text/javascript"></script>
<%@include file="../includes/footer.jsp"%>
