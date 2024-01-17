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
                        	<form role="form">
                        		<div class="form-group">
                                  <input class="form-control" type="hidden" name="bno" value="${board.board_num }">
                              </div>
                              <div class="form-group">
                                  <label>제목</label>
                                  <input class="form-control" name="title" readonly="readonly" value="${board.board_title }">
                              </div>
                              <div class="form-group">
                                  <label>작성자</label>
                                  <input class="form-control" name="writer" readonly="readonly" value="${board.user_nickname }">
                              </div>
							  <div class="form-group">
                                  <label>내용</label>
                                  <div class="form-control">
                                  	${board.board_content }
                                  </div>
                              </div>
                              
                              <button type="button" class="btn btn-default" data-oper = "list">목록으로</button>
                              <button type="button" class="btn btn-default" data-oper = "modify">수정하기</button>
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
