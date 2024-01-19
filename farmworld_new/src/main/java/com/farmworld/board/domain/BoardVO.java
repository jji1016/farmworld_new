package com.farmworld.board.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	private int board_num;
	private String board_title;
	private String board_content;
	private Timestamp board_date;
	private int board_view;
	private int user_num;
	private String user_nickname;
	private int image_folder_num;
	private String board_category;
	private String image1;
	private String image2;
	private String image3;
}
