<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>INSERT</title>
	<c:import url="../temp/boot_head.jsp"></c:import>
	
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>
	<h1>${board} Board Insert Page</h1>
	
	<div class="container-fluid">
		<div class="col-md-7 my-2 mx-auto">
			<form action="./insert" method="post">
				<div class="mb-3">
				  <label for="title" class="form-label">TITLE</label>
				  <input type="text" class="form-control" name="title" id="title">
				</div>
				
				<div class="mb-3">
				  <label for="contents" class="form-label">CONTENTS</label>
				  <textarea class="form-control" name="contents" id=contents" rows="5"></textarea>
				</div>
				
				<div class="mb-3">
				  <label for="writer" class="form-label">WRITER</label>
				  <input type="text" class="form-control" name="writer" id="writer">
				</div>
				
				<button id="add" type="button">SUBMIT</button>
			</form>
		</div>
	</div>
	
	<script type="text/javascript" src="../resources/js/boardCheck.js"></script>
</body>
</html>