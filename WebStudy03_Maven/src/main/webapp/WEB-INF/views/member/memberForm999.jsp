<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
<h2>회원 가입</h2>
<form action="<%=request.getContextPath()%>/member/memberInsert.jsp" method="post" class="form-horizontal">
	<div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_id" placeholder="Enter Id" name="mem_id">
      </div>
    </div>
    
	<div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" id="mem_pass" placeholder="Enter password" name="mem_pass">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">이름 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_name" placeholder="Enter Name" name="mem_name">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="regno">주민번호 :</label>
      <div class="col-sm-2" style="float: left">          
        <input type="text" class="form-control" id="mem_regno1" placeholder="앞자리" name="mem_regno1">
      </div>
      <div class="col-sm-2">
        <input type="text" class="form-control" id="mem_regno2" placeholder="뒷자리" name="mem_regno2">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="bir">생년월일 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_bir" placeholder="6자리" name="mem_bir">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="zip">우편번호 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_zip" placeholder="Enter ZipCode" name="mem_zip">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="add1">주소 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_add1" placeholder="기본 주소" name="mem_add1">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="add1">상세주소 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_add2" placeholder="나머지 주소" name="mem_add2">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="homeTel">전화번호 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_hometel" placeholder="집 전화번호" name="mem_hometel">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="comTel">회사연락처 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_comtel" placeholder="회사전화번호" name="mem_comtel">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="hp">핸드폰번호 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_hp" placeholder="핸드폰번호" name="mem_hp">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="mail">이메일 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_mail" placeholder="이메일" name="mem_mail">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="job">직업 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_job" placeholder="직업" name="mem_job">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="like">취미 :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_like" placeholder="취미" name="mem_like">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="memorial">Memorial :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_memorial" placeholder="memorial" name="mem_memorial">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="memorialDay">Memorial-Day :</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mem_memorialday" placeholder="memorial-Day" name="mem_memorialday">
      </div>
    </div>
    

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
              <label><input type="checkbox"> Remember me</label>
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success">회원가입</button>
      </div>
    </div>
</form>
</div>
</body>
</html>