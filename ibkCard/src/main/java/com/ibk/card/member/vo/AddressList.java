package com.ibk.card.member.vo;

import java.util.List;

public class AddressList {
	private String memNo;
	private List<AddressVo> addrList;
	
	public AddressList() { }

	public AddressList(String memNo, List<AddressVo> addrList) {
		super();
		this.memNo = memNo;
		this.addrList = addrList;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		for ( AddressVo addr : this.addrList ) {
			addr.setMemNo(memNo);
		}
		this.memNo = memNo;
	}

	public List<AddressVo> getAddrList() {
		return addrList;
	}

	public void setAddrList(List<AddressVo> addrList) {
		this.addrList = addrList;
	}

	@Override
	public String toString() {
		return "AddressList [memNo=" + memNo + ", addrList=" + addrList + "]";
	}
	
	
}
