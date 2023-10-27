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

</script>
<style type="text/css">
	p#red{
		color : red;
	}
</style>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
<h3>팀원 삭제</h3>
<p id='red'>삭제하면 복구할 수 없습니다</p>
<form action="delete"
      method="post">
    <input type="hidden" name='teamno' value="${param.teamno}">
    <input type="hidden" name='nowPage' value="${param.nowPage}">
    <input type="hidden" name='col' value="${param.col}">
    <input type="hidden" name='word' value="${param.word}">
  <div class="row">
	<div class="col">
	 <button class="btn btn-outline-dark">삭제</button>
	</div>
  </div>          
</form>
</body>
</html>