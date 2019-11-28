<style>
	<%@ include file="../../css/questions.css" %>
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
		if (currentQuestionObject != null && getCurrentQuestionObject().title != null) {
			$("[name='title']").val(currentQuestionObject.title);
			$("[name='description']").val(currentQuestionObject.description);
			$("[name='type']select").val(currentQuestionObject.type);
			$(".ordinalType,.continueType").hide();
			if (currentQuestionObject.type == 1) {
				$(".ordinalType").show();
			} else if (currentQuestionObject.type == 2) {
				$(".continueType").show();
			}
			// $("sliderValue").val(currentQuestionObject.sliderValue);
		}

		if (getMinNumberOfQuestion()) {
			$("#previousQuestion").removeClass("orange");
			$("#previousQuestion").addClass("gray");
		} else if (getMaxNumberOfQuestion()) {
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
		if (getCurrentQuestionObject() == null) {
			JSONZAO.test.questionList[getCurretQuestionIndex()] = {};
		}
		getCurrentQuestionObject().title = $("[name='title']").val();
		getCurrentQuestionObject().description = $("[name='description']").val();
		getCurrentQuestionObject().type = $("[name='type'] option:selected").val();

	}

	$("#nextQuestion").on("click", function () {
		if (getMaxNumberOfQuestion())
			return;
		setCurrentQuestionAttributes();
		JSONZAO.test.currentQuestion++;
		changeContainer(CONTAINERS.createQuestions);
	});

	$("#previousQuestion").on("click", function () {
		if (getMinNumberOfQuestion())
			return;
		setCurrentQuestionAttributes();
		JSONZAO.test.currentQuestion--;
		changeContainer(CONTAINERS.createQuestions);
	});

	$("#finishButton").on("click", function () {
		$.post(METHODS.saveTest, {jsonString: JSON.stringify(JSONZAO.test)}, function () {
			changeContainer(CONTAINERS.tests);
		});
	});


	$("[name='type']").on("change", function () {
		$(".ordinalType, .continueType").hide();
		if ($(this).children("option:selected").val() == 1) {
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
		if (isMoving) {
			let currentY = $(".slider").offset().top - 5;
			let minX = $(".slider").offset().left;
			let maxX = $(".slider").offset().left + $(".slider").width();

			let x = event.clientX;     // Get the horizontal coordinate

			let newX = (x > maxX ? maxX :
				x < minX ? minX :
					x) - 10;
			$(".slider > span").offset({top: currentY, left: newX});
		}
	});
	
	var selectedBox = 0;
	$(".box").click(function () {
		selectedBox = $(this).attr("name");
		$(".modal").show();
		$(".modalBody").load(CONTAINERS.selectImage);
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
				Descri��o pergunta
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
					<span>Escolha as imagens das op��es</span>
					<div class="box" name="1"><img/></div>
					<div class="box" name="2"><img/></div>
					<div class="box" name="3"><img/></div>
					<div class="box" name="4"><img/></div>
					<div class="box" name="5"><img/></div>
					<div class="box" name="6"><img/></div>
					<div class="box" name="7"><img/></div>
					<div class="box" name="8"><img/></div>
					<div class="box" name="9"><img/></div>
				</div>
			</div>
			<div class="continueType" style="display: none; height: fit-content;">
				<div class="gameOfTheElderly" style="height: auto; padding-bottom: 60px;">
					<span>Escolha as imagens das op��es</span>
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
		<button type="button" class="button blue" id="nextQuestion">Pr�xima pregunta</button>
		<button type="button" class="button green" id="finishButton">Finalizar</button>
	</div>
</div>