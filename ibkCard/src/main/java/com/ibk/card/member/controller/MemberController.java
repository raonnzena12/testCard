package com.ibk.card.member.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.card.member.service.MemberService;
import com.ibk.card.member.vo.AddressList;
import com.ibk.card.member.vo.CardVo;
import com.ibk.card.member.vo.MemberFamVo;
import com.ibk.card.member.vo.MemberList;
import com.ibk.card.member.vo.MemberVo;
import com.ibk.card.member.vo.ModifyLogVo;

@Controller
public class MemberController {
	@Autowired
	private MemberService memService;
	
	@RequestMapping("member/join/form")
	public String memberRegView() {
		return "credit";
	}
	
	@RequestMapping("member/cardDesign")
	public String cardDesignView() {
		return "cardSample";
	}
	
	@ResponseBody
	@RequestMapping("member/join/submit")
	public HashMap<String, Object> memberRegister(MemberVo member, MemberFamVo memberFam, CardVo card, AddressList addrList) {
		System.out.println(member);
		System.out.println(memberFam);
		System.out.println(card);
		System.out.println(addrList);
		
//		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String, Object> result = memService.insertMember(member, memberFam, card, addrList);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("member/login")
	public HashMap<String, Object> memberLogin(MemberVo member,HttpSession session) {
		HashMap<String, Object> result = memService.loginMember(member, session);
		return result;
	}
	
	@RequestMapping("member/{memNo}")
	public String membermpMenu(@PathVariable String memNo, HttpSession session, Model model) {
		MemberVo member = memService.selectMember(memNo);
		model.addAttribute("member", member);
		return "main2";
	}
	
	@RequestMapping("member/{memNo}/logout")
	public String memberLogout(@PathVariable String memNo, HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	@RequestMapping("member/{memNo}/mypage")
	public String membermpMypage(@PathVariable String memNo, HttpSession session, Model model) {
		MemberVo member = memService.selectMember(memNo);
		model = memService.selectMemberInfo(memNo, model);
		return "joininfo";
	}
	
	@RequestMapping("member/{memNo}/modifyInfo")
	public String membermpMypageModify(@PathVariable String memNo, HttpSession session, Model model) {
		MemberVo member = memService.selectMember(memNo);
		model = memService.selectMemberInfo(memNo, model);
		return "joinfix";
	}
	
	@ResponseBody
	@RequestMapping("member/{memNo}/modify")
	public HashMap<String, Object> memberInfoModify(@PathVariable String memNo, MemberVo member, AddressList addrList, HttpSession session, Model model) {
		member.setMemNo(memNo);
		addrList.setMemNo(memNo);
		HashMap<String, Object> result = memService.updateMemberInfo(member, addrList);
		return result;
	}
	
	@RequestMapping("member/{memNo}/cardList")
	public String membermpCardList(@PathVariable String memNo, HttpSession session, Model model) {
		List<CardVo> cardList = memService.selectMemberCardList(memNo);
		model.addAttribute("cList", cardList);
		return "cardList";
	}
	
	@RequestMapping("member/{memNo}/{cardNo}")
	public String membermpCardInfo(@PathVariable String memNo, @PathVariable String cardNo, HttpSession session, Model model) {
		CardVo card = memService.selectCard(cardNo);
		model.addAttribute("card", card);
		return "creditinfo";
	}
	
	@RequestMapping(value="member/{memNo}/{cardNo}/modify", method = RequestMethod.GET)
	public String membermpCardModify(@PathVariable String memNo, @PathVariable String cardNo, HttpSession session, Model model) {
		CardVo card = memService.selectCard(cardNo);
		model.addAttribute("card", card);
		return "cardfix";
	}
	
	@ResponseBody
	@RequestMapping(value="member/{memNo}/{cardNo}/modify", method = RequestMethod.POST)
	public HashMap<String, Object> memberCardModifyRun(@PathVariable String memNo, @PathVariable String cardNo, CardVo card, HttpSession session, Model model ) {
		HashMap<String, Object> result = memService.updateCard(card);
		return result;
	}
	
	@RequestMapping("member/{memNo}/familyList")
	public String membermpFamilyList(@PathVariable String memNo, HttpSession session, Model model) {
		List<MemberVo> fList = memService.selectFamilyList(memNo);
		model.addAttribute("fList", fList);
		return "familylist";
	}
	
	@RequestMapping(value="/member/{memNo}/familyModify", method=RequestMethod.GET)
	public String membermpFamilyModify(@PathVariable String memNo, HttpSession session, Model model) {
		List<MemberVo> fList = memService.selectFamilyList(memNo);
		model.addAttribute("fList", fList);
		return "familyfix";
	}
	
	@ResponseBody
	@RequestMapping(value="/member/{memNo}/familyModify", method = RequestMethod.POST)
	public HashMap<String, Object> membermpFamilyModifyRun(@PathVariable String memNo, HttpSession session, Model model, MemberList mList) {
		HashMap<String, Object> result = memService.updateFamilyMember(mList.getmList(), memNo);
		return result;
	}
	
	@RequestMapping("/member/{memNo}/modifyLog")
	public String membermpModiLogView(@PathVariable String memNo, HttpSession session, Model model) {
		List<ModifyLogVo> mList = memService.selectModifyLogList(memNo);
		model.addAttribute("mList", mList);
		return "modifylog";
	}
}
