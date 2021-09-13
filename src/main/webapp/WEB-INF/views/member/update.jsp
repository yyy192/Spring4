<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>UPDATE</title>
	
	<c:import url="../temp/boot_head.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>
	
	<h1>Update Page</h1>
	
	<div class="container-fluid">
		<div class="col-md-7 my-2 mx-auto">
			<form id="frm" action="update" method="post">
			
			  <div class="mb-3">
			    <label for="exampleInputPassword1" class="form-label">Password</label>
			    <input type="password" class="form-control n pw" id="pw1" name="pw" value="${member.pw}">
			  
			  </div>
			  
			  <div class="mb-3">
			    <label for="exampleInputPassword1" class="form-label">Password check</label>
			    <input type="password" class="form-control n pw" id="pw2" name="pwCheck">
			  </div>
			  
			  <div class="mb-3">
			    <label for="text" class="form-label">Phone</label>
			    <input type="tel" class="form-control n" id="phone" name="phone" value="${member.phone}">
			  	
			  </div>
			  
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">EMail</label>
			    <input type="email" class="form-control n" id="email" name="email" value="${member.email}">
			  	
			  </div>
			  
			  <div class="mb-3">
			  	<button type="submit" id="btn" class="btn btn-primary">Update</button>
			  </div>
			</form>
		</div>
	</div>
</body>
</html>