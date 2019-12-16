package com.ibk.card.member.vo;

public class AddressVo {
	private String memNo;		// 멤버번호
	private String addrCode;	// 주소식별코드
	private String address;		// 주소
	private String addrPhone;	// 주소전화번호
	private String addrPost1;	// 신우편번호
	private String addrPost2;	// 구우편번호
	
	public AddressVo() { }

	public AddressVo(String memNo, String addrCode, String address, String addrPhone, String addrPost1,
			String addrPost2) {
		super();
		this.memNo = memNo;
		this.addrCode = addrCode;
		this.address = address;
		this.addrPhone = addrPhone;
		this.addrPost1 = addrPost1;
		this.addrPost2 = addrPost2;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getAddrCode() {
		return addrCode;
	}

	public void setAddrCode(String addrCode) {
		this.addrCode = addrCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddrPhone() {
		return addrPhone;
	}

	public void setAddrPhone(String addrPhone) {
		this.addrPhone = addrPhone;
	}

	public String getAddrPost1() {
		return addrPost1;
	}

	public void setAddrPost1(String addrPost1) {
		this.addrPost1 = addrPost1;
	}

	public String getAddrPost2() {
		return addrPost2;
	}

	public void setAddrPost2(String addrPost2) {
		this.addrPost2 = addrPost2;
	}

	@Override
	public String toString() {
		return "AddressVo [memNo=" + memNo + ", addrCode=" + addrCode + ", address=" + address + ", addrPhone="
				+ addrPhone + ", addrPost1=" + addrPost1 + ", addrPost2=" + addrPost2 + "]";
	}
}
	