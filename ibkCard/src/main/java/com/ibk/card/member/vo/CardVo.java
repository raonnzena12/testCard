package com.ibk.card.member.vo;

import java.sql.Date;

public class CardVo {
	private String cardNo;
	private String cardName;
	private String cardServiceCode;
	private String cardServiceName;
	private String cardDesignCode;
	private String cardDesignName;
	private String cardBrandCode;
	private String cardBrandName;
	private String cardOverseas = "N";
	private String cardAdditional1 = "N";
	private String cardAdditional2 = "N";
	private String memNo;
	private String cardStatusCode;
	private String cardStatusName;
	private Date cardIsuDate;
	private Date cardDisDate;
	
	public CardVo() { }

	public CardVo(String cardNo, String cardName, String cardServiceCode, String cardServiceName, String cardDesignCode,
			String cardDesignName, String cardBrandCode, String cardBrandName, String cardOverseas,
			String cardAdditional1, String cardAdditional2, String memNo, String cardStatusCode, Date cardIsuDate,
			Date cardDisDate) {
		super();
		this.cardNo = cardNo;
		this.cardName = cardName;
		this.cardServiceCode = cardServiceCode;
		this.cardServiceName = cardServiceName;
		this.cardDesignCode = cardDesignCode;
		this.cardDesignName = cardDesignName;
		this.cardBrandCode = cardBrandCode;
		this.cardBrandName = cardBrandName;
		this.cardOverseas = cardOverseas;
		this.cardAdditional1 = cardAdditional1;
		this.cardAdditional2 = cardAdditional2;
		this.memNo = memNo;
		this.cardStatusCode = cardStatusCode;
		this.cardIsuDate = cardIsuDate;
		this.cardDisDate = cardDisDate;
	}

	public String getCardStatusName() {
		return cardStatusName;
	}

	public void setCardStatusName(String cardStatusName) {
		this.cardStatusName = cardStatusName;
	}

	public String getCardAdditional1() {
		return cardAdditional1;
	}

	public void setCardAdditional1(String cardAdditional1) {
		this.cardAdditional1 = cardAdditional1;
	}

	public String getCardAdditional2() {
		return cardAdditional2;
	}

	public void setCardAdditional2(String cardAdditional2) {
		this.cardAdditional2 = cardAdditional2;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getCardServiceCode() {
		return cardServiceCode;
	}

	public void setCardServiceCode(String cardServiceCode) {
		this.cardServiceCode = cardServiceCode;
	}

	public String getCardServiceName() {
		return cardServiceName;
	}

	public void setCardServiceName(String cardServiceName) {
		this.cardServiceName = cardServiceName;
	}

	public String getCardDesignCode() {
		return cardDesignCode;
	}

	public void setCardDesignCode(String cardDesignCode) {
		this.cardDesignCode = cardDesignCode;
	}

	public String getCardDesignName() {
		return cardDesignName;
	}

	public void setCardDesignName(String cardDesignName) {
		this.cardDesignName = cardDesignName;
	}

	public String getCardBrandCode() {
		return cardBrandCode;
	}

	public void setCardBrandCode(String cardBrandCode) {
		this.cardBrandCode = cardBrandCode;
	}

	public String getCardBrandName() {
		return cardBrandName;
	}

	public void setCardBrandName(String cardBrandName) {
		this.cardBrandName = cardBrandName;
	}

	public String getCardOverseas() {
		return cardOverseas;
	}

	public void setCardOverseas(String cardOverseas) {
		this.cardOverseas = cardOverseas;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getCardStatusCode() {
		return cardStatusCode;
	}

	public void setCardStatusCode(String cardStatusCode) {
		this.cardStatusCode = cardStatusCode;
	}

	public Date getCardIsuDate() {
		return cardIsuDate;
	}

	public void setCardIsuDate(Date cardIsuDate) {
		this.cardIsuDate = cardIsuDate;
	}

	public Date getCardDisDate() {
		return cardDisDate;
	}

	public void setCardDisDate(Date cardDisDate) {
		this.cardDisDate = cardDisDate;
	}

	@Override
	public String toString() {
		return "CardVo [cardNo=" + cardNo + ", cardName=" + cardName + ", cardServiceCode=" + cardServiceCode
				+ ", cardServiceName=" + cardServiceName + ", cardDesignCode=" + cardDesignCode + ", cardDesignName="
				+ cardDesignName + ", cardBrandCode=" + cardBrandCode + ", cardBrandName=" + cardBrandName
				+ ", cardOverseas=" + cardOverseas + ", cardAdditional1=" + cardAdditional1 + ", cardAdditional2="
				+ cardAdditional2 + ", memNo=" + memNo + ", cardStatusCode=" + cardStatusCode + ", cardIsuDate="
				+ cardIsuDate + ", cardDisDate=" + cardDisDate + "]";
	}
}
