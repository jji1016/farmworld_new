package com.farmworld.edu.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EduVO {
	private int edu_num;
	private String edu_title;
	private String edu_content;
	private Timestamp edu_date;
	private int edu_view;
	private int user_num;
	private int image_folder_num;
}
