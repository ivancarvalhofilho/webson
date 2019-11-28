<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
	.header {
		position: relative;
		top: 0;
		left: 0;
		height: 100px;
		border-bottom: 1px solid gray;
		box-shadow: 0 0 20px 0px #00000054;
		display: flex;
		align-items: flex-end;
	}
	.logo {
		position: absolute;
		color: cadetblue;
		font-weight: bold;
		text-transform: uppercase;
		top: 30px;
		right: 50px;
		font-size: 40px;
		/*animation: textGradient 1.5s linear infinite;*/
		/*background: linear-gradient(230deg, #073BE6, #2de807, #ffda00, #f00,#073BE9);*/
		/*background-size: 50% 100%;*/
		/*-webkit-background-clip: text;*/
		/*-webkit-text-fill-color: transparent;*/
	}
	
	@keyframes textGradient {
		0%{background-position: 0% 50%;}
		100%{background-position: 100% 50%;}
	}
	
	.menu-bar {
		margin-left: 40px;
	}
	.active-menu {
		font-weight: bold;
		color: darkslategray;
		background: white;
		padding-bottom: 8px !important;
		padding-top: 8px !important;
		bottom: 8px !important;
		filter: saturate(1) !important;
	}
	.menu-bar > span:hover{
		filter: saturate(1);
	}
	.menu-bar > span {
		/*animation: textGradient 1.5s linear infinite;*/
		background: #11a2a2;
		filter: saturate(0);
		transition: 0.2s linear;
		background-size: 50% 100%;
		
		color: white;
		border-top-left-radius: 7px;
		border-top-right-radius: 7px;
		padding: 3px 30px;
		margin: 3px;
		position: relative;
		bottom: 3px;
		cursor: pointer;
	}

	.sair{
		border-radius: 1em;
		position: absolute;
		left: 10px;
		top: 15px;
		color: white;
		font-weight: bold;
		background: #ce1111;
		padding: 5px 15px;
		cursor: pointer;
	}
</style>

<div class="header">
	<span class="sair" onclick="document.location.pathname = '/web/login';">Sair</span>
	<div class="logo">Sistema de pesquisas</div>
	<div class="menu-bar">
		<span id="homeHeaderBar" onclick="changeContainer.call(this, CONTAINERS.home)" class="active-menu">Home</span>
		<span id="administratorHeaderBar" onclick="changeContainer.call(this, CONTAINERS.administrator)">Banco de imagens</span>
		<span id="testsHeaderBar" onclick="changeContainer.call(this, CONTAINERS.tests)">Lista de pesquisas</span>
	</div>
</div>
