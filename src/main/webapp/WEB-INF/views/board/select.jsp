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
			<table class="table table-striped table-hover">
				<tr>
					<td>Num</td>
					<td>${dto.num}</td>
				</tr>
				<tr>
					<td>Title</td>
					<td>${dto.title}</td>
				</tr>
				<tr>
					<td>Contents</td>
					<td>${dto.contents}</td>
				</tr>
				<tr>
					<td>Writer</td>
					<td>${dto.writer}</td>
				</tr>
				<tr>
					<td>RegDate</td>
					<td>${dto.regDate}</td>
				</tr>
				<tr>
					<td>Hits</td>
					<td>${dto.hits}</td>
				</tr>
			</table>
		
		<a href="./delete?num=${dto.num}" class= "btn btn-dark">DELETE</a>
		<a href="./update?num=${dto.num}" class= "btn btn-dark">UPDATE</a>
		<c:if test="${board ne 'Notice'}">
			<a href="./reply?num=${dto.num}" class= "btn btn-dark">REPLY</a>
		</c:if>
		</div>
	</div>
	
	<div>
		<input type="checkbox" class="c1" value="1" checked="checked">
		<input type="checkbox" class="c1" value="2">
		<input type="checkbox" class="c1" value="3" checked="checked">
		<input type="checkbox" class="c1" value="4">
	</div>
	<button id="btn">CHECK</button>
	
	<script type="text/javascript" src="../resources/js/select.js"></script>
</body>
</html>