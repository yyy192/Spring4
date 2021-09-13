<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>RESULT</title>
	
	<script type="text/javascript" src="../resources/js/result.js">
		alert('${msg}');
		location.href='${url}';
	</script>
	
	<c:import url="../temp/boot_head.jsp"></c:import>
	
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>
	
	<input type="hidden" id="msg" value="${msg}">
	
<!-- 	<script type="text/javascript" src="../resources/js/result.js">
		alert('${msg}');
		location.href='${url}';
	</script> -->
</body>
</html>