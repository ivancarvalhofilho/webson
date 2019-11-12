<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	<%@ include file="../../css/questions.css" %>
</style>
<script>
	let responseIndexToShow = 0;
	let firstQuestionIndex = 0;
	let lastQuestionIndex = ${answerResponse.length() -1};
	
	function changeReponse ( ) {
		$(".createQuestionContainer").hide();
		$("#response"+responseIndexToShow).show();
	}
	function nextReponse ( ) {
		if(responseIndexToShow < lastQuestionIndex)
			responseIndexToShow++;
		changeReponse();
	}
	function previousReponse ( ) {
		if(responseIndexToShow > firstQuestionIndex)
			responseIndexToShow--;
		changeReponse();
	}
	$(document).ready(function () {
		changeReponse();
	});
	
</script>

<c:forEach begin="0" end="${answerResponse.length() -1}" var="index">
	<script>
		$(document).ready (function () {
			<c:if test='${answerResponse.get(index).get("questionType") == 1}'>
				$("#response${index} .gameOfTheElderly .box:nth-child(${answerResponse.get(index).get("responseValue") + 1})").addClass("boxSelected");
			</c:if>
			<c:if test='${answerResponse.get(index).get("questionType") == 2}'>
				// TODO: setar valor da resposta com base no slider
			</c:if>
		});
	</script>

	<div id="response${index}" class="createQuestionContainer" style="display: none">
		<div class="questionBody">
			<div>
				<h2 id="testTitle">${answerResponse.get(index).get("questionTitle")}</h2>
				<label>
					${answerResponse.get(index).get("questionDescription")}
				</label>
				<label>
					email: ${answerResponse.get(index).get("email")}<br>
					telephone: ${answerResponse.get(index).get("telephone")}<br>
					cep: ${answerResponse.get(index).get("cep")}<br>
					age: ${answerResponse.get(index).get("age")}<br>
					gender: ${answerResponse.get(index).get("gender")}<br>
					skinColour: ${answerResponse.get(index).get("skinColour")}<br>
					infirmity: ${answerResponse.get(index).get("infirmity")}<br>
				</label>
			</div>
			<div>
				<c:if test='${answerResponse.get(index).get("questionType") == 1}'>
					<div class="ordinalType">
						<div class="gameOfTheElderly">
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
				</c:if>
				<c:if test='${answerResponse.get(index).get("questionType") == 2}'>
					<div class="continueType" style="height: fit-content;">
						<div class="gameOfTheElderly" style="height: auto; padding-bottom: 60px;">
							<div class="box"></div>
							<div class="box"></div>
							<div class="box"></div>
							<div class="slider"><span/></div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<div class="buttons">
			<button type="button" class="button orange" onclick="previousReponse()">Pergunta anterior</button>
			<button type="button" class="button blue" onclick="nextReponse()">Pr�xima pregunta</button>
			<button type="button" class="button green" onclick="changeContainer(CONTAINERS.tests)">Finalizar</button>
		</div>
	</div>
</c:forEach>
