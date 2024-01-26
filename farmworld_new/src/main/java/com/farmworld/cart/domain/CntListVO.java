package com.farmworld.cart.domain;

import lombok.Data;

@Data
public class CntListVO {
	private String category;	// 상품 명
	private int cnt;			// 상품 총 개수

	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}