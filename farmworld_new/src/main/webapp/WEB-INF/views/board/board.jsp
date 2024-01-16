<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<!-- 상단 공백 추가 끝 -->
<div class="container-fluid py-5"></div>
<!-- 상단 공백 추가 끝 -->

<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<h1 class="mb-4">게시판</h1>
		<div class="row g-4">
			<div class="col-lg-12">
				<div class="row g-4">
					<div class="col-xl-3">
						<div class="input-group w-100 mx-auto d-flex">
							<input type="search" class="form-control p-3"
								placeholder="keywords" aria-describedby="search-icon-1">
							<span id="search-icon-1" class="input-group-text p-3"><i
								class="fa fa-search"></i></span>
						</div>
					</div>
					<div class="col-6"></div>
					<div class="col-xl-3">
						<div
							class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
							<label for="fruits">Default Sorting:</label> <select id="fruits"
								name="fruitlist" class="border-0 form-select-sm bg-light me-3"
								form="fruitform">
								<option value="volvo">Nothing</option>
								<option value="saab">Popularity</option>
								<option value="opel">Organic</option>
								<option value="audi">Fantastic</option>
							</select>
						</div>
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
													<a class="category-link notice" ><i class="fas fa-apple-alt me-2"></i>공지사항</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a class="category-link free_board" ><i class="fas fa-apple-alt me-2"></i>자유게시판</a>
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
							</div>

							<form id="actionForm" action="/board/list" method="get">
								<input type="hidden" name="pageNum"
									value="${pageMaker.cri.pageNum }"> <input type="hidden"
									name="amount" value="${pageMaker.cri.amount }"> <input
									type="hidden" name="type" value="${pageMaker.cri.type }">
								<input type="hidden" name="keyword"
									value="${pageMaker.cri.keyword }">
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