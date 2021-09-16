<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>INSERT</title>
	<c:import url="../temp/boot_head.jsp"></c:import>
	<style type="text/css">
		#d1 {
			width : 300px;
			height: 300px;
			background-color: yellow;
		}
	</style>
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>
	<h1>${board} Board Insert Page</h1>
	
	<div class="container-fluid">
		<div class="col-md-7 my-2 mx-auto">
			<form action="./insert" method="post" enctype="multipart/form-data">
				<div class="mb-3">
				  <label for="title" class="form-label">TITLE</label>
				  <input type="text" class="form-control" name="title" id="title">
				</div>
				
				<div class="mb-3">
				  <label for="writer" class="form-label">WRITER</label>
				  <input type="text" class="form-control" name="writer" id="writer" readonly="readonly" value="${member.id}">
				</div>
				
				<div class="mb-3">
				  <label for="contents" class="form-label">CONTENTS</label>
				  <textarea class="form-control" name="contents" id=contents" rows="5"></textarea>
				</div>
			
				<!-- button 추가 -->
				<button class="mb-3 btn btn-outline-secondary" type="button" id="add">File Add</button>
				<button class="mb-3 btn btn-outline-secondary" type="button" class="del">Delete</button>
				<!-- file 추가될 영역 -->
				<div class="mb-3" id="addResult">
				
				
				</div>
				<button type="submit" class="btn btn-success">SUBMIT</button>
			</form>
		</div>
	</div>
	
	<!-- <div id="d1">
		<button id="c1">CLICK</button>
	</div> -->
	
<script type="text/javascript" src="../resources/js/boardFile.js">
	//코드 작성 금지
</script>
<!-- <script type="text/javascript">

	
	$("#d1").click(function(){
		alert('d1');
	});
	
	$("#c1").click(function(){
		alert('c1');
	});
</script> -->
</body>
</html>