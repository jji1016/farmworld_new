package com.farmworld.all.domain;

import lombok.Data;

@Data
public class ImageVO {
	private Integer image_folder_num;
	private String image1;
	private String image2;
	private String image3;
	

    public Integer getImage_folder_num() {
        return image_folder_num;
    }

    public void setImage_folder_num(Integer image_folder_num) {
        this.image_folder_num = image_folder_num;
    }
}
