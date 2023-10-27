package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.TeamDTO;
import com.model.TeamMapper;
import com.utility.Utility;

@Controller
public class TeamController {
	
	@Autowired
	private TeamMapper mapper;
	
	@GetMapping("/")
	public String home() {
		
		
		return "/home";
	}
	
	@PostMapping("/team/update")
	public String update(TeamDTO dto) {
		
		Map map = new HashMap();
		map.put("teamno", dto.getTeamno());
		
		return "redirect:/team/list";
	} 
	
	@GetMapping("/team/update/{teamno}")
	public String update(@PathVariable int teamno, Model model) {
		
		model.addAttribute("dto", mapper.read(teamno));
		
		return "/team/update";
	}
	
	@PostMapping("/team/delete")
	public String delete(int teamno) {
		Map map = new HashMap();
		map.put("teamno", teamno);
		mapper.delete(teamno);
		
		int pflag = mapper.delete(teamno);
		int cnt = 0;
		if(pflag>0) {
			cnt = mapper.delete(teamno);
		}
		
		if(pflag==0) {
			return "/passwdError";
		}else if(cnt == 0) {
			return "/error";
		}
		return "redirect:/team/list";
	}
	
	@GetMapping("/team/delete")
	public String delete() {
		
		return "/delete";
	}
	
	@GetMapping("/team/read")
	public String read(int teamno, Model model) {
		TeamDTO dto = mapper.read(teamno);
		
		String tname = dto.getTname().replaceAll("\r\n", "<br>");
		
		dto.setTname(tname);
		
		model.addAttribute("dto",dto);
		return "/team/read";
	}

	
	@GetMapping("/team/create")
	public String create() {
		return "/team/create";
	}
	@PostMapping("/team/create")
	public String create(TeamDTO dto) {
		
//		dto.setSkills("");
//		for(int i=0; i<dto.getSkill().length; i++) {
//			dto.setSkills(dto.getSkills()+dto.getSkill()[i]);
//			if(i < dto.getSkill().length +1) {
//				dto.setSkills(dto.getSkills() + ",");
//			}
//			
//		}
//		System.out.println(dto.getSkills());
		if(mapper.create(dto)==1) {
			return "redirect:/team/list";
		}else {
			return "/error";
		}
	}
	
	/*
	 * @RequestMapping("create") public String CheckBox(Model model,
	 * HttpServletRequest request) throws Exception { // List<TeamDTO> TeamList =
	 * Teammapper.list(); // // for(TeamDTO item:TeamList) { // String[] checkList
	 * = item.getCheckList().split(","); // item.setCheckValue(checkList); //
	 * model.addAllAttribute("TeamList", TeamList)); // } //
	 * 
	 * try { int cnt = Integer.parseInt(request.getParameter("cnt"));
	 * 
	 * for(int j=1; j<=cnt; j++) { for(int i = 0; i <
	 * request.getParameterValues("flexCheckDefault" + String.valueOf(j)).length ;
	 * i++){
	 * 
	 * System.out.println(request.getParameterValues("flexCheckDefault" +
	 * String.valueOf(j))[i]); } } } catch(Exception e){ e.printStackTrace(); }
	 * return "/list"; }
	 */
	
	@RequestMapping("list")
	public String list(HttpServletRequest request) {
		//검색 관련
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) {
			word = "";
		}
		//페이지 관련
		int nowPage = 1;
		if(request.getParameter("nowPage")!=null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 3;
		
		// db에서 가져올 순번
		int sno = ((nowPage-1)*recordPerPage);
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		
		int total = mapper.total(map);
		
		List<TeamDTO> list = mapper.list(map);
		
		String url = "/list";
		
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);
		
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		
		// view 페이지
		return "/list";
	}
	
	@GetMapping("/team/list")
	public String list(HttpServletRequest request,Model model) {
		//검색관련
		String col = Utility.checkNull(request.getParameter("col")) ; 
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) word = "";
		
		//페이징관련
		int nowPage = 1;
		if(request.getParameter("nowPage")!=null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		//한페이지당 보여줄 레코드 갯수
		int eno = 5;
		//데이터베이스에서 시작 레코드 수
		int sno = (nowPage-1) * eno;
		
		//데이터베이스에서 목록 가져오기
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<TeamDTO> list = mapper.list(map);
		
		int total = mapper.total(map);
		
		String url = "list";
		
		String paging = Utility.paging(total, nowPage, eno, col, word, url);		
		
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);		
		
		return "/list";
	}

}
