package com.ibk.card.member.vo;

import java.sql.Date;

public class ModifyLogVo {
	private int logNo;
	private String logTBCode;
	private String logModiCol;
	private String logBefore;
	private String logAfter;
	private String logRowId;
	private Date logModiDate;
	private String logMemNo;
	
	public ModifyLogVo() { }

	public ModifyLogVo(int logNo, String logTBCode, String logModiCol, String logBefore, String logAfter,
			String logRowId, Date logModiDate, String logMemNo) {
		super();
		this.logNo = logNo;
		this.logTBCode = logTBCode;
		this.logModiCol = logModiCol;
		this.logBefore = logBefore;
		this.logAfter = logAfter;
		this.logRowId = logRowId;
		this.logModiDate = logModiDate;
		this.logMemNo = logMemNo;
	}

	public int getLogNo() {
		return logNo;
	}

	public void setLogNo(int logNo) {
		this.logNo = logNo;
	}

	public String getLogTBCode() {
		return logTBCode;
	}

	public void setLogTBCode(String logTBCode) {
		this.logTBCode = logTBCode;
	}

	public String getLogModiCol() {
		return logModiCol;
	}

	public void setLogModiCol(String logModiCol) {
		this.logModiCol = logModiCol;
	}

	public String getLogBefore() {
		return logBefore;
	}

	public void setLogBefore(String logBefore) {
		this.logBefore = logBefore;
	}

	public String getLogAfter() {
		return logAfter;
	}

	public void setLogAfter(String logAfter) {
		this.logAfter = logAfter;
	}

	public String getLogRowId() {
		return logRowId;
	}

	public void setLogRowId(String logRowId) {
		this.logRowId = logRowId;
	}

	public Date getLogModiDate() {
		return logModiDate;
	}

	public void setLogModiDate(Date logModiDate) {
		this.logModiDate = logModiDate;
	}

	public String getLogMemNo() {
		return logMemNo;
	}

	public void setLogMemNo(String logMemNo) {
		this.logMemNo = logMemNo;
	}

	@Override
	public String toString() {
		return "ModifyLogVo [logNo=" + logNo + ", logTBCode=" + logTBCode + ", logModiCol=" + logModiCol
				+ ", logBefore=" + logBefore + ", logAfter=" + logAfter + ", logRowId=" + logRowId + ", logModiDate="
				+ logModiDate + ", logMemNo=" + logMemNo + "]";
	}
}
