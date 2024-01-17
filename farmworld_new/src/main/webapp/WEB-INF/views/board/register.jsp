<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
							<form action="/board/register" method="post">
								<select name="board_category">
									<option value="notice">공지사항</option>
									<option value="free_board">자유게시판</option>
								</select>
								<div class="form-group">
									<label>제목</label> <input class="form-control" name="board_title">
								</div>
								<div class="form-group">
									<label>작성자</label> <input class="form-control" name="user_nickname">
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="5" cols="40"
										name="board_content"></textarea>
								</div>
								
								<button type="submit" class="btn btn-default">등록하기</button>
								<button type="reset" class="btn btn-default">리셋</button>
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
<%@include file="../includes/footer.jsp"%>
