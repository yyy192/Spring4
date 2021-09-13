<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyPage</title>

	<c:import url="../temp/boot_head.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>
	<h1>My Page</h1>
	<h2>ID : ${member.id}</h2>
	<h2>NAME : ${member.name}</h2>
	<h2>PHONE : ${member.phone}</h2>
	<h2>EMAIL : ${member.email}</h2>


	<a href="./update">정보 수정</a>
	<a href="#" id="del">회원 탈퇴</a>
	
	<script type="text/javascript" src="../resources/js/mypage.js"></script>
</body>
</html>