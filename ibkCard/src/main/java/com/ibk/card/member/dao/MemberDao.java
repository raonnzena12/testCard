package com.ibk.card.member.dao;

import java.util.HashMap;
import java.util.List;

import com.ibk.card.member.vo.AddressVo;
import com.ibk.card.member.vo.CardVo;
import com.ibk.card.member.vo.MemberFamVo;
import com.ibk.card.member.vo.MemberVo;
import com.ibk.card.member.vo.ModifyLogVo;

public interface MemberDao {

	/**
	 * 멤버를 INSERT 하는 DAo
	 * @param member
	 * @return result
	 */
	public abstract int insertMember(MemberVo member);

	/**
	 * 멤버 테이블 SEQUENCE를 리턴하는 DAO
	 * @return sequence
	 */
	public abstract int selectMemberSequence();

	/**
	 * 카드 SEQUENCE를 리턴하는 DAO
	 * @return sequence
	 */
	public abstract int selectCardSequence();

	/**
	 * 신규카드 정보를 INSERT 하는 DAO
	 * @param card
	 * @return result
	 */
	public abstract int insertCard(CardVo card);

	/**
	 * 주소 정보를 INSERT 하는 DAO
	 * @param addr
	 * @return result
	 */
	public abstract int insertAddress(AddressVo addr);

	/**
	 * 멤버번호와 생일로 유저1명을 SELECT 하는 DAO
	 * @param member
	 * @return member
	 */
	public abstract MemberVo selectMember(MemberVo member);

	/**
	 * 멤버 번호로 유저 1명을 SELECT 하는 DAO
	 * @param memNo
	 * @return member
	 */
	public abstract MemberVo selectMember(String memNo);

	/**
	 * 멤버의 정보를 UPDATE 하는 DAO
	 * @param member
	 * @return result
	 */
	public abstract int updateMemberInfo(MemberVo member);

	/**
	 * 멤버의 주소 정보를 UPDATE 혹은 INSERT 하는 DAO
	 * @param addr
	 * @return result
	 */
	public abstract int updateMemberAddr(AddressVo addr);

	/**
	 * 멤버의 카드정보 SELECT 하는 DAO
	 * @param memNo
	 * @return member
	 */
	public abstract List<CardVo> selectMemberCardList(String memNo);

	/**
	 * 조회선택한 해당카드의 정보 SELECT 하는 DAO
	 * @param cardNo
	 * @return card
	 */
	public abstract CardVo selectCard(String cardNo);

	/**
	 * 카드 정보 UPDATE 하는 DAO
	 * @param card
	 * @return result
	 */
	public abstract int updateCard(CardVo card);

	/**
	 * 회원의 가족회원리스트 SELECT 하는 DAO
	 * @param memNo
	 * @return familyList
	 */
	public abstract List<MemberVo> selectFamilyList(String memNo);

	/**
	 * 가족테이블에 회원번호들을 INSERT 하는 DAO
	 * @param familyMem
	 * @return result
	 */
	public abstract int insertFamily(MemberVo familyMem);

	/**
	 * 가족회원 정보를 UPDATE 하는 DAO
	 * @param mem
	 * @return result
	 */
	public abstract int updateFamily(MemberVo mem);

	/**
	 * 가족관계를 UPDATE 하는 DAO
	 * @param mem
	 * @return result
	 */
	public abstract int updateFamilyRelationship(MemberVo mem);

	/**
	 * 특정회원의 정보수정LOG를 SELECT하는 DAO
	 * @param memNo
	 * @return mList
	 */
	public abstract List<ModifyLogVo> selectModifyLogList(String memNo);

}
