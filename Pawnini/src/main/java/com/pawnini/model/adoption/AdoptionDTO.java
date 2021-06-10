package com.pawnini.model.adoption;

import java.sql.Date;

public class AdoptionDTO {

	private int adoption_id;
	private String adoption_name;
	private String adoption_title;
	private String adoption_content;
	private String adoption_f_img;
	private Date adoption_regdate;
	private String member_id;
	private String paws_id;
	
	
	public int getAdoption_id() {
		return adoption_id;
	}
	public void setAdoption_id(int adoption_id) {
		this.adoption_id = adoption_id;
	}
	public String getAdoption_name() {
		return adoption_name;
	}
	public void setAdoption_name(String adoption_name) {
		this.adoption_name = adoption_name;
	}
	public String getAdoption_title() {
		return adoption_title;
	}
	public void setAdoption_title(String adoption_title) {
		this.adoption_title = adoption_title;
	}
	public String getAdoption_content() {
		return adoption_content;
	}
	public void setAdoption_content(String adoption_content) {
		this.adoption_content = adoption_content;
	}
	public String getAdoption_f_img() {
		return adoption_f_img;
	}
	public void setAdoption_f_img(String adoption_f_img) {
		this.adoption_f_img = adoption_f_img;
	}
	public Date getAdoption_regdate() {
		return adoption_regdate;
	}
	public void setAdoption_regdate(Date adoption_regdate) {
		this.adoption_regdate = adoption_regdate;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPaws_id() {
		return paws_id;
	}
	public void setPaws_id(String paws_id) {
		this.paws_id = paws_id;
	}
	
	
	
}
