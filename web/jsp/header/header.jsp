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
		text-shadow: 3px 3px #a2a2a263;
		font-weight: bold;
		text-transform: uppercase;
		top: 30px;
		right: 50px;
		font-size: 40px;
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
	}
	.menu-bar > span {
		transition: 0.25s;
		background: darkslategray;
		color: white;
		border-top-left-radius: 7px;
		border-top-right-radius: 7px;
		padding: 3px 30px;
		margin: 3px;
		position: relative;
		bottom: 3px;
		cursor: pointer;
	}
</style>

<div class="header">
	<div class="logo">Projeto Web</div>
	<div class="menu-bar">
		<span onclick="changeContainer.call(this, CONTAINERS.home)" class="active-menu">Home</span>
		<span onclick="changeContainer.call(this, CONTAINERS.administrator)">Adminstração</span>
		<span onclick="changeContainer.call(this, CONTAINERS.tests)">Listar pesquisas</span>
	</div>
</div>
