package com.farmworld.mypage.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_num;
	private int goods_num;
	private int user_num;
	private int review_score;
	private String review_content;
	private Timestamp review_date;
	private int image_folder_num;
}
