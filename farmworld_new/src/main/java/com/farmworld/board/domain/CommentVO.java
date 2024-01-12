package com.farmworld.board.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	private int comment_num;
	private String comment_contents;
	private Timestamp comment_date;
	private int user_num;
	private int board_num;
}
