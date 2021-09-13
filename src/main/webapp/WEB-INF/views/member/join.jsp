<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JOIN</title>
	
	<c:import url="../temp/boot_head.jsp"></c:import>
	<style type="text/css">
		#same{
			color:red;
		}
	</style>
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>
	
	<h1>Join Page</h1>
	
	<div class="container-fluid">
		<div class="col-md-7 my-2 mx-auto">
			<form id="frm" action="join" method="post">
			
			  <div class="mb-3">
			    <label for="text" class="form-label">Id</label>
			    <input type="text" class="form-control n" id="id" name = "id">
			    <button class="btn btn-dark" type="button" id="idCheck">ID 중복 확인</button>
			  	<div id="idResult"></div>
			  </div>
			  
			  <div class="mb-3">
			    <label for="exampleInputPassword1" class="form-label">Password</label>
			    <input type="password" class="form-control n pw" id="pw1" name="pw">
			  
			  </div>
			  
			  <div class="mb-3">
			    <label for="exampleInputPassword1" class="form-label">Password check</label>
			    <input type="password" class="form-control n pw" id="pw2" name="pwCheck">
			  	<div id ="same"></div>
			  </div>
			  
			  <div class="mb-3">
			    <label for="text" class="form-label">Name</label>
			    <input type="text" class="form-control n" id="name" name="name">
			 	
			  </div>
			  
			  <div class="mb-3">
			    <label for="text" class="form-label">Phone</label>
			    <input type="tel" class="form-control n" id="phone" name="phone">
			  	
			  </div>
			  
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">EMail</label>
			    <input type="email" class="form-control n" id="email" name="email">
			  	
			  </div>
			  
			  <div class="mb-3" id="files">
			  	<label class="form-label"></label>
			  	<button type="button" id="add" class="btn btn-danger">File Add</button>
			  	
			  </div>
			  <!-- input file 추가 영역 -->
			  <div id="addResult">
			  
			  </div>
			  
			  
			  <div class="mb-3">
			  <label class="form-label"></label>
			  	<button type="button" id="btn" class="btn btn-primary">Join</button>
			  </div>
			</form>
			<div class="mb-3" id="f">
			   <label for="photo" class="form-label">Photo</label>
			   <input type="file" class="form-control n" id="photo" name="photo">
			  	
			</div>
		</div>
	</div>
	
<script type="text/javascript" src="../resources/js/file.js"></script>	
<script type="text/javascript" src="../resources/js/join.js"></script>

</body>
</html>