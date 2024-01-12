package com.farmworld.shop.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GoodsVO {
	private int goods_num;
	private String goods_category;
	private String goods_title;
	private String goods_content;
	private int user_num;
	private Timestamp goods_startDate;
	private Timestamp goods_endDate;
	private int goods_price;
	private int goods_inventory;
	private int goods_view;
	private int image_folder_num;
	
}
