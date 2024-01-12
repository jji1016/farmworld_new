package com.farmworld.farm.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GrowUpVO {
	private int grow_num;
	private String grow_title;
	private String grow_content;
	private Timestamp grow_date;
	private int farm_num;
	private int user_num;
	private int image_folder_num;
	private String growup_category;
}
