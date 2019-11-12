<style>
	.itemBody {
		display: flex;
		justify-content: flex-start;
		align-items: center;
		height: fit-content;
		flex-flow: column;
		width: 100%;
		margin: 10px 0;
		overflow-y: auto;
	}
	
	.item {
		border: 1px solid lightgray;
		margin-bottom: 15px;
		padding: 10px;
		border-radius: 1em;
		width: 70%;
		height: 60px;
		box-shadow: 2px 4px 10px 0px #8c8c8c24;
		display: flex;
		justify-content: space-between;
		align-items: center;
		cursor: pointer;
	}
	
	.texts {
		display: flex;
		flex-flow: column;
		height: 100%;
		justify-content: space-evenly;
	}
	.icons {
		display: flex;
		width: 200px;
		justify-content: space-around;
	}
	.icons > span {
		border: 1px solid black;
		border-radius: 10px;
		color: white;
		font-weight: bold;
		padding: 4px;
		cursor: pointer;
		transition: 0.2s;
	}
	.icons > span:nth-child(1) {
		background: gray;
	}
	.icons > span:nth-child(2) {
		background: blue;
	}
	.icons > span:nth-child(3) {
		background: red;
	}
	.icons > span:hover {
		filter: brightness(0.8);
	}
	.testContainer {
		border: 1px solid;
		height: 100%;
		position: relative;
		min-width: 80%;
		margin: 0 10%;
	}
	
	.katchau {
		position: fixed;
		left: 0;
		bottom: 50px;
		width: 100%;
		display: flex;
		justify-content: center;
		z-index: 100000;
		opacity: 0;
		transition: 1s;
	}
	.katchau > label {
		display: flex;
		justify-content: center;
		width: 100%;
	}
	.katchauVisible {
		opacity: 1;
	}
	.katchau > label > span{
		width: 80%;
		background: gray;
		border-radius: 1em;
		padding: 10px;
		text-align: center;
	}
	.katchau > input:checked + label > span {
		animation: piaoDoBau 0.5s infinite linear;
		background: linear-gradient(265deg, #073BE6, #2de807, #ffda00, #f00,#073BE9);
	}
	
	@keyframes piaoDoBau {
		0% {
			transform: rotate(0deg);
		}
		100% {
			transform: rotate(359deg);
		}
	}
</style>

<script>
	$(document).ready(function () {
		$(".itemBody").load(METHODS.searchTest);
	});
</script>

<div class="testContainer">
	<addButton onclick="changeContainer.call(this, CONTAINERS.createTest)"/>
	
	<div class="scrollableContent">
		<div class="itemBody">
			
		</div>
	</div>
	
	<div class="katchau">
		<input type="checkbox" hidden id="katchau">
		<label for="katchau"><span></span></label>
	</div>
</div>