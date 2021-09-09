<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JOIN</title>
	<style type="text/css">
		#same{
			color: red;
		}
	</style>
	<c:import url="../temp/boot_head.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>
	
	<h1>Join Page</h1>
	
	<div class="container-fluid">
		<div class="col-md-7 my-2 mx-auto">
			<form>
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">Id</label>
			    <input type="text" class="form-control" id="id" aria-describedby="emailHelp">
			  </div>
			  <div class="mb-3">
			    <label for="exampleInputPassword1" class="form-label">Password</label>
			    <input type="password" class="form-control" id="pw">
			  </div>
			  	  <div class="mb-3">
			    <label for="exampleInputPassword1" class="form-label">Password check</label>
			    <input type="password" class="form-control" id="pw2">
			  <div id="same"></div>
			  </div>
			  <div class="mb-3">
			    <label for="exampleInputPassword1" class="form-label">Name</label>
			    <input type="text" class="form-control" id="name">
			  </div>
			  <div class="mb-3">
			    <label for="exampleInputPassword1" class="form-label">Phone</label>
			    <input type="text" class="form-control" id="phone">
			  </div>
			  <div class="mb-3">
			    <label for="exampleInputPassword1" class="form-label">E-Mail</label>
			    <input type="text" class="form-control" id="email">
			  </div>
			  <button type="button" id="btn" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
<script type="text/javascript" src="../resources/js/join.js"></script>
</body>
</html>