<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript">
		window.alert('Hello world');
	</script>
	<link href="./resources/css/home.css" rel="stylesheet">
	
	<c:import url="./temp/boot_head.jsp"></c:import>
</head>
<body>
	<c:import url="./temp/boot_nav.jsp"></c:import>
	
	<br>
	<h1 class="c1">HOMEPAGE</h1>
	
	<h1 id="d1">Other H1</h1>
	
	<div id="d2">
		<h3>IN DIV</h3>
	</div>
	
	<img id="d3" class="c1" alt="" src="./resources/images/bh1.jpg">
	
	<div>
		
		<button onClick="fn1()">CLICK</button>
	</div>
	
	<script type="text/javascript">
		console.log('Body Script');
	</script>
	
<!-- <script type="text/javascript" src="./resources/js/home.js"></script> -->
	<script type="text/javascript" src="./resources/js/function_1.js"></script>
</body>
</html>
