package com.pawnini.view.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pawnini.model.member.MemberDTO;
import com.pawnini.model.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//로그인
	@RequestMapping(value="/login.do")
	public String login(MemberDTO dto, HttpSession session,RedirectAttributes rttr) throws Exception {
		
		MemberDTO member = service.login(dto);
		
		if(member != null) {
			session.setAttribute("member", member);
			return "main";
		} else {
			rttr.addFlashAttribute("msg", false);
			return "Login";
		}
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "main";
	}
	
	//회원가입
	@RequestMapping(value="/insertMember.do")
	public String insertMember(MemberDTO dto) {
		service.insertMember(dto);
		
		return "main";
	}
	
	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value="/checkID.do")
	public int checkID(MemberDTO dto) {
		int checkID = service.checkID(dto);
		return checkID;
	}
	@ResponseBody
	@RequestMapping(value="/checkMember.do")
	public int checkMember(MemberDTO dto) {
		int checkMember = service.checkMember(dto);
		return checkMember;
	}
	
	// 마이페이지 비밀번호 확인
	@RequestMapping(value="mypage2.do")
	private String mypage2(MemberDTO dto) throws Exception {
		service.login(dto);
		return "mypage3";
	}
	
	// 회원정보 수정
	@RequestMapping(value="/updateMember.do")
	public String updateMember(MemberDTO dto) {
		service.updateMember(dto);
		return "Mypage";
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/deleteMember.do")
	public String deleteMember(MemberDTO dto) {
		service.deleteMember(dto);
		return "main";
	}
}















