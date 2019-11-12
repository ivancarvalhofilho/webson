<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function deleteTest(id) {
		$.post(METHODS.deleteTest, {id: id}, function () {
			changeContainer(CONTAINERS.tests);
		});
	}
	
	function editTest(id) {
		changeContainer(CONTAINERS.createTest, "?id="+id);
	}
	
	function viewTest(id) {
		$(".itemBody").load(METHODS.getInterviewerTest+"?idTest="+id);
		$("addButton").hide();
		debugger;
	}
	
	function shareTest(id) {
		let testUrl = window.location.host + '/web/answerTest/' + id;
		$(".katchau").addClass("katchauVisible");
		$(".katchau > label > span").text("Link copiado: " + testUrl);
		
		var dummyContent = testUrl;
		var dummy = $('<input style="display: none">').val(dummyContent).appendTo('body').select()
		document.execCommand('copy');
		
		setTimeout(function () {
			$(".katchauVisible").removeClass("katchauVisible");
		}, 5000);
		setTimeout(function () {
			$("#katchau").prop("checked", 0);
		}, 6000);
	}
</script>

<c:forEach begin="0" end="${testList.length() -1}" var="index">
	<div class="item" onclick="viewTest(${testList.getJSONObject(index).get("id")})">
		<div class="texts">
				<span style="font-weight: bold;">${testList.getJSONObject(index).getString("title")}</span>
			<span>${testList.getJSONObject(index).getString("description")}</span>
		</div>
		<div class="icons">
			<span onclick="shareTest(${testList.getJSONObject(index).get("id")});event.stopImmediatePropagation()">Share</span>
			<span onclick="editTest(${testList.getJSONObject(index).get("id")})">Editar</span>
			<span onclick="deleteTest(${testList.getJSONObject(index).get("id")})">Excluir</span>
		</div>
	</div>
</c:forEach>