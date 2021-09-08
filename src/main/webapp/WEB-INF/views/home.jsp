<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript">
		alert('Hello world');
	</script>
	
	<c:import url="./temp/boot_head.jsp"></c:import>
</head>
<body>
	<c:import url="./temp/boot_nav.jsp"></c:import>
	
	<br>
	<h1>HOMEPAGE</h1>
	
	<script type="text/javascript">
		console.log('Body Script');
	</script>
</body>
</html>
