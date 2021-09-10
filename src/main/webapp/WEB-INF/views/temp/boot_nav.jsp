<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">Navbar</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDropdown">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="${pageContext.request.contextPath}/notice/list">NOTICE</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="${pageContext.request.contextPath}/qna/list">QNA</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            Dropdown link
	          </a>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	            <li><a class="dropdown-item" href="#">Action</a></li>
	            <li><a class="dropdown-item" href="#">Another action</a></li>
	            <li><a class="dropdown-item" href="#">Something else here</a></li>
	          </ul>
	        </li>
	        <c:choose>
	        	<c:when test="${not empty member}">
	        		<li class="nav-item">
			          <a class="nav-link" href="${pageContext.request.contextPath}/member/mypage">MY PAGE</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${pageContext.request.contextPath}/member/logout">LOGOUT</a>
			        </li>
			        
	        	</c:when>
	        	<c:otherwise>
	        		<li class="nav-item">
			          <a class="nav-link" href="${pageContext.request.contextPath}/member/check">JOIN</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${pageContext.request.contextPath}/member/login">LOGIN</a>
			        </li>
	        	</c:otherwise>
	        
	        </c:choose>
	      </ul>
	    </div>
	  </div>
	</nav>