package com.ibk.card.member.vo;

import java.sql.Date;
import java.util.List;

public class MemberVo {
	private String memNo; 		// 고객번호
	private String memKname; 	// 한국이름
	private String memEname;	// 영어이름
	private String memBirth;	// 생년월일
	private String memCphone;	// 모바일전화
	private String memSphone;	// SMS수신핸드폰
	private String memEmail;	// 이메일
	private String memSmsCode;	// 승인내역알림코드
	private String memBankCode;	// 결제은행
	private String memAccount;	// 결제계좌
	private String memLimit;	// 결제한도
	private String memBillCode;	// 청구서수신코드
	private String memFamily;	// 가족고객번호
	private String memFRe;		// 가족고객관계
	private Date memRegDate;	// 입회일
	private Date memSecDate;	// 탈회일
	private String memStatus;	// 고객상태
	
	private String memWname;	// 직장이름
	private String memDept;		// 부서
	private String memJobposition; // 직위
	
	private List<AddressVo> memAddr; // 유저 주소
	private List<CardVo> cardList;
	
	public MemberVo() { }

	public MemberVo(String memNo, String memKname, String memEname, String memBirth, String memHaddress,
			String memHphone, String memCphone, String memSphone, String memEmail, String memSmsCode, int memTopPoint,
			String memBankCode, String memAccount, String memLimit, String memBillCode, String memFamily,
			Date memRegDate, Date memSecDate, String memStatus) {
		super();
		this.memNo = memNo;
		this.memKname = memKname;
		this.memEname = memEname;
		this.memBirth = memBirth;
		this.memCphone = memCphone;
		this.memSphone = memSphone;
		this.memEmail = memEmail;
		this.memSmsCode = memSmsCode;
		this.memBankCode = memBankCode;
		this.memAccount = memAccount;
		this.memLimit = memLimit;
		this.memBillCode = memBillCode;
		this.memFamily = memFamily;
		this.memRegDate = memRegDate;
		this.memSecDate = memSecDate;
		this.memStatus = memStatus;
	}

	public MemberVo(MemberFamVo memberFam, MemberVo member) {
		this.memKname = memberFam.getMemFKname();
		this.memEname = memberFam.getMemFEname();
		this.memBirth = memberFam.getMemFBirth().replaceAll("-", "");
		this.memCphone = memberFam.getMemFphone();
		this.memSphone = member.getMemSphone();
		this.memEmail = member.getMemEmail();
		this.memFRe = memberFam.getMemFRe();
		this.memSmsCode = member.getMemSmsCode();
		this.memBankCode = member.getMemBankCode();
		this.memAccount = member.getMemAccount();
		this.memLimit = memberFam.getMemFlimit()+"";
		this.memBillCode = member.getMemBillCode();
		this.memFamily = member.getMemNo();
	}

	public String getMemFRe() {
		return memFRe;
	}

	public void setMemFRe(String memFRe) {
		this.memFRe = memFRe;
	}

	public List<CardVo> getCardList() {
		return cardList;
	}

	public void setCardList(List<CardVo> cardList) {
		this.cardList = cardList;
	}

	public List<AddressVo> getMemAddr() {
		return memAddr;
	}

	public void setMemAddr(List<AddressVo> memAddr) {
		this.memAddr = memAddr;
	}

	public String getMemWname() {
		return memWname;
	}

	public void setMemWname(String memWname) {
		this.memWname = memWname;
	}

	public String getMemDept() {
		return memDept;
	}

	public void setMemDept(String memDept) {
		this.memDept = memDept;
	}

	public String getMemJobposition() {
		return memJobposition;
	}

	public void setMemJobposition(String memJobposition) {
		this.memJobposition = memJobposition;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getMemKname() {
		return memKname;
	}

	public void setMemKname(String memKname) {
		this.memKname = memKname;
	}

	public String getMemEname() {
		return memEname;
	}

	public void setMemEname(String memEname) {
		this.memEname = memEname;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth.replaceAll("-", "");
	}

	public String getMemCphone() {
		return memCphone;
	}

	public void setMemCphone(String memCphone) {
		this.memCphone = memCphone;
	}

	public String getMemSphone() {
		return memSphone;
	}

	public void setMemSphone(String memSphone) {
		this.memSphone = memSphone;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemSmsCode() {
		return memSmsCode;
	}

	public void setMemSmsCode(String memSmsCode) {
		this.memSmsCode = memSmsCode;
	}

	public String getMemBankCode() {
		return memBankCode;
	}

	public void setMemBankCode(String memBankCode) {
		this.memBankCode = memBankCode;
	}

	public String getMemAccount() {
		return memAccount;
	}

	public void setMemAccount(String memAccount) {
		this.memAccount = memAccount;
	}

	public String getMemLimit() {
		return memLimit;
	}

	public void setMemLimit(String memLimit) {
		this.memLimit = memLimit;
	}

	public String getMemBillCode() {
		return memBillCode;
	}

	public void setMemBillCode(String memBillCode) {
		this.memBillCode = memBillCode;
	}

	public String getMemFamily() {
		return memFamily;
	}

	public void setMemFamily(String memFamily) {
		this.memFamily = memFamily;
	}

	public Date getMemRegDate() {
		return memRegDate;
	}

	public void setMemRegDate(Date memRegDate) {
		this.memRegDate = memRegDate;
	}

	public Date getMemSecDate() {
		return memSecDate;
	}

	public void setMemSecDate(Date memSecDate) {
		this.memSecDate = memSecDate;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	@Override
	public String toString() {
		return "MemberVo [memNo=" + memNo + ", memKname=" + memKname + ", memEname=" + memEname + ", memBirth="
				+ memBirth + ", memCphone=" + memCphone + ", memSphone=" + memSphone + ", memEmail=" + memEmail
				+ ", memSmsCode=" + memSmsCode + ", memBankCode=" + memBankCode + ", memAccount=" + memAccount
				+ ", memLimit=" + memLimit + ", memBillCode=" + memBillCode + ", memFamily=" + memFamily
				+ ", memRegDate=" + memRegDate + ", memSecDate=" + memSecDate + ", memStatus=" + memStatus
				+ ", memWname=" + memWname + ", memDept=" + memDept + ", memJobposition=" + memJobposition
				+ ", getMemWname()=" + getMemWname() + ", getMemDept()=" + getMemDept() + ", getMemJobposition()="
				+ getMemJobposition() + ", getMemNo()=" + getMemNo() + ", getMemKname()=" + getMemKname()
				+ ", getMemEname()=" + getMemEname() + ", getMemBirth()=" + getMemBirth() + ", getMemCphone()="
				+ getMemCphone() + ", getMemSphone()=" + getMemSphone() + ", getMemEmail()=" + getMemEmail()
				+ ", getMemSmsCode()=" + getMemSmsCode() + ", getMemBankCode()=" + getMemBankCode()
				+ ", getMemAccount()=" + getMemAccount() + ", getMemLimit()=" + getMemLimit() + ", getMemBillCode()="
				+ getMemBillCode() + ", getMemFamily()=" + getMemFamily() + ", getMemRegDate()=" + getMemRegDate()
				+ ", getMemSecDate()=" + getMemSecDate() + ", getMemStatus()=" + getMemStatus() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
