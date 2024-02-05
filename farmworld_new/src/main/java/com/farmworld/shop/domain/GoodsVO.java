package com.farmworld.shop.domain;

import lombok.Data;

@Data
public class GoodsVO {
    public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public String getGoods_category() {
		return goods_category;
	}
	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}
	public String getGoods_title() {
		return goods_title;
	}
	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}
	public String getGoods_content() {
		return goods_content;
	}
	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_inventory() {
		return goods_inventory;
	}
	public void setGoods_inventory(String goods_inventory) {
		this.goods_inventory = goods_inventory;
	}
	public int getGoods_view() {
		return goods_view;
	}
	public void setGoods_view(int goods_view) {
		this.goods_view = goods_view;
	}
	public int getImage_folder_num() {
		return image_folder_num;
	}
	public void setImage_folder_num(int image_folder_num) {
		this.image_folder_num = image_folder_num;
	}

	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}

	private int goods_num;
    private String goods_category;
    private String goods_title;
    private String goods_content;
	private String image1;
    private int user_num;
    private int goods_price;
    private String goods_inventory;
    private int goods_view;
    private int image_folder_num;

 // 페이징 관련
    private int totalCnt;	// 전체 페이징 갯수
    private int nowPage;	// 현재 페이징 번호
    private int startCnt;	// 페이징 시작 번호
    private int endCnt;		// 페이징 마지막 번호
    
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartCnt() {
		return startCnt;
	}
	public void setStartCnt(int startCnt) {
		this.startCnt = startCnt;
	}
	public int getEndCnt() {
		return endCnt;
	}
	public void setEndCnt(int endCnt) {
		this.endCnt = endCnt;
	}


}