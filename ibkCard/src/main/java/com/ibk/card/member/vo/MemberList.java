package com.ibk.card.member.vo;

import java.util.List;

public class MemberList {
	private List<MemberVo> mList;
	
	public MemberList() {}

	public MemberList(List<MemberVo> mList) {
		super();
		this.mList = mList;
	}

	public List<MemberVo> getmList() {
		return mList;
	}

	public void setmList(List<MemberVo> mList) {
		this.mList = mList;
	}

	@Override
	public String toString() {
		return "MemberList [mList=" + mList + "]";
	}
}
