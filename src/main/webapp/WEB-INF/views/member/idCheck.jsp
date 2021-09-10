<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Id Check</title>
</head>
<body>
	<h1>ID Check Page</h1>
	<div>
		${param.id}은
		<c:if test="${empty dto}">
			 사용 가능한 아이디입니다.
		</c:if>
		<c:if test="${not empty dto}">
			 이미 존재하는 아이디입니다.
		</c:if>
	</div>
	<form id="frm" action="idCheck" method="get">
			
		<div class="mb-3">
			<label for="text" class="form-label">Id</label>
			<input type="text" name="id" value="${param.id}" class="form-control n" id="id">
			<button type="submit" id="idCheck">ID 중복 확인</button>
			<c:if test="${empty dto}">
				<button type="button" id="useId">ID 사용</button>
			</c:if>
			<!-- <div id="idResult"></div> -->
		</div>
	</form>
	
<script type="text/javascript">
	const useId = document.getElementById('useId');
	useId.addEventListener('click', function(){
		let id = window.document.getElementById('id').value;
		opener.document.getElementById('id').value=id;
		close();
		
	});

</script>
</body>
</html>