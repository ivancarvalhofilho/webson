<style>
	.itemBody {
		display: flex;
		justify-content: flex-start;
		align-items: center;
		height: fit-content;
		flex-flow: column;
	}
	
	.item {
		border: 1px solid lightgray;
		margin-bottom: 15px;
		padding: 10px;
		border-radius: 1em;
		width: 50%;
		height: 60px;
		box-shadow: 2px 4px 10px 0px #8c8c8c24;
		display: flex;
		justify-content: space-between;
		align-items: center;	
	}
	
	.texts {
		display: flex;
		flex-flow: column;
		height: 100%;
		justify-content: space-evenly;
	}
	.icons {
		display: flex;
		width: 150px;
		justify-content: space-around;
	}
	.icons > span {
		border: 1px solid black;
		border-radius: 10px;
		color: white;
		font-weight: bold;
		padding: 4px;
		
	}
	.icons > span:first-child {
		background: blue;
	}
	.icons > span:last-child {
		background: red;
	}
</style>

<div class="itemBody">
	<div class="item"> 
		<div class="texts">
			<span>Titulo teste aqui</span>
			<span>Breve descrição resumida...</span>
		</div>
		<div class="icons">
			<span>Editar</span>
			<span>Excluir</span>
		</div>
	</div>
</div>