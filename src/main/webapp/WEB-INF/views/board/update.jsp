<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<form class="col-md-5 mx-auto" action="./update" method="post">
			
				<input type="text" readonly="readonly" value="${dto.num}" name="num">
				
				<div class="mb-3">
				  <label for="title" class="form-label">TITLE</label>
				  <input type="text" class="form-control" value="${dto.title}" name="title" id="title">
				</div>
				
				<div class="mb-3">
				  <label for="contents" class="form-label">CONTENTS</label>
				  <textarea class="form-control" name="contents" id=contents" rows="5">${dto.contents}</textarea>
				</div>
				
				<div class="mb-3">
				  <label for="writer" class="form-label">WRITER</label>
				  <input type="text" class="form-control" value="${dto.writer}" name="writer" id="writer">
				</div>
				
				<button type="submit">SUBMIT</button>
			</form>
		</div>
	</div>

</body>
</html>