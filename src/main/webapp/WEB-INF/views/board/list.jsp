<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LIST</title>
	<c:import url="../temp/boot_head.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import></head>
	<h1>LIST PAGE</h1>
	
	<div class="container-fluid">
		<div class="col-md-7 my-2 mx-auto">
			<table class="table table-hover">
				<tr>
					<th>Num</th><th>Title</th><th>Writer</th><th>RegDate</th><th>Hits</th>
				</tr>
				<c:forEach items="${list}" var="dto">
				<tr>
					<th>${dto.num}</th>
					<th><a href="./select?num=${dto.num}">${dto.title}</a></th>
					<th>${dto.writer}</th>
					<th>${dto.regDate}</th>
					<th>${dto.hits}</th>
				</tr>
				</c:forEach>
			</table>
			
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span>
					</a></li>

					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="n">
						<li class="page-item">
							<a class="page-link" href="./list?pn=${n}">
								${n}
							</a>
						</li>
					</c:forEach>
					
					<li class="page-item"><a class="page-link" href="#" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
			
			<a href="./insert" class="btn btn-secondary">ADD</a>
		</div>
	</div>
</body>
</html>