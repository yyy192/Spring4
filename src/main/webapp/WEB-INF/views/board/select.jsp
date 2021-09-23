<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SELECT</title>
	<c:import url="../temp/boot_head.jsp"></c:import>
	<style type="text/css">
		.more {
			cursor: pointer;
		}
	</style>
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import></head>
	<h1>${board} Board Select Page</h1>
	
	<div class = "container-fluid">
		<div class="col-md-7 my-2 mx-auto">
			<h3>Num : ${dto.num}</h3>
			<h3>Title : ${dto.title}</h3>
			<h3>Writer : ${dto.writer}</h3>
			<div>
				${dto.contents}
			</div>
			<h3>RegDate : ${dto.regDate}</h3>
			<h3>Hits : ${dto.hits}</h3>
			
		<c:forEach items="${dto.files}" var="f">
			<div>
				<a href="./down?fileName=${f.fileName}">${f.oriName}</a>
			</div>
		</c:forEach>
		
		<!-- 댓글 목록 -->
		<hr>
		<h5>Comments</h5>
			<div id="commentsList" data-board-num="${dto.num}" class = "container-fluid">
				
			
			</div>
		<hr>
		<!-- 댓글 달기 -->
		<div>
			<div class="mb-3">
				<input type="hidden" id="board" name="board" value="${board}">
				<input type="hidden" id="num" name="num" value="${dto.num}">
			</div>
			<div class="mb-3">
				  <label for="writer" class="form-label">WRITER</label>
				  <input type="text" class="form-control" name="writer" id="writer" readonly="readonly" value="${member.id}">
			</div>
				
			<div class="mb-3">
				  <label for="contents" class="form-label">COMMENT</label>
				  <textarea class="form-control" name="contents" id="contents" rows="2"></textarea>
			</div>
			
			<button class="mb-3 btn btn-outline-secondary" type="button" id="comments">Comment</button>
		</div>
		<hr>
			
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
	
<script type="text/javascript">
	
	getComments(1);
	
	//DEL click event 등록
	$('#commentsList').on("click", ".cdel", function(){
		let commentNum = $(this).attr("data-comment-del");
		console.log(commentNum);
		$.ajax({
			type: "GET",
			url: "./commentDel",
			data: {
				commentNum:commentNum
			},
			success: function(result){
				result = result.trim();
			
				getComments(1);
			},
			error:function(xhr, status, error){
				console.log(error);
			}
			
			
		});
	});
	
	$('#commentsList').on("click", ".more", function(){
		//data-comment-pn 값을 출력
		let pn = $(this).attr("data-comment-pn");
		getComments(pn);
	});
	
	function getComments(pn) {
		let num = $("#commentsList").attr("data-board-num");
		$.ajax({
			type: "GET",
			url : "./getComments",
			data : {
				num:num,
				pn: pn
			},
			success: function(result){
				result=result.trim();
				$("#commentsList").html(result);
			},
			error:function(xhr, status, error){
				console.log(error);
			}
			
		});
	}
	
	$('#comments').click(function(){
		//작성자, 내용을 console에 출력
		let writer = $('#writer').val();
		let contents = $('#contents').val();
		let board = $('#board').val();
		let num = $('#num').val();
		
		$.post('./comments', {writer:writer, contents:contents, board:board, num:num}, function(result){
			console.log(result.trim());
			
			//댓글 입력 후 contents창 빈칸으로 만들기
			$('#contents').val('');
			//입력 후 다시 가져오기
			getComments();
		});
	});
	
	
	
</script>
</body>
</html>