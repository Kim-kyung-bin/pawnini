package com.pawnini.view.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pawnini.model.member.MemberDTO;
import com.pawnini.model.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//로그인
	@RequestMapping(value="/login.do")
	public String login(MemberDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = req.getSession();
		MemberDTO login = service.login(dto);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		
		return "redirect:temphome.jsp";
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:temphome";
	}

}
