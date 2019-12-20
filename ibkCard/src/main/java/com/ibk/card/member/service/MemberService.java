package com.ibk.card.member.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.ibk.card.member.vo.AddressList;
import com.ibk.card.member.vo.CardVo;
import com.ibk.card.member.vo.JqgridVo;
import com.ibk.card.member.vo.MemberFamVo;
import com.ibk.card.member.vo.MemberVo;
import com.ibk.card.member.vo.ModifyLogVo;

public interface MemberService {

	/**
	 * 멤버를 Insert 하는 Service
	 * @param member
	 * @param memberAdd
	 * @param memberFam
	 * @param card
	 * @return result
	 */
	public abstract HashMap<String, Object> insertMember(MemberVo member, MemberFamVo memberFam, CardVo card, AddressList addrList);

	/**
	 * 유저 로그인 하는 Service
	 * @param member
	 * @param session
	 * @return result
	 */
	public abstract HashMap<String, Object> loginMember(MemberVo member, HttpSession session);

	/**
	 * 유저 정보 SELECT 하는 Service
	 * @param intValue
	 * @return member
	 */
	public abstract MemberVo selectMember(String memNo);

	/**
	 * SELECT 한 유저정보 지지고 볶는 Service
	 * @param memNo
	 * @param model 
	 * @param model 
	 * @return model
	 */
	public abstract Model selectMemberInfo(String memNo, Model model);

	/**
	 * 멤버 정보 업데이트하는 Service
	 * @param member
	 * @param addrList
	 * @return result
	 */
	public abstract HashMap<String, Object> updateMemberInfo(MemberVo member, AddressList addrList);

	/**
	 * 멤버 카드 리스트 받아오는 Service
	 * @param memNo
	 * @return member
	 */
	public abstract List<CardVo> selectMemberCardList(String memNo);

	/**
	 * 조회선택한 카드 정보를 받아오는 Service
	 * @param cardNo
	 * @return card
	 */
	public abstract CardVo selectCard(String cardNo);

	/**
	 * 카드정보 UPDATE 하는 Service
	 * @param card
	 * @return result
	 */
	public abstract HashMap<String, Object> updateCard(CardVo card);

	/**
	 * 회원의 가족정보리스트 SELECT 하는 Service
	 * @param memNo
	 * @return familyList
	 */
	public abstract List<MemberVo> selectFamilyList(String memNo);

	/**
	 * 가족회원의 정보를 UPDATE 하는 Service
	 * @param getmList
	 * @return result
	 */
	public abstract HashMap<String, Object> updateFamilyMember(List<MemberVo> mList, String memNo);

	/**
	 * 특정 회원의 정보수정LOG를 SELECT 하는 Service
	 * @param memNo
	 * @return mList
	 */
	public abstract List<ModifyLogVo> selectModifyLogList(String memNo);

	public abstract List<MemberVo> selectJqGridList(JqgridVo jq);

}
