<style>
	.createTestContainer {
		position: relative;
		display: flex;
		flex-flow: column;
		height: 100%;
	}
	
	.createTestContainer {
		display: flex;
		flex-flow: column;
	}
	.createTestContainer > label {
		display: flex;
		margin-top: 15px;
		flex-flow:	 column;
		width: 500px;
	}
	.startTest {
		position: absolute;	
		bottom: 10px;
		right: 50px;
	}
</style>

<script>
	
	function startTest() {
		JSONZAO.test.id = $("#testId").val();
		JSONZAO.test.title = $("#title").val();
		JSONZAO.test.description = $("#description").val();
		changeContainer(CONTAINERS.createQuestions);
	}
	
	$(document).ready(function () {
		resetJSONZAO();
	});	
	
</script>

<div class="createTestContainer">
	<h2>Tela criar pesquisa</h2>
	<input hidden id="testId" value="${test.get("id")}"/>
	<label>
		Titulo pequisa
	<input type="text" name="title" id="title" value="${test != null ? test.get("title") : ""}"/>
	</label>
	<label>
		Descrição pesquisa
		<textarea type="text" name="description" id="description" rows="5">${test != null ? test.get("description") : ""}</textarea>
	</label>
	<button type="button" onclick="startTest()" class="button green startTest">Ir para perguntas</button>
</div>