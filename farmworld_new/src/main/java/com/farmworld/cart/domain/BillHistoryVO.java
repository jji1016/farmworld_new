package com.farmworld.cart.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BillHistoryVO {
	private int history_no;			// 히스토리 시퀄스
	private int user_no;			// 유저 테이블 시퀀스
	private String name_first;		// 성
	private String name_last;		// 이름
	private String company_name;	// 회사명
	private String addr;			// 주소
	private String postcode;		// 우편번호
	private String city;			// 도시
	private String country;			// 나라
	private String mobile;			// 핸드폰
	private String email;			// 이메일
	private String shipDetail;		// 요구사항
	private int amt;				// 결제금액
	private Timestamp history_date;	// insert 날짜
	public int getHistory_no() {
		return history_no;
	}
	public void setHistory_no(int history_no) {
		this.history_no = history_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getName_first() {
		return name_first;
	}
	public void setName_first(String name_first) {
		this.name_first = name_first;
	}
	public String getName_last() {
		return name_last;
	}
	public void setName_last(String name_last) {
		this.name_last = name_last;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getShipDetail() {
		return shipDetail;
	}
	public void setShipDetail(String shipDetail) {
		this.shipDetail = shipDetail;
	}
	public int getAmt() {
		return amt;
	}
	public void setAmt(int amt) {
		this.amt = amt;
	}
	public Timestamp getHistory_date() {
		return history_date;
	}
	public void setHistory_date(Timestamp history_date) {
		this.history_date = history_date;
	}
}