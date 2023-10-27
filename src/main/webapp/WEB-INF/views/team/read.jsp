<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function update(teamno){
		let url = "update";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&teamno="+teamno;
		
		location.href=url;
	}
	
	function del(teamno){
		let url = "delete";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&teamno="+teamno;
		
		location.href=url;
	}

	function list(){
		let url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href=url;
	}
</script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container mt-3">
  <h2>팀원 조회</h2>
  <ul class="list-group">
    <li class="list-group-item">이름:${dto.tname}</li>
    <li class="list-group-item">스킬(보유기술):${dto.skill }</li>
    <li class="list-group-item">전화번호:${dto.phonenum }</li>
    <li class="list-group-item">주소:${dto.address }</li>
    <li class="list-group-item">우편번호:${dto.zipcode }</li>
    <li class="list-group-item">성별:${dto.gender }</li>
    <li class="list-group-item">등록날짜:${dto.rdate }</li>
  </ul>
  
  <button type="button" class="btn btn-light" onclick="location.href='create'">생성</button>
  <button type="button" class="btn btn-light" onclick="location='update/${dto.teamno}'">수정</button>
  <button type="button" class="btn btn-light" onclick="location='delete/${dto.teamno}'">삭제</button>
  <button type="button" class="btn btn-light" onclick="location='list'">목록</button>
</div>
</body>
</html>