package com.bh.b4.member;

public class MemberDTO {
	
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	
	private MemberFilesDTO memberFilesDTO;
	
	//--------------------getter, setter
	public MemberFilesDTO getMemberFilesDTO() {
		return memberFilesDTO;
	}
	public void setMemberFilesDTO(MemberFilesDTO memberFilesDTO) {
		this.memberFilesDTO = memberFilesDTO;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
