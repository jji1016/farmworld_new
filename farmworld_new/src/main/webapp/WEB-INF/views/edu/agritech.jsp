<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<link href="/resources/css/edu/edu.css" rel="stylesheet">


<div class="container-fluid py-5"></div>
<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<h1>이달의 농업기술</h1>
		<div class="search_Form">
			<form action="/edu/agritech" method="get">
				<fieldset>
					<ul>
						<li><label for="eduMonth" class="sr_only">기간 선택</label> 
							<select id="eduMonth" class="form-control" name="eduMonth">
									<option value="" selected="selected">전체</option>
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
							</select></li>
						<li><span class="form-input">
								<input type="text" id="srchStr" class="form-control " name="srchStr" placeholder="검색어를 입력하세요."
								title="검색어를 입력하세요." value="" autocomplete="off" autocapitalize="off">
						</span><span class="form-btn"><button type="submit" class="input-group-text p-3" >검색</button></span></li>
					</ul>
				</fieldset>
			</form>
		</div>

		<div id="resultArea"></div>
		<div id="pagingBox" class="pagination mt-5"></div>
	</div>
</div>



<script src="/resources/js/edu/edu.js" type="text/javascript"></script>
<%@include file="../includes/footer.jsp"%>
