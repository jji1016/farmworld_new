package com.farmworld.all.domain;


public class pageDTO {
	// 페이징 처리에서 표시될 시작 페이지
		private int startPage;
		// 페이징 처리에서 표시될 진짜 마지막 페이지
		private int endPage;
		// 다음, 이전페이지가 있는지 여부
		private boolean prev, next;
		// 전체 데이터의 갯수
		private int total;

		private Criteria cri;

		public pageDTO() {

		}

		// 사용자가 선택한 값(request), DB에서 확인할 값(total)
		public pageDTO(Criteria cri, int total) {
			this.cri = cri;
			this.total = total;
			this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)*10);
			this.startPage=this.endPage-9;
			int realEnd=(int)(Math.ceil((total*1.0)/cri.getAmount()));
			if(realEnd<=this.endPage) {
				this.endPage = realEnd;
			
			}
			this.prev = this.startPage>1;
			this.next = this.endPage<realEnd;
		}

}
