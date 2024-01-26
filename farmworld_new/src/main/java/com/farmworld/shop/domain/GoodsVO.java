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
	public int getGoods_inventory() {
		return goods_inventory;
	}
	public void setGoods_inventory(int goods_inventory) {
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
    private int goods_inventory;
    private int goods_view;
    private int image_folder_num;


}