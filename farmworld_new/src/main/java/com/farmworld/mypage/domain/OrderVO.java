package com.farmworld.mypage.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {
	private int order_num;
	private Timestamp order_date;
	private int goods_num;
	private int buyer_num;
	private int seller_num;
	private int order_price;
}
