<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<title>Login</title>
</head>
<body>
	<style>
		body {
			padding: 0;
			margin: 0; 
			background: rgba(0,0,0,0.31);
		}

		form {
			display: flex;
			justify-content: center;
			align-items:center;
			height: 100vh;
		}

		form > div {
			display: flex;
			justify-content: center;
			align-items: center;
			background: white;
			border: 1px solid black;
			border-radius: 1em;
			flex-flow: column;
			width: 400px;
			height: 500px;
			box-shadow: 0 0 20px 0px #00000054;
			position: relative;
		}
		
		form > div > div{
			display: flex;
			flex-flow: column;
			height: 150px;
			justify-content: space-around;
		}
		h2 {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			display: flex;
			justify-content: center;
			margin-top: 30px !important;
			color: blue !important;
		}
		spanError {
			color: red;
			font-weight: bold;
			width: 100%	;
			display: flex;	
			justify-content: center;
		}
	</style>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<form method="POST" action="/web/login">
		<div>
			<div>
				<h2>Loga ai</h2>
				<input name="name"/>
				<input name="password" type="password"/>
				<button>entrar</button>
				<c:if test="${errorMsg != null}">
					<spanError>${errorMsg}</spanError>
				</c:if>
			</div>
		</div>
	</form>
</body>
</html>
