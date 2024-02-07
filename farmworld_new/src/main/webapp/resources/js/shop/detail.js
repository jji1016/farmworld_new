$(document).ready(function() {
    // 초기화 함수 호출
    init();
});

var paramData = {}; // 파라미터를 담는 객체

// 초기화 함수
function init(){
    // 페이지 로딩 시 상품 리스트를 가져오도록 호출
    getGoodList(paramData);
    // 상세 정보를 가져오도록 호출
    getDetailInfo();
}

// 검색 버튼 클릭시 이벤트
$("#searchBtn").click(function() {
    searchEvent();
});

// 검색 영역에서 엔터키 누를 시 이벤트
$("#searchInput").on("keyup",function(key){
    if(key.keyCode==13){
        searchEvent();
    }
});

// 카테고리 이름 클릭시 이벤트
$(document).on('click', '.category-btn', function(e){
    // 클릭한 카테고리의 이름을 파라미터로 설정
    paramData.goods_category = e.target.text;
    // 상품 리스트를 가져오는 함수 호출
    getGoodList(paramData);
});

// 장바구니 버튼 클릭시 이벤트
$(document).on('click', '.shopping-basket-btn', function(e){
    // 상품 번호를 가져와서 장바구니에 추가
    var chartData = {
        goods_num : e.target.getAttribute("value")
    };
    // 장바구니에 상품을 추가하는 함수 호출
    ajaxCall("insertCart","POST", chartData, function(reData){
        console.log(reData);
        if(reData.result === 'Y'){
            alert("장바구니에 상품을 담았습니다.");
        } else if(reData.result === 'N') {
            alert("장바구니 담기를 실패 하였습니다.");
        } else if(reData.result == "notLogin") {
         if(!alert("로그인이 필요합니다.")) {
            location.href = "../user/login";
         }
      }
    });
});

// 상품 상세보기 함수
function shopDetail(key){
    console.log(key);
    location.href="/shopdetail?detail=" + key;
}

// 검색 이벤트 함수
function searchEvent(){
    paramData.goods_title = $("#searchInput").val();
    getGoodList(paramData);
}

/**
 * 상품 리스트를 가져오는 함수
 */
function getGoodList(paramData){
    // 리스트 호출
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
                '                                    </div>';

            goodsListContents += goodsForm;
        });

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
                '\t                                   </li>';

            categoryListContents += categoryForm;
        });

        $('#categories').prepend(categoryListContents);
    });
}

// 금액 변환 함수
function convertMoney(data){
    return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 상세 정보를 가져오는 함수
function getDetailInfo(){
    // URL에서 상품 번호를 가져옴
    var urlData=getQueryStringObject();

    paramData={
        goods_num: urlData.detail
    };
    // 상품 상세 조회
    ajaxCall("shop-detail","POST", paramData, function(reData){
        console.log(reData);
        $.each(reData.shopDetail, function(key, item) {
        
        	console.log("fold"+reData.shopDetail.image_folder_num);
        	console.log("name"+reData.shopDetail.image1);
        
            // 금액일 경우 콤마 생성
            if(key === 'goods_price'){
                item = convertMoney(item);
            }
         
            if(key === 'image_folder_num'){
                  paramData.image_folder_num = item; // 수정된 부분
            }
            
            if(key === 'goods_inventory'){
                paramData.goods_inventory = item;
            }
            
            if(key === 'goods_view'){
                paramData.goods_view = item;
            }

            // 이미지에 경우 경로 지정
            if(key === 'image1'){
                $('#'+key).attr("src", "/resources/upload/" + reData.shopDetail.image_folder_num + '/' + reData.shopDetail.image1); // 수정된 부분
            }else{
                $('#'+key).text(item);
            }
        });

        if(reData.loginYn){
            $('#modifyBtn').show();
            $('#deleteBtn').show();
        }else{
            $('#modifyBtn').hide();
            $('#deleteBtn').hide();
        }
    });
}

// 수정 버튼 클릭시
$('#modifyBtn').click(function(){
    location.href="/goods?goods_num="+paramData.goods_num;
});
// 삭제 버튼 클릭시
$('#deleteBtn').click(function(){
    ajaxCall("delete_goods","POST", paramData, function(reData){
        // if(reData.result === 'Y'){
            alert("삭제하였습니다.");
            location.href="/shopmain";
        // }else{
        //     alert("삭제 실패");
        // }
    });
});
// 장바구니 담기 클릭시
$('#addCart').click(function(){
   
   paramData.count = $("#addCnt").val();
    ajaxCall("insertCart","POST", paramData, function(reData){
        console.log(reData);
        if(reData.result === 'Y'){
            alert("장바구니에 상품을 담았습니다.");
        } else if(reData.result === 'N') {
            alert("장바구니 담기를 실패 하였습니다.");
        } else if(reData.result == "notLogin") {
         if(!alert("로그인이 필요합니다.")) {
            location.href = "../user/login";
         }
      }
    });
});

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


function getQueryStringObject() {
    var a = window.location.search.substr(1).split('&');
    if (a == "") return {};
    var b = {};
    for (var i = 0; i < a.length; ++i) {
        var p = a[i].split('=', 2);
        if (p.length == 1)
            b[p[0]] = "";
        else
            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
    }
    return b;
}

function convertMoney(data){
    return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
}