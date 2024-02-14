package com.farmworld.login.domain;

import lombok.Data;

@Data
public class UserVO {
	private int user_num;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_nickname;
	private String user_postCode;
	private String user_address;
	private String user_detailAddress;
	private String user_phone;
	private boolean user_isFarm; //mysql에서 데이터타입 tinyint인데 일단int타입 사용
	private int user_type;
	private String user_image;
	private String user_tag;
}
