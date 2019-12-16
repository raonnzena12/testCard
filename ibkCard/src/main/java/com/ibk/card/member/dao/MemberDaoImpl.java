package com.ibk.card.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.card.member.vo.AddressVo;
import com.ibk.card.member.vo.CardVo;
import com.ibk.card.member.vo.MemberVo;
import com.ibk.card.member.vo.ModifyLogVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(MemberVo member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	@Override
	public int selectMemberSequence() {
		return sqlSession.selectOne("memberMapper.selectMemberSequence");
	}

	@Override
	public int selectCardSequence() {
		return sqlSession.selectOne("memberMapper.selectCardSequence");
	}

	@Override
	public int insertCard(CardVo card) {
		return sqlSession.insert("memberMapper.insertCard", card);
	}

	@Override
	public int insertAddress(AddressVo addr) {
		return sqlSession.insert("memberMapper.insertAddress", addr);
	}

	@Override
	public MemberVo selectMember(MemberVo member) {
		return sqlSession.selectOne("memberMapper.selectMember", member);
	}

	@Override
	public MemberVo selectMember(String memNo) {
		return sqlSession.selectOne("memberMapper.selectMember2", memNo);
	}

	@Override
	public int updateMemberInfo(MemberVo member) {
		return sqlSession.update("memberMapper.updateMemberInfo", member);
	}

	@Override
	public int updateMemberAddr(AddressVo addr) {
		return sqlSession.update("memberMapper.updateMemberAddr", addr);
	}

	@Override
	public List<CardVo> selectMemberCardList(String memNo) {
		return sqlSession.selectList("memberMapper.selectCardList", memNo);
	}

	@Override
	public CardVo selectCard(String cardNo) {
		return sqlSession.selectOne("memberMapper.selectCard", cardNo);
	}

	@Override
	public int updateCard(CardVo card) {
		return sqlSession.update("memberMapper.updateCard", card);
	}

	@Override
	public List<MemberVo> selectFamilyList(String memNo) {
		return sqlSession.selectList("memberMapper.selectFamilyList", memNo);
	}

	@Override
	public int insertFamily(MemberVo familyMem) {
		return sqlSession.insert("memberMapper.insertFamilyMember", familyMem);
	}

	@Override
	public int updateFamily(MemberVo member) {
		return sqlSession.update("memberMapper.updateFamily", member);
	}

	@Override
	public int updateFamilyRelationship(MemberVo member) {
		return sqlSession.update("memberMapper.updateFamilyRelationship", member);
	}

	@Override
	public List<ModifyLogVo> selectModifyLogList(String memNo) {
		return sqlSession.selectList("memberMapper.selectModifyLogList", memNo);
	}
}
