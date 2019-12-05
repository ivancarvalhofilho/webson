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

	.button-dark {
		color: black !important;
	}
	.button,.button-dark {
		width: 150px;
		color: white;
		padding: 10px;
		border-radius: 5px;
		cursor: pointer;
		font-weight: bold;
		font-family: 'Roboto';
		border: none;
		box-shadow: 1px 1px 5px #00000078;
	}
	.green {
		background: green;
	}
	.blue {
		background: blue;
	}
	.yellow {
		background: yellow;
	}
	.orange {
		background: orange;
	}
	.gray {
		background: dimgray;
	}
	
	.scrollableContent{
		height: 100%;
		overflow-y: auto;
		width: 100%;
	}
	.modal {
		position: absolute;
		width: 100vw;
		height: 100vh;
		background: rgba(0, 0, 0, 0.5);
		top: 0;
		left: 0;
		transition: 1s;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.modalBody{
		background: white;
		width: 700px;
		height: 500px;
		border-radius: 1em;
		border: 1px solid;
		position: relative;
	}
</style>

<script>
	
	var CONTAINERS = {
		home: "/web/homeContainer",
		administrator: "/web/administratorContainer",
		tests: "/web/testContainer",
		createTest: "/web/createTestContainer",
		createQuestions: "/web/createQuestionsContainer",
		addImage: "/web/addImageContainer",
		selectImage: "/web/selectImage",
	};
	
	var METHODS = {
		saveTest: "/web/saveTest",
		deleteTest: "/web/deleteTest",
		searchTest: "/web/searchTests",
		getInterviewerTest: "/web/getInterviewerTest",
		getAnswer: "/web/getAnswerByInterviewerAndTest",
		deleteImage: "/web/deleteImage",
	};
	
	var JSONZAO = {
		test: {
			currentQuestion: 1,
			id: null,
			title: null,
			description: null,
			questionList: [
				{
					title: null,
					description: null,
					type: null,
					images: [],
					sliderValue: []
				}
			]
		}
	};
	
	function resetJSONZAO() {
		JSONZAO = {
			test: {
				currentQuestion: 1,
					title: null,
					description: null,
					questionList: [
					{
						title: null,
						description: null,
						type: null,
						images: []
					}
				]
			}
		}
	}
	
	function changeComponent (component, param) {
		$("#content").load(component + (param != null ? param : ""));
	};
	
	function changeContainer (component, param) {
		$(".menu-bar > span").removeClass("active-menu");
		
		if (component == CONTAINERS.home) {
			$("#homeHeaderBar").addClass("active-menu");
		} else if(component == CONTAINERS.administrator ||
			component == CONTAINERS.addImage) {
			$("#administratorHeaderBar").addClass("active-menu");
		} else if (component == CONTAINERS.tests ||
			component == CONTAINERS.createTest ||
			component == CONTAINERS.createQuestions ||
			component == METHODS.getAnswer 
			) {
			$("#testsHeaderBar").addClass("active-menu");
		}
		
		changeComponent(component, param);
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

<div class="modal" style="display: none">
	<div class="modalBody">
	
	</div>
</div>

</body>
</html>
