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
	.testContainer {
		border: 1px solid;
		height: 100%;
		position: relative;
		min-width: 80%;
		margin: 0 10%;
	}
</style>

<div class="testContainer">
	<addButton onclick="changeContainer.call(this, CONTAINERS.createTest)"/>
	<div class="scrollableContent">
		<div class="itemBody">
			<div class="item">
				<div class="texts">
					<span style="font-weight: bold;">Titulo teste aqui</span>
					<span>Breve descrição resumida...</span>
				</div>
				<div class="icons">
					<span>Share</span>
					<span>Editar</span>
					<span>Excluir</span>
				</div>
			</div>
			<div class="item">
				<div class="texts">
					<span style="font-weight: bold;">Titulo teste aqui</span>
					<span>Breve descrição resumida...</span>
				</div>
				<div class="icons">
					<span>Share</span>
					<span>Editar</span>
					<span>Excluir</span>
				</div>
			</div>
			<div class="item">
				<div class="texts">
					<span style="font-weight: bold;">Titulo teste aqui</span>
					<span>Breve descrição resumida...</span>
				</div>
				<div class="icons">
					<span>Share</span>
					<span>Editar</span>
					<span>Excluir</span>
				</div>
			</div>
			<div class="item">
				<div class="texts">
					<span style="font-weight: bold;">Titulo teste aqui</span>
					<span>Breve descrição resumida...</span>
				</div>
				<div class="icons">
					<span>Share</span>
					<span>Editar</span>
					<span>Excluir</span>
				</div>
			</div>
			<div class="item">
				<div class="texts">
					<span style="font-weight: bold;">Titulo teste aqui</span>
					<span>Breve descrição resumida...</span>
				</div>
				<div class="icons">
					<span>Share</span>
					<span>Editar</span>
					<span>Excluir</span>
				</div>
			</div>
		</div>
	</div>
</div>