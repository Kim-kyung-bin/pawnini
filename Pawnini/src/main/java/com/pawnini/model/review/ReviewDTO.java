package com.pawnini.model.review;

import java.sql.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;
// 후기 DB 컬럼
@XmlAccessorType(XmlAccessType.FIELD)
public class ReviewDTO {
	private int rev_id;
	private String rev_writer;
	private String rev_title;
	private String rev_content;
	private String rev_f_category;
	private Date rev_date;
	private String rev_show;
	private int rev_like;
	private int rev_stars;
	private String member_id;
	private int product_id;
	@XmlTransient
	private String searchCondition;
	@XmlTransient
	private String searchKeyword;
	
	public int getRev_id() {
		return rev_id;
	}
	public void setRev_id(int rev_id) {
		this.rev_id = rev_id;
	}
	public String getRev_writer() {
		return rev_writer;
	}
	public void setRev_writer(String rev_writer) {
		this.rev_writer = rev_writer;
	}
	public String getRev_title() {
		return rev_title;
	}
	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public String getRev_f_category() {
		return rev_f_category;
	}
	public void setRev_f_category(String rev_f_category) {
		this.rev_f_category = rev_f_category;
	}
	public Date getRev_date() {
		return rev_date;
	}
	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}
	public String getRev_show() {
		return rev_show;
	}
	public void setRev_show(String rev_show) {
		this.rev_show = rev_show;
	}
	public int getRev_like() {
		return rev_like;
	}
	public void setRev_like(int rev_like) {
		this.rev_like = rev_like;
	}
	public int getRev_stars() {
		return rev_stars;
	}
	public void setRev_stars(int rev_stars) {
		this.rev_stars = rev_stars;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	@Override
	public String toString() {
		return "ReviewDTO [rev_id=" + rev_id + ", rev_writer=" + rev_writer + ", rev_title=" + rev_title
				+ ", rev_content=" + rev_content + ", rev_f_category=" + rev_f_category + ", rev_date=" + rev_date
				+ ", rev_show=" + rev_show + ", rev_like=" + rev_like + ", rev_stars=" + rev_stars + ", member_id="
				+ member_id + ", product_id=" + product_id + "]";
	}
	
}
