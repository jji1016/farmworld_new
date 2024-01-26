package com.farmworld.cart.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CartVO {
	private int cart_num;			// 카트 시퀀스
	private int goods_num;			// 상품 시퀀스 
	private int count;				// 개수
	private int user_num;			// 사용자 시퀀스
	private Timestamp insert_date;	// 기록
	private int goods_price;		// 상품가격
	private String image1;			// 상품 이미지 경로
	private String goods_title;		// 상품 명
	private String total_amt;		// 총 금액
	private String make_price;		// 콤마 붙인 가격
	private String keywords;		// 키워드로 검색
	private String category;		// 카테고리로 검색
	private String bill_amt;		// 결제화면에서 사용할 합계
	
	public String getMake_price() {
		return make_price;
	}
	public void setMake_price(String make_price) {
		this.make_price = make_price;
	}
	public int getCart_num() {
		return cart_num;
	}
	public String getTotal_amt() {
		return total_amt;
	}
	public void setTotal_amt(String total_amt) {
		this.total_amt = total_amt;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public Timestamp getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Timestamp insert_date) {
		this.insert_date = insert_date;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getGoods_title() {
		return goods_title;
	}
	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBill_amt() {
		return bill_amt;
	}
	public void setBill_amt(String bill_amt) {
		this.bill_amt = bill_amt;
	}
}