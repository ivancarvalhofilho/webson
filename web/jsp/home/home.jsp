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
		height: calc(100vh - 170px);
		padding: 20px;
	}

	addButton {
		border-radius: 5em;
		background: #2bacaf;
		color: white;
		position: absolute;
		bottom: 10px;
		right: 20px;
		z-index: 99999;
		padding: 10px;
		width: 30px;
		height: 30px;
		display: flex;
		justify-content: center;
		align-items: center;
		font-family: -webkit-body;
		box-shadow: 0px 2px 4px 0px #0000004f;
		cursor: pointer;
	}
	addButton:after {
		content: '+';
		font-size: 50px;
	}
	
	.scrollableContent{
		height: 100%;
		overflow-y: auto;
		width: 100%;
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
