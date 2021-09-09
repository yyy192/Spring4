<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CHECK</title>
	
	<c:import url="../temp/boot_head.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>
	
	<h1>Check Page</h1>
	
	<div class="container-fluid">
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" id="all">
		  <label class="form-check-label" for="all">
		    Check ALL
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input c1 essential" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    약관 1(필수)
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input c1 essential" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    약관 2(필수)
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input c1 essential" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    약관 3(필수)
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input c1 option" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    약관 4(선택)
		  </label>
		</div>	
		
		<button class="btn btn-success" id="btn">회원가입</button>
	</div>
	
	<script type="text/javascript" src="../resources/js/check.js"></script>
</body>
</html>