<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script type="text/javascript" defer src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
  <script type="text/JavaScript">
function checkIn(f){
  if (f.tname.value == ""){
          alert("팀원을 입력하세요");
          f.tname.focus()
          return false;
  }
  
  // String에 value가 있으면 중복가능한 멀티로 selected 하도록
//   if (f.skill.value == ""){
//           alert("하나 이상 선택하시오.");
//           f.skill.focus();
//           return false;
//   }
  
  if (f.phonenum.value == ""){
      alert("전화번호를 입력하세요");
      f.phonenum.focus();
      return false;
}
  if (f.address.value == ""){
          alert("주소를 입력하세요");
          f.address.focus();
          return false;
  }
  if (f.zipcode.value == ""){
      alert("주소를 입력하세요");
      f.address.focus();
      return false;
}
  if (f.address.value == ""){
      alert("주소를 입력하세요");
      f.address.focus();
      return false;
}
}
  function execDaumPostcode() {
    new daum.Postcode( {
      oncomplete: function( data ) {
        document.getElementById( 'zip-code' ).value = data.zonecode;
        document.getElementById( 'address-1' ).value = data.address;
        document.getElementById( 'address-1-1' ).value = data.jibunAddress;
        document.getElementById( 'address-2' ).focus();
      }
    } ).open();
  }
</script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

<div class="container mt-3">
  <h2>팀원 생성</h2>
  <form action="create"
  		method="post"
  		onsubmit="return checkIn(this)">
  	<!-- for랑 name 동일해야함. -->
    <div class="mb-3 mt-3">
      <label for="tname">이름:</label>
      <input type="text" class="form-control" id="tname" placeholder="Enter tname" name="tname">
    </div>
    
    <!-- 체크박스 -->
    <input type="hidden" name="cnt" value="3"/>
     <div class="mb-3 mt-3">
      <label for="skill">스킬:</label>
      <div class="form-check">
		   <input type="checkbox" id="javascript" name="skill" value="javascript" /> javascript          
   	  <input type="checkbox" id="java" name="skill" value="java" /> java 
      <input type="checkbox" id="jsp" name="skill" value="jsp" /> jsp 
      <input type="checkbox" id="spring" name="skill" value="spring" /> spring
      <c:forTokens var="list" items="${dto.skill}" delims=",">
      	<script>
      		document.getElementById('${list}').checked = true;
      	</script>
      </c:forTokens>   
	  </div>
    </div>
    
     <div class="mb-3 mt-3">
      <label for="phonenum">전화번호:</label>
      <input type="text" class="form-control" id="phonenum" placeholder="Enter phonenum" name="phonenum">
    </div>
    
    <!-- 오픈소스 -->
    <div class="mb-3 mt-3">
      <label for="address">주소:</label>
      <input type="text" class="form-control" id="address" placeholder="Enter address" name="address">
    </div>
    <div class="mb-3 mt-3">
      <label for="zipcode">우편번호:</label>
      <input type="text" class="form-control" id="zipcode" placeholder="Enter zipcode" name="zipcode">
      <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
    </div>
    
    <!-- 라디오버튼 -->
    <div class="mb-3 mt-3">
      <label for="gender">성별:</label>
      <div class="form-check">
		  <input class="form-check-input" type="radio" value="MAN" id="gender1" name="gender" checked>
		  <label class="form-check-label" for="gender1">
		    MAN
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" value="WOMAN" id="gender2" name="gender">
		  <label class="form-check-label" for="gender2">
		    WOMAN
		  </label>
		</div>
    </div>
    
    
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>
</body>
</html>