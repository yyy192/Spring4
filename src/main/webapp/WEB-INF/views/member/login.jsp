<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>

	<c:import url="../temp/boot_head.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>

	<h1>Login Page</h1>
	<div class="container-fluid">
		<div class="col-md-7 my-2 mx-auto">
			<form id="frm" action="login" method="post">
					
				<div class="mb-3">
					<label for="text" class="form-label">Id</label>
					<input type="text" name="id" class="form-control n" id="id">
					
				</div>
					  
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">Password</label>
					<input type="password" name="pw" class="form-control n pw" id="pw1">
					  
				</div>
				
				<div class="mb-3">
					<button type="submit" id="btn" class="btn btn-primary">Login</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>