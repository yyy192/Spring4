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
	<h1>ID : ${member.id}</h1>
	<h1>NAME : ${member.name}</h1>
	<h1>PHONE : ${member.phone}</h1>
	<h1>EMAIL : ${member.email}</h1>

</body>
</html>