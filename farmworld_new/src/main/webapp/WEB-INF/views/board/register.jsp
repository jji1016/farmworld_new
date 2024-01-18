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
					<h1 class="page-header">Board Register</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form action="/board/register" method="post" enctype="multipart/form-data">
								<select name="board_category">
									<option value="notice">공지사항</option>
									<option value="free_board">자유게시판</option>
								</select>
								<div class="form-group">
									<label>제목</label> <input class="form-control" name="board_title" required="required">
								</div>
								<div class="form-group">
									<label>작성자</label> <input class="form-control" name="user_nickname">
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea name="board_content" id="BOARDCONT" required="required" maxlength="10000" cols="30" rows="5" placeholder="내용을 입력해주세요" class="with-border"></textarea>
								</div>
								<div class="form-group">
					                <label for="image1">이미지 업로드</label>
					                <input type="file" name="files" id="image1" class="form-control-file" onchange="previewImage(this, 'imagePreview1')">
					                </div><div id="imagePreview1" class="col-8"></div>
					                <div class="col-4">
					                <input type="file" name="files" id="image2" class="form-control-file" onchange="previewImage(this, 'imagePreview2')">
					                </div><div id="imagePreview2" class="col-8"></div>
					                <div class="col-4">
					                <input type="file" name="files" id="image3" class="form-control-file" onchange="previewImage(this, 'imagePreview3')">
                                	</div><div id="imagePreview3" class="col-8"></div>
								
								<button type="submit" class="btn btn-default">등록하기</button>
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
