package com.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeamService {
	@Autowired
	TeamMapper teamMapper;
	
	public int delete(int teamno) {
		return teamMapper.delete(teamno);
	}
	
	public int create(TeamDTO dto) {
		return teamMapper.create(dto);
	}
	public List<TeamDTO> list(Map map){
		return teamMapper.list(map);
	}
	public int total(Map map) {
		return teamMapper.total(map);
	}
}
