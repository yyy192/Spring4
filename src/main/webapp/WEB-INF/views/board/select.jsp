<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SELECT</title>
	<c:import url="../temp/boot_head.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import></head>
	<h1>${board} Board Select Page</h1>
	
	<div class = "container-fluid">
		<div class="col-md-7 my-2 mx-auto">
			<h3>Num : ${dto.num}</h3>
			<h3>Title : ${dto.title}</h3>
			<h3>Contents : ${dto.contents}</h3>>
			<h3>Writer : ${dto.writer}</h3>
			<h3>RegDate : ${dto.regDate}</h3>
			<h3>Hits : ${dto.hits}</h3>
			
		<c:forEach items="${dto.files}" var="f">
			<div>
				<img alt="" src="../resources/upload/${board}/${f.fileName}">
			</div>
		</c:forEach>
			
		<c:if test="${not empty member and member.id eq dto.writer}">
			<a href="./delete?num=${dto.num}" class= "btn btn-dark">DELETE</a>
			<a href="./update?num=${dto.num}" class= "btn btn-dark">UPDATE</a>
		</c:if>
		
		
		<c:if test="${board ne 'notice'}">
			<c:if test="${not empty member}">
			<a href="./reply?num=${dto.num}" class= "btn btn-dark">REPLY</a>
			</c:if>
		</c:if>
		</div>
	</div>
</body>
</html>