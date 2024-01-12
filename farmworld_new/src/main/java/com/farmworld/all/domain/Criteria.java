package com.farmworld.all.domain;

import lombok.Data;

@Data
public class Criteria {
	String[] typeArr;
	private String type;
	private String keyword;
	private int pageNum;
	// 현재 사용자의 페이지 위치
	private int amount;
	// 한 페이지에 표시될 게시물의 갯수
	// 페이지 이동 시 첫 글에 대해 필요한 변수(LIMIT) 
	private int start;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.start = (pageNum-1)*amount;
	}
	public int getStart() {
		this.start=(this.pageNum-1)*amount;
		return this.start;
	}
	public String[] getTypeArr() {
		typeArr = this.type==null? new String[] {}:type.split("");
		return typeArr;
	}

}
