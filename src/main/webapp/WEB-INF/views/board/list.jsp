<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LIST</title>
	<c:import url="../temp/boot_head.jsp"></c:import>
	
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>
	<h1>${board} Board List Page</h1>
	
	<div class="container-fluid">
		<div class="col-md-7 my-2 mx-auto">
			<!-- Search Form Start -->
			
			<form action="./list" method="get">
		
			 <div class="input-group mb-3">
			 
			 <select name="kind" class="form-select" aria-label="Default select example">
				 <option value="num">Num</option>
				 <option value="title">Title</option>
				 <option value="contents">Contents</option>
				 <option value="writer">Writer</option>
			 </select>
			  
			 <input type="text" name="search" class="form-control" aria-label="Text input with dropdown button">
			 <button type="submit" class="btn btn-outline-secondary">Search</button>
			</div>
				
			</form>
			
			<!-- Search Form Finish -->
			
			
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col" class="table-dark">NUM</th>
			      <th scope="col" class="table-dark">TITLE</th>
			      <th scope="col" class="table-dark">WRITER</th>
			      <th scope="col" class="table-dark">REGDATE</th>
			      <th scope="col" class="table-dark">HITS</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach items="${list}" var="dto">
				    <tr>
				      <th scope="row">${dto.num}</th>
				      <td>
					      <a href="./select?num=${dto.num}">
					      	
					      	<c:catch>
						      	<c:forEach begin="1" end="${dto.depth}">
						      		RE: 
						      	</c:forEach>
					      	</c:catch>
					      	
					      	${dto.title}
					      </a>
				      </td>
				      <td>${dto.writer}</td>
				      <td>${dto.regDate}</td>
				      <td>${dto.hits}</td>
				    </tr>
			   </c:forEach>
			  </tbody>
			</table>
			
			<!-- Paging -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item">
			      <a class="page-link" href="./list?kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    
			    <li class="page-item">
			      <a class="page-link" href="./list?pn=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
			        <span aria-hidden="true">&lt;</span>
			      </a>
			    </li>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="n">
					<li class="page-item">
						<a class="page-link" href="./list?pn=${n}&kind=${pager.kind}&search=${pager.search}">
							${n}
						</a>
					</li>
				</c:forEach>
				
				<li class="page-item">
			      <a class="page-link" href="./list?pn=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
			        <span aria-hidden="true">&gt;</span>
			      </a>
			    </li>
			    
			    <li class="page-item">
			      <a class="page-link" href="./list?pn=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
			
			<a href="./insert" class="btn btn-secondary">ADD</a>
		</div>
	</div>

</body>
</html>