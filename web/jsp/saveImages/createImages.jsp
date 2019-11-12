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
	function saveImage() {
		$.post(METHODS.addImage, {img : $('#file').prop('files')[0].name}, function () {
			changeContainer(CONTAINERS.administrator);
		});
	}
</script>

<div class="createTestContainer">
	<h2>Tela salvar imagem</h2>
	<input hidden id="testId" value="${test.get("id")}"/>
	<label>
		Entre com o arquivo
		<input type="file" name="file" id="file"/>
	</label>
	<button type="button" onclick="saveImage()" class="button green startTest">Salvar Imagem</button>
</div>