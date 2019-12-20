package com.ibk.card.member.vo;

public class JqgridVo {
	private String serviceImplYn;
	private String seq;
	private String name;
	private String address;
	private String etcc;
	private String gender;
	private String rows;
	private String param1;
	
	public JqgridVo() {}

	public JqgridVo(String serviceImplYn, String seq, String name, String address, String etcc, String gender,
			String rows, String param1) {
		super();
		this.serviceImplYn = serviceImplYn;
		this.seq = seq;
		this.name = name;
		this.address = address;
		this.etcc = etcc;
		this.gender = gender;
		this.rows = rows;
		this.param1 = param1;
	}

	public String getServiceImplYn() {
		return serviceImplYn;
	}

	public void setServiceImplYn(String serviceImplYn) {
		this.serviceImplYn = serviceImplYn;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEtcc() {
		return etcc;
	}

	public void setEtcc(String etcc) {
		this.etcc = etcc;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public String getParam1() {
		return param1;
	}

	public void setParam1(String param1) {
		this.param1 = param1;
	}

	@Override
	public String toString() {
		return "JqgridVo [serviceImplYn=" + serviceImplYn + ", seq=" + seq + ", name=" + name + ", address=" + address
				+ ", etcc=" + etcc + ", gender=" + gender + ", rows=" + rows + ", param1=" + param1 + "]";
	}
}
