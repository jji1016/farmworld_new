package com.farmworld.cart.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmworld.cart.domain.BillHistoryVO;
import com.farmworld.cart.domain.CartVO;
import com.farmworld.cart.domain.CntListVO;
import com.farmworld.cart.mapper.CartMapper;
import com.farmworld.login.domain.UserVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service("CartsService")
@Log4j
@AllArgsConstructor
public class CartServiceImpl implements CartService {
	private static final Logger log = LoggerFactory.getLogger(CartServiceImpl.class);

	@Autowired
	CartMapper mapper;

	// 내 장바구니 가져오기
	@Override
	public List<CartVO> getMyCartList(CartVO cartVo) {
		return mapper.getMyCartList(cartVo);
	}
	
	// 카테고리 개수들 가져오기
	@Override
	public List<CntListVO> categoryCntList(CartVO cartVo) {
		return mapper.categoryCntList(cartVo);
	}

	// 장바구니에 담긴 상품 제거
	@Override
	public int delete(CartVO cartVo) {
		// TODO Auto-generated method stub
		return mapper.delete(cartVo);
	}

	// 장바구니에 담긴 상품 개수 증가
	@Override
	public int plus(CartVO cartVo) {
		// TODO Auto-generated method stub
		return mapper.plus(cartVo);
	}

	// 장바구니에 담긴 상품 개수 감소
	@Override
	public int minus(CartVO cartVo) {
		// TODO Auto-generated method stub
		return mapper.minus(cartVo);
	}

	// 결제 이력 저장
	@Override
	public int insertHistory(BillHistoryVO historyVo) {
		// TODO Auto-generated method stub
		return mapper.insertHistory(historyVo);
	}

	// 카트에서 해당 사용자의 장바구니 목록 제거
	@Override
	public int removeCartInfo(BillHistoryVO historyVo) {
		// TODO Auto-generated method stub
		return mapper.removeCartInfo(historyVo);
	}

	// 상품 장바구니에 담기
	@Override
	public int mergeGoods(CartVO cartVo) {
		int cnt = mapper.getCount(cartVo); // 존재 여부 체크
		
		if(cnt == 0) {
			return mapper.insertCartData(cartVo);
		} else {
			return mapper.updateCartData(cartVo);
		}
	}
	 @Override
	    public UserVO userInfo(int user_Num) {
	        return mapper.userInfo(user_Num);
	    }
	}

