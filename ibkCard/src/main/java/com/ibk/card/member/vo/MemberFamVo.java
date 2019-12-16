package com.ibk.card.member.vo;

public class MemberFamVo {
	private String memFNo;
	private String memFKname;
	private String memFEname;
	private String memFBirth;
	private String memFRe;
	private int memFlimit;
	private String memFphone;
	
	public MemberFamVo() { }

	public MemberFamVo(String memFNo, String memFKname, String memFEname, String memFBirth, String memFRe,
			int memFlimit, String memFphone) {
		super();
		this.memFNo = memFNo;
		this.memFKname = memFKname;
		this.memFEname = memFEname;
		this.memFBirth = memFBirth;
		this.memFRe = memFRe;
		this.memFlimit = memFlimit;
		this.memFphone = memFphone;
	}

	public String getMemFNo() {
		return memFNo;
	}

	public void setMemFNo(String memFNo) {
		this.memFNo = memFNo;
	}

	public String getMemFKname() {
		return memFKname;
	}

	public void setMemFKname(String memFKname) {
		this.memFKname = memFKname;
	}

	public String getMemFEname() {
		return memFEname;
	}

	public void setMemFEname(String memFEname) {
		this.memFEname = memFEname;
	}

	public String getMemFBirth() {
		return memFBirth;
	}

	public void setMemFBirth(String memFBirth) {
		this.memFBirth = memFBirth;
	}

	public String getMemFRe() {
		return memFRe;
	}

	public void setMemFRe(String memFRe) {
		this.memFRe = memFRe;
	}

	public int getMemFlimit() {
		return memFlimit;
	}

	public void setMemFlimit(Integer memFlimit) {
		if ( memFlimit == null ) this.memFlimit = 0;
		else this.memFlimit = memFlimit;
	}

	public String getMemFphone() {
		return memFphone;
	}

	public void setMemFphone(String memFphone) {
		this.memFphone = memFphone;
	}

	@Override
	public String toString() {
		return "MemberFamVo [memFNo=" + memFNo + ", memFKname=" + memFKname + ", memFEname=" + memFEname
				+ ", memFBirth=" + memFBirth + ", memFRe=" + memFRe + ", memFlimit=" + memFlimit + ", memFphone="
				+ memFphone + "]";
	}
}
