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
		
		<c:if test="${not empty member and member.id eq dto.writer}">
			<a href="./delete?num=${dto.num}" class= "btn btn-dark">DELETE</a>
			<a href="./update?num=${dto.num}" class= "btn btn-dark">UPDATE</a>
		</c:if>
		
		
		<c:if test="${board ne 'notice'}">
			<c:if test="${not empty member}">
			<a href="./reply?num=${dto.num}" class= "btn btn-dark">REPLY</a>
			</c:if>
		</c:if>
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
		
		</div>
	</div>
	
<script type="text/javascript">
	
	getComments(1);
	
	let content = '';		
	//UPDATE click event 등록
	$('#commentsList').on("click", ".cupdate", function(){
		let commentNum = $(this).attr("data-comment-update");
		let ta = '<textarea class="form-control" name="contents" rows="2">';
		content = $("#content"+commentNum).text().trim();
		$("#content"+commentNum).children().css('display', 'none');
		ta = ta+content.trim() +'</textarea>';
		ta = ta+'<button class="mb-3 btn btn-outline-secondary up" type="button">update</button>';
		ta = ta+'<button class="mb-3 btn btn-outline-secondary can" type="button">cancel</button>';
		$("#content"+commentNum).append(ta);
		
		
		
	});
	
	$('#commentsList').on("click", ".can", function(){
		alert('취소?');
		if(alert){
			console.log(content);
			$(this).parent().children('div').css('display', 'block');
			$(this).parent().children('textarea').remove();
			$(this).parent().children('button').remove();
		}
	});
	
	$('#commentsList').on("click", ".up", function(){
		alert('수정?');
		if(alert){
			let contents=$(this).prev().val();
			let cn = $(this).parent().prev().text().trim();
			let selector=$(this);
			
			console.log(contents);
			console.log(cn);
			$.ajax({
				type: "POST",
				url: "./commentUpdate",
				data: {
					contents:contents,
					commentNum:cn
				},
				success: function(result){
					result=result.trim();
					if(result>0){
						alert('수정 성공!');
						//getComments(1);
						selector.parent().children('div').text(contents);
						selector.parent().children('div').css('display', 'block');
						selector.parent().children('textarea').remove();
						selector.parent().children('button').remove();
					}else{
						alert('수정 실패!');
					}
				},
				error:function(xhr, status, error){
					alert('수정 실패!');
				}
				
			});
		}else{
			alert('수정 실패');
		}
		
	});
	
	
	//DEL click event 등록
	$('#commentsList').on("click", ".cdel", function(){
		let commentNum = $(this).attr("data-comment-del");
		console.log(commentNum);
		alert('삭제?');
		if(alert){
			$.ajax({
				type: "POST",
				url: "./commentDel",
				data: {
					commentNum:commentNum
				},
				success: function(result){
					result = result.trim();
					
					if(result>0){
						alert('삭제 성공!');
						getComments(1);
					}else{
						alert('삭제 실패!')
					}
				},
				error:function(xhr, status, error){
					alert('삭제 실패!');
				}
				
				
			});
		}else{
			alert('삭제 안됨');
		}
		
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