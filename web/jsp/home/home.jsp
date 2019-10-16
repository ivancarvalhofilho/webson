<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript" src="../../js/jquery.min.js"></script>
</head>
<body>

<style>
	body {
		margin: 0;
		padding: 0;
		height: 100vh;
		display: block;
		font-family: Roboto;
	}

	@font-face {
		font-family: "Roboto";
		src: url("../../fonts/Roboto-Regular.ttf");
	}

	.home {
		height: 80%;
		padding: 20px;
	}
	

</style>

<script>
	
	var CONTAINERS = {
		home: "/web/homeContainer",
		administrator: "/web/administratorContainer",
		tests: "/web/testContainer",
		login: "/login",
	};
	
	function changeComponent (component) {
		$("#content").load(component);
	};
	
	function changeContainer (component) {
		$(".menu-bar > span").removeClass("active-menu");
		$(this).addClass("active-menu");
		
		changeComponent(component);
	};

	$(document).ready( function () {
		changeComponent(CONTAINERS.home);
	});

</script>

<jsp:include page="../header/header.jsp"/>

<div class="home">
	<div id="content"> 

	</div>
</div>

<jsp:include page="../footer/footer.jsp"/>
</body>
</html>
