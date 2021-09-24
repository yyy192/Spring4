<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>UPDATE</title>
	<c:import url="../temp/boot_head.jsp"></c:import>
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>
	<h1>${board} Board Update Page</h1>
	
	<div class="container-fluid">
		<div class="col-md-7 my-2 mx-auto">
			<form action="./update" method="post" enctype="multipart/form-data">
			
				<input type="text" readonly="readonly" value="${dto.num}" name="num">
				
				<div class="mb-3">
				  <label for="title" class="form-label">TITLE</label>
				  <input type="text" class="form-control" value="${dto.title}" name="title" id="title">
				</div>
				
				<div class="mb-3">
				  <label for="writer" class="form-label">WRITER</label>
				  <input type="text" class="form-control" value="${dto.writer}" readonly="readonly" name="writer" id="writer">
				</div>
				
				<div class="mb-3">
				  <label for="contents" class="form-label">CONTENTS</label>
				  <textarea class="form-control" name="contents" id="contents" rows="5">${dto.contents}</textarea>
				</div>
				
				<div>
					<c:forEach items="${dto.files}" var="f">
						<div>
							${f.oriName} <span data-files-name="${f.fileName}" data-files-num="${f.fileNum}" class="fileDelete">X</span>
						</div>
						
					</c:forEach>
				</div>
				
				
				
				<hr><hr>
				<!-- button 추가 -->
				<button class="mb-3 btn btn-outline-secondary" type="button" id="add">File Add</button>
				<button class="mb-3 btn btn-outline-secondary" type="button" class="del">Delete</button>
				<!-- file 추가될 영역 -->
				<div class="mb-3" id="addResult">
				
				
				</div>
				<button type="submit">UPDATE</button>
			</form>
		</div>
	</div>

<script type="text/javascript" src="../resources/js/boardFile.js">
	//코드 작성 금지
</script>

<script type="text/javascript">
	
	
	
	setCount('${dto.files.size()}');
	
	$('#contents').summernote();
	
	$('.fileDelete').click(function(){
		let fileNum = $(this).attr("data-files-num");
		let fileName = $(this).attr("data-files-name");
		let selector = $(this);
		$.ajax({
			type:"POST",
			url:"./fileDelete",
			data:{
				fileNum:fileNum,
				fileName:fileName
			},
			success: function(result){
				console.log(result);
				selector.parent().remove();
				updateCount();
			}
			
		});
	});
	
</script>
</body>
</html>