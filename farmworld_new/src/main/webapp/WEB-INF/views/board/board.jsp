<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<link href="/resources/css/board/board.css" rel="stylesheet">
<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5"></div>
<!-- 상단 공백 추가 끝 -->

<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<input  type="hidden" id="board_ENname" value="${param.board_category }">
		<h1 class="mb-4 board_name" >공지사항</h1>
		<div class="row g-4">
			<div class="col-lg-12">
				<div class="row g-4">
					<div class="col-xl-3"></div>
					<div class="col-6">
						<form id="searchForm" action="/board/list" method="get">
							<input  type="hidden" name="board_category" value="${param.board_category }">
							<div class="form-group col-xs-4">
								<select id="type" class="board_type form-control" name="type">
									<option value=""
										<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>전체</option>
									<option value="T"
										<c:out value="${pageMaker.cri.type == 'T'?'selected':''}"/>>제목</option>
									<option value="C"
										<c:out value="${pageMaker.cri.type == 'C'?'selected':''}"/>>내용</option>
									<option value="W"
										<c:out value="${pageMaker.cri.type == 'W'?'selected':''}"/>>작성자</option>
									<option value="TC"
										<c:out value="${pageMaker.cri.type == 'TC'?'selected':''}"/>>제목+내용</option>
									<!-- <option value="TC">제목+내용</option>  -->
								</select>
								
								<div class="form-group input-group">
									<input type='text' name='keyword'
										value='<c:out value="${pageMaker.cri.keyword}"/>' /> <span
										class="input-group-btn">
										<button class="btn btn-default">
											<i class="fa fa-search"></i>
										</button>
									</span>
								</div>
							</div>

						</form>
					</div>
				</div>
				<div class="row g-4">
					<!-- 카테고리 -->
					<div class="col-lg-3">
						<div class="row g-4">
							<div class="col-lg-12">
								<div class="mb-3">

									<h4>Categories</h4>
										<ul class="list-unstyled fruite-categorie">
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="/board/list?board_category=notice" 
													class="category-link notice" ><i class="fas fa-apple-alt me-2"></i>공지사항</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="/board/list?board_category=free_board" 
													class="category-link free_board" ><i class="fas fa-apple-alt me-2"></i>자유게시판</a>
												</div>
											</li>
											<!-- 다른 항목들도 유사하게 추가할 수 있습니다. -->
										</ul>

								</div>
							</div>
						</div>
						<!-- 카테고리 끝 -->
					</div>

					<div class="col-lg-9">
						<!-- 보드 -->
						<div class="table-responsive">

							<table class="table">
								<thead>
									<tr>
										<th>board_num</th>
										<th>board_title</th>
										<th>user_nickname</th>
										<th>board_date</th>
										<th>board_view</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>

							<div class="pull-right">
								<div class="pagingBtn btnLeft"></div>
								<ul class="pagination">
									<c:if test="${pageMaker.prev }">
										<li class="paginate_button previous"><a
											href="${pageMaker.startPage -1 }">이전</a></li>
									</c:if>
									<c:forEach var="num" begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }">
										<li
											class="paginate_button ${pageMaker.cri.pageNum ==num?'active':'' }">
											<a href="${num }">${num }</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next }">
										<li class="paginate_button next"><a
											href="${pageMaker.endPage +1 }">다음</a></li>
									</c:if>
								</ul>
								
								<button id="regBtn" class="pagingBtn btnRight">글쓰기</button>
							</div>

							<form id="actionForm" action="/board/list" method="get">
								<input type="hidden" name="pageNum"	value="${pageMaker.cri.pageNum }"> 
								<input type="hidden" name="amount" value="${pageMaker.cri.amount }"> 
								<input type="hidden" name="type" value="${pageMaker.cri.type }">
								<input type="hidden" name="keyword"	value="${pageMaker.cri.keyword }">
								<input type="hidden" name="board_category"	value="${pageMaker.cri.board_category }">
							</form>
						</div>
					</div>
					<!-- col-lg-9 끝 -->

				</div>
			</div>
		</div>
	</div>
</div>
<!--End-->

 <!-- board js -->
    <script src="/resources/js/board/board.js" type="text/javascript"></script>
<%@include file="../includes/footer.jsp"%>
