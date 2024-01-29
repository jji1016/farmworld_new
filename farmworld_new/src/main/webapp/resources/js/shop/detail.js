$(document).ready(function() {
    init();
});

var paramData={}
function init(){
    getDetailInfo();
};

// 상품상세 정보를 조회
function getDetailInfo(){

    var urlData=getQueryStringObject();

    paramData={
        goods_num: urlData.detail
    }
    // 상품상세 조회
    ajaxCall("shop-detail","POST", paramData, function(reData){
        console.log(reData);
        $.each(reData.shopDetail, function(key, item) {
            // 금액일 경우 콤마 생성
            if(key === 'goods_price'){
                item = convertMoney(item);
            }

            if(key === 'image_folder_num'){
                paramData.image_folder_num = item;
            }

            // 이미지에 경우 경로 지정
            if(key === 'image1'){
                $('#'+key).attr("src", "/resources/" + item);
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
        }else{
            alert("장바구니 담기를 실패 하였습니다.");
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