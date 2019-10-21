<style>
	
	.createQuestionContainer {
		position: relative;
		display: flex;
		flex-flow: column;
		height: 100%;
	}
	
	.buttons {
		position: absolute;
		bottom: 0;
		width: 100%;
		display: flex;
		justify-content: flex-end;
	}
	.buttons > button {
		margin: 15px;
	}
	.buttons > button:first-child {
		position: absolute;
		left: 0;
	}
	
</style>

<script>
	$(document).ready(function () {
		$(".createQuestionContainer > h2").text("Tela criar pesquisa: " + JSONZAO.test.title + " - Pergunta " + JSONZAO.test.currentQuestion)
	});
</script>

<div class="createQuestionContainer">
	<h2>aaaaaaaaaaa</h2>
	<label>
		Titulo pergunta
		<input type="text" name="title"/>
	</label>
	<label>
		Descrição pergunta
		<input type="text" name="description"/>
	</label>
	<label>
		Tipo pergunta
		<select name="description">
			<option value="1">Ordinal</option>
			<option value="2">Continuo</option>
		</select>
	</label>
	<div class="buttons">
		<button type="button" class="button orange" id="previousQuestion">Pergunta anterior</button>
		<button type="button" class="button blue" id="nextQuestion">Próxima pregunta</button>
		<button type="button" class="button green" id="finishButton">Finalizar</button>
	</div>
</div>