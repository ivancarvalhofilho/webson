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
	
	.questionBody {
		display: flex;
		width: 100%;
		height: 80%;
	}
	.questionBody > div:first-child {
		display: flex;
		flex-flow: column;
		width: 50%;
	}
	.questionBody > div:first-child > label {
		display: flex;
		flex-flow: column;
		width: 300px;
		margin: 5px;
	}
	.questionBody > div:last-child {
		display: flex;
		width: 50%;
	}
	
	.ordinalType,.continueType {
		display: flex;
		flex-flow: column;
		align-items: flex-end;
		width: 95%;
		height: 100%;
	}
	.gameOfTheElderly > span {
		position: absolute;
		top: -20px;
		left: 0;
	}
	.gameOfTheElderly {
		position: relative;
		display: inline-flex;
		flex-wrap: wrap;
		width: 50%;
		border: 1px solid black;
		height: 100%;
		justify-content: space-around;
		align-items: center;
		padding: 5px;
		margin-top: 20px;
	}
	.box {
		position: relative;
		width: 25%;
		border: 1px solid black;
		height: 25%;
		cursor: pointer;
	}
	.box:after{
		content: '+';
		font-family: auto;
		font-size: 400%;
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.slider {
		position: absolute;
		bottom: 20px;
		background: linear-gradient(45deg, #e4ff00, #ff0000);
		height: 10px;
		width: 80%;
	}
	.slider > span {
		height: 20px;
		width: 20px;
		border-radius: 3em;
		border: 1px solid black;
		background: white;
		position: absolute;
		cursor: grab;
		top: -5px;
		left: -10px;
		user-select: none;
	}
</style>

<script>
	function getMaxNumberOfQuestion() {
		return getCurretQuestionIndex() >= 19;
	}

	function getMinNumberOfQuestion() {
		return getCurretQuestionIndex() <= 0;
	}

	function getCurretQuestionIndex() {
		return JSONZAO.test.currentQuestion - 1;
	}

	$(document).ready(function () {
		$("#testTitle").text("Tela criar pesquisa: " + JSONZAO.test.title + " - Pergunta " + JSONZAO.test.currentQuestion)
		let currentQuestionObject = getCurrentQuestionObject();
		if(currentQuestionObject != null && getCurrentQuestionObject().title != null){
			$("[name='title']").val(currentQuestionObject.title);
			$("[name='description']").val(currentQuestionObject.description);
			$("[name='type']select").val(currentQuestionObject.type);
			$(".ordinalType,.continueType").hide();
			if(currentQuestionObject.type == 1){
				$(".ordinalType").show();
			} else if (currentQuestionObject.type == 2) {
				$(".continueType").show();
			}
			// $("sliderValue").val(currentQuestionObject.sliderValue);
		} 
		
		if(getMinNumberOfQuestion()) {
			$("#previousQuestion").removeClass("orange");
			$("#previousQuestion").addClass("gray");
		} else if(getMaxNumberOfQuestion()) {
			$("#nextQuestion").removeClass("blue");
			$("#nextQuestion").addClass("gray");
		}
	});

	function getCurrentQuestionObject() {
		return JSONZAO.test.questionList[getCurretQuestionIndex()];
	}

	function calculateSliderPercent() {
		let currentX = $(".slider > span").offset().left + 10;
		let minX = $(".slider").offset().left;
		let maxX = $(".slider").offset().left + $(".slider").width();
		let percentSlider = 1 - ((maxX - currentX) / (maxX - minX));
		// getCurrentQuestionObject().sliderValue = $("[name='type'] option:selected").val();
	}

	function setCurrentQuestionAttributes() {
		if(getCurrentQuestionObject() == null){
			JSONZAO.test.questionList[getCurretQuestionIndex()] = {};
		}
		getCurrentQuestionObject().title = $("[name='title']").val();
		getCurrentQuestionObject().description = $("[name='description']").val();
		getCurrentQuestionObject().type = $("[name='type'] option:selected").val();

	}

	$("#nextQuestion").on("click", function () {
		if(getMaxNumberOfQuestion())
			return;
		setCurrentQuestionAttributes();
		JSONZAO.test.currentQuestion ++;
		changeContainer(CONTAINERS.createQuestions);
	});
	
	$("#previousQuestion").on("click", function () {
		if(getMinNumberOfQuestion())
			return;
		setCurrentQuestionAttributes();
		JSONZAO.test.currentQuestion --;
		changeContainer(CONTAINERS.createQuestions);
	});
	
	$("#finishButton").on("click", function () {
		$.post(METHODS.saveTest, {jsonString: JSON.stringify(JSONZAO.test)});
	});
	
	
	$("[name='type']").on("change", function () {
		$(".ordinalType, .continueType").hide();
		if($(this).children("option:selected").val() == 1){
			$(".ordinalType").show();	
		} else if ($(this).children("option:selected").val() == 2) {
			$(".continueType").show();
		}
	});
	
	var isMoving = false;
	$(".slider").on("mousedown", function () {
		isMoving = true;
	});
	$(window).on("mouseup", function () {
		isMoving = false;
	});
	$(window).on("mousemove", function () {
		if(isMoving){
			let currentY = $(".slider").offset().top - 5;
			let minX = $(".slider").offset().left;
			let maxX = $(".slider").offset().left + $(".slider").width();
			
			let x = event.clientX;     // Get the horizontal coordinate
			
			let newX = 	(x > maxX ? maxX :
						x < minX ? minX :
						x) - 10; 
			$(".slider > span").offset({top:currentY,left:newX});
		}
	});
</script>

<div class="createQuestionContainer">
	<div class="questionBody">
		<div>
			<h2 id="testTitle">aaaaaaaaaaa</h2>
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
				<select name="type">
					<option value="1">Ordinal</option>
					<option value="2">Continuo</option>
				</select>
			</label>
		</div>
		<div>
			<div class="ordinalType">
				<div class="gameOfTheElderly">
					<span>Escolha as imagens das opções</span>
					<div class="box"></div>
					<div class="box"></div>
					<div class="box"></div>
					<div class="box"></div>
					<div class="box"></div>
					<div class="box"></div>
					<div class="box"></div>
					<div class="box"></div>
					<div class="box"></div>
				</div>
			</div>
			<div class="continueType" style="display: none; height: fit-content;">
				<div class="gameOfTheElderly" style="height: auto; padding-bottom: 60px;">
					<span>Escolha as imagens das opções</span>
					<div class="box"></div>
					<div class="box"></div>
					<div class="box"></div>
					<div class="slider"><span/></div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="buttons">
		<button type="button" class="button orange" id="previousQuestion">Pergunta anterior</button>
		<button type="button" class="button blue" id="nextQuestion">Próxima pregunta</button>
		<button type="button" class="button green" id="finishButton">Finalizar</button>
	</div>
</div>