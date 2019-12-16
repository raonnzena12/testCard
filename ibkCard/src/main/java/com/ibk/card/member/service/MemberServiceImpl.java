package com.ibk.card.member.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ibk.card.member.dao.MemberDao;
import com.ibk.card.member.vo.AddressList;
import com.ibk.card.member.vo.AddressVo;
import com.ibk.card.member.vo.CardVo;
import com.ibk.card.member.vo.MemberFamVo;
import com.ibk.card.member.vo.MemberVo;
import com.ibk.card.member.vo.ModifyLogVo;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memDao;

	@Override
	public HashMap<String, Object> insertMember(MemberVo member, MemberFamVo memberFam,
			CardVo card, AddressList addrList) {
		int memResult = 0 , memAResult = 0, memFResult1 = 0, memFResult2 = 0, cardResult = 0;
		HashMap<String, Object> result = new HashMap<String, Object>();
		// 멤버 번호를 가져옴
		String memNo = getMemberNo();
		member.setMemNo(memNo);
		memberFam.setMemFNo(memNo);
		card.setMemNo(memNo);
		addrList.setMemNo(memNo);
		memResult = memDao.insertMember(member);
		for ( AddressVo addr : addrList.getAddrList() ) {
			if ( addr.getAddress() != null && !addr.getAddress().equals("") ) {
				memAResult += memDao.insertAddress(addr);
			}
		}
		if ( memResult > 0 && memAResult > 0) {
			result.put("success", memNo);
		}
		if ( memberFam.getMemFKname() != null && !memberFam.getMemFKname().equals("") ) {
			MemberVo familyMem = new MemberVo(memberFam, member);
			familyMem.setMemNo(getMemberNo());
			memFResult1 = memDao.insertMember(familyMem);
			memFResult2 = memDao.insertFamily(familyMem);
			if ( memFResult1 > 0 ) {
				result.put("success1", "가족회원 등록 성공");
			}
		}
		if ( card.getCardBrandCode() != null ) {
			String cardNo = getCardNo();
			card.setCardNo(cardNo);
			cardResult = memDao.insertCard(card);
			if( cardResult > 0 ) {
				result.put("success2", cardNo);
			}
		}
		return result;
	}

	public String getCardNo() {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String seq = memDao.selectCardSequence()+"";
		if ( seq.length() != 8 ) {
			String tmp = "";
			for ( int i = 0 ; i < (8-seq.length()) ; i++ ) {
				tmp += "0";
			}
			seq = tmp + seq;
		}
		return sdf.format(today) + seq;
	}

	public String getMemberNo() {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		int seq = memDao.selectMemberSequence();
		String seqStr = ( seq > 9 ) ? "" + seq : "0" + seq;
		return sdf.format(today) + seqStr;
	}

	@Override
	public HashMap<String, Object> loginMember(MemberVo member, HttpSession session) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		MemberVo loginUser = selectMember(member);
		if ( loginUser != null ) {
			result.put("success", "성공");
			result.put("memKname", loginUser.getMemKname());
			result.put("memNo", loginUser.getMemNo());
			session.setAttribute("loginUser", loginUser);
		}
		return result;
	}

	public MemberVo selectMember(MemberVo member) {
		return memDao.selectMember(member);
	}

	@Override
	public MemberVo selectMember(String memNo) {
		return memDao.selectMember(memNo);
	}

	@Override
	public Model selectMemberInfo(String memNo, Model model) {
		MemberVo member = memDao.selectMember(memNo);
		model.addAttribute("member", member);
		List<AddressVo> aList = member.getMemAddr();
		for ( AddressVo addr : aList ) {
			if ( addr.getAddrCode().equals("BR003") ) {
				String addrArr[] = addr.getAddress().split(",");
				String phone = addr.getAddrPhone();
				model.addAttribute("hAddr1", addrArr[0]);
				model.addAttribute("hAddr2", addrArr[1]);
				model.addAttribute("hPhone", phone);
			} else if ( addr.getAddrCode().equals("BR002") ) {
				model.addAttribute("wAddr", addr.getAddress());
				model.addAttribute("wPhone", addr.getAddrPhone());
			} else if ( addr.getAddrCode().equals("BR005") ) {
				model.addAttribute("oAddr", addr.getAddress());
				model.addAttribute("oPhone", addr.getAddrPhone());
			}
		}
		return model;
	}

	@Override
	public HashMap<String, Object> updateMemberInfo(MemberVo member, AddressList addrList) {
		int memResult = 0 , addrResult = 0;
		HashMap<String, Object> result = new HashMap<String, Object>();
		memResult = memDao.updateMemberInfo(member);
		for ( AddressVo addr : addrList.getAddrList() ) {
			String address = addr.getAddress();
			if ( address != null && !address.equals("") ) {
				addrResult += memDao.updateMemberAddr(addr);
			}
		}
		if ( memResult > 0 || addrResult > 0 ) {
			result.put("result", "success");
		}
		return result;
	}

	@Override
	public List<CardVo> selectMemberCardList(String memNo) {
		return memDao.selectMemberCardList(memNo);
	}

	@Override
	public CardVo selectCard(String cardNo) {
		return memDao.selectCard(cardNo);
	}

	@Override
	public HashMap<String, Object> updateCard(CardVo card) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int cResult = memDao.updateCard(card);
		if ( cResult > 0 ) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}

	@Override
	public List<MemberVo> selectFamilyList(String memNo) {
		return memDao.selectFamilyList(memNo);
	}

	@Override
	public HashMap<String, Object> updateFamilyMember(List<MemberVo> mList, String memNo) {
		int result1 = 0, result2 = 0;
		HashMap<String,Object> result = new HashMap<String, Object>();
		for ( MemberVo mem : mList ) {
			mem.setMemFamily(memNo);
			result1 += memDao.updateFamily(mem);
			result2 += memDao.updateFamilyRelationship(mem);
		}
		if ( result1 > 0 && result2 > 0 ) {
			result.put("result", "success");
		}
		return result;
	}

	@Override
	public List<ModifyLogVo> selectModifyLogList(String memNo) {
		return memDao.selectModifyLogList(memNo);
	}
}
