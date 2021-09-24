<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-dark table-striped">
	<c:forEach items="${comments}" var="comment">
	
		<tr>
			<td>${comment.commentNum}</td>
			<td id="content${comment.commentNum}">
				<%-- <textarea class="form-control" readonly="readonly" name="contents" id="contents" rows="2">${comment.contents}</textarea> --%>
				<div>
					${comment.contents}
				</div>
			</td>
			<td>작성자 : ${comment.writer}, 작성날짜 : ${comment.regDate}</td>
			
			<c:if test="${not empty member and member.id eq comment.writer}">
				<td><button class="cdel" data-comment-del="${comment.commentNum}">삭제</button></td>
				<td><button class="cupdate" data-comment-update="${comment.commentNum}">수정</button></td>
			</c:if>
			
		</tr>
	
	</c:forEach>
</table>
<!-- Paging -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item">
			      <span class="page-link more" data-comment-pn="1" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </span>
			    </li>
			    
			    <li class="page-item">
			      <span class="page-link more" data-comment-pn="${pager.startNum-1}" aria-label="Previous">
			        <span aria-hidden="true">&lt;</span>
			      </span>
			    </li>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="n">
					<li class="page-item">
						<span class="page-link more" data-comment-pn="${n}">
							${n}
						</span>
					</li>
				</c:forEach>
				
				<li class="page-item">
			      <span class="page-link more" data-comment-pn="${pager.lastNum+1}" aria-label="Next">
			        <span aria-hidden="true">&gt;</span>
			      </span>
			    </li>
			    
			    <li class="page-item">
			      <span class="page-link more" data-comment-pn="${pager.totalPage}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </span>
			    </li>
			  </ul>
			</nav>

