package com.pawnini.view.paws;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pawnini.model.paws.PawsDTO;
import com.pawnini.model.paws.PawsService;

@Controller
@SessionAttributes("paws")
public class PawsController {

	@Autowired
	private PawsService pawsService;
	
	@RequestMapping("/insertPaws.do")
	public String insertPaws(PawsDTO dto) {
		pawsService.insertPaws(dto);
		return "getPawsList.do";
	}
	
	@RequestMapping("/getPawsList.do")
	public String getPawsList(PawsDTO dto, Model model) {
		model.addAttribute("pawsList",pawsService.getPawsList(dto));
		return "paws/getPawsList";
	}
}
