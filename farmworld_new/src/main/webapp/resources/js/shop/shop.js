// 리스트 파라미터를 담는 객체
var paramData = {
	"nowPage": "0"
}

$(document).ready(function() {
    init();
});

function init(){
    getGoodList(paramData);
}

// 검색 버튼 클릭시
$("#searchBtn").click(function() {
    searchEvent();
});

// 검색영역에서 엔터키 누를시
$("#searchInput").on("keyup",function(key){
    if(key.keyCode==13){
        searchEvent();
    }
});

// 카테고리 이름 클릭시
$(document).on('click', '.category-btn', function(e){
    paramData.goods_category = e.target.text;
    paramData.nowPage		 = "0";
    getGoodList(paramData);
});

// 장바구니 버튼 클릭시
$(document).on('click', '.shopping-basket-btn', function(e){

    var chartData = {
        goods_num : e.target.getAttribute("value") // 상품 번호
    }

    ajaxCall("insertCart","POST", chartData, function(reData){
        console.log(reData);
        if(reData.result === 'Y'){
            alert("장바구니에 상품을 담았습니다.");
        }else{
            alert("장바구니 담기를 실패 하였습니다.");
        }
    });
});

// 상품 상세보기
function shopDetail(key){
    console.log(key);
    location.href="/shopdetail?detail=" + key;
}



function searchEvent(){
    paramData.goods_title = $("#searchInput").val();
    getGoodList(paramData);
}

/**
 * 리스트를 만드는 함수
 */
function getGoodList(paramData){

    //리스트 호출
    ajaxCall("goods-list","POST", paramData, function(reData){
        console.log(reData);

        var goodsListContents = '';
        var categoryListContents = '';

        // 리스트 초기화
        $('#goodsList').empty();
        // 리스트 만들기
        $.each(reData.goodsList, function(num, item){

            var goods_content = item.goods_content !== null ? item.goods_content : "";
            var goodsForm = '<div class="col-md-6 col-lg-6 col-xl-4" onclick="shopDetail('+item.goods_num+')">\n' +
                '                                        <div class="rounded position-relative fruite-item">\n' +
                '                                            <div class="fruite-img">\n' +
                '                                                <img src="/resources/'+item.image1+'" class="img-fluid w-100 rounded-top" alt="">\n' +
                '                                            </div>\n' +
                '                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">'+item.goods_category+'\n</div>\n' +
                '                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">\n' +
                '                                                <h4>'+item.goods_title+'</h4>\n' +
                '                                                <p>'+goods_content+'</p>\n' +
                '                                                <div class="d-flex justify-content-between flex-lg-wrap">\n' +
                '                                                    <p class="text-dark fs-5 fw-bold mb-0">1kg / '+convertMoney(item.goods_price)+'</p>\n' +
                '                                                    <a href="javascript:void(0)" class="btn border border-secondary rounded-pill px-3 text-primary shopping-basket-btn" value="'+item.goods_num+'"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>\n' +
                '                                                </div>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '                                    </div>'


            goodsListContents += goodsForm;
        });
        
        paramData.totalCnt = reData.page.totalCnt; 
        
        
        var paging =	'<div class="col-12">';
        paging +=		'	<div class="pagination d-flex justify-content-center mt-5">';
        paging +=		'		<a href="#none" class="rounded" onclick="goPage(\'F\')">&laquo;</a>';
        
        
        for(var i=0; i<paramData.totalCnt; i++) {
			var cls = paramData.nowPage == i ? 'active rounded' : '';
			paging +=	'		<a href="#none" onclick="goPage(\''+ i +'\')" class="'+ cls +'">'+ Number(Number(i) + Number(1)) +'</a>';	
		}
        
		paging +=		'		<a href="#none" class="rounded" onclick="goPage(\'L\')">&raquo;</a>';
		paging +=		'	</div>';
		paging +=		'</div>';
		
		goodsListContents += paging;

        $('#goodsList').prepend(goodsListContents);

        $('#categories').empty();
        // 카테고리 만들기
        $.each(reData.categoryList, function(num, item){
            var categoryForm = '<li>\n' +
                '\t                                       <div class="d-flex justify-content-between fruite-name">\n' +
                '\t                                           <a href="javascript:void(0)" class="category-btn"><i class="fas fa-apple-alt me-2"></i>'+item.category
                +'</a>\n' +
                '\t                                           <span>('+item.cnt+')</span>\n' +
                '\t                                       </div>\n' +
                '\t                                   </li>'

            categoryListContents += categoryForm;
        });

        $('#categories').prepend(categoryListContents);
    });
}

function convertMoney(data){
    return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
}

function goPage(state) {
	if(state == "F") {
		paramData.nowPage = "0";
	} else if(state == "L") {
		paramData.nowPage = Number(Number(paramData.totalCnt) - Number(1));
	} else {
		paramData.nowPage = state;
	}
	
	getGoodList(paramData);
}


function ajaxCall(url, type, paramData, callback){
    $.ajax({
        url: url,
        type: type,
        dataType : "json",
        data: paramData,
        success:function(data){
            console.log(data);
            return callback(data);

        },
        error: function(e) {
            console.log(e);
            return callback(e);

        }
    });
}