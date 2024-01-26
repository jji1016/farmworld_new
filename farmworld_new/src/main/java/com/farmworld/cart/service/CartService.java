package com.farmworld.cart.service;

import java.util.List;

import com.farmworld.cart.domain.BillHistoryVO;
import com.farmworld.cart.domain.CartVO;
import com.farmworld.cart.domain.CntListVO;

public interface CartService {
	
	// 내 장바구니 가져오기
	List<CartVO> getMyCartList(CartVO cartVo);
	
	// 카테고리 개수들 가져오기
	List<CntListVO> categoryCntList(CartVO cartVo);
	
	// 장바구니에 담긴 상품 제거
	int delete(CartVO cartVo);
	
	// 장바구니에 담긴 상품 개수 증가
	int plus(CartVO cartVo);
	
	// 장바구니에 담긴 상품 개수 감소
	int minus(CartVO cartVo);
	
	// 결제 이력 저장
	int insertHistory(BillHistoryVO historyVo);
	
	// 카트에서 해당 사용자의 장바구니 목록 제거
	int removeCartInfo(BillHistoryVO historyVo);
	
	// 상품 장바구니에 담기
	int mergeGoods(CartVO cartVo);
}