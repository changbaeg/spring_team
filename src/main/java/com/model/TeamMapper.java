package com.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeamMapper {

	List<TeamDTO> list(Map map);

	int total(Map map);

	int create(TeamDTO dto);

	TeamDTO read(int teamno);

	int update(TeamDTO dto);

	int delete(int teamno);

}
