<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function deleteTest(id) {
		$.post(METHODS.deleteTest, {id: id}, function () {
			changeContainer(CONTAINERS.tests);
		});
	}
	
	function viewTest(id) {
		$(".itemBody").load(METHODS.getInterviewerTest+"?idTest="+id);
		$("addButton").hide();
	}
	
	function downloadTest(id) {
		// $(".itemBody").load(METHODS.getInterviewerTest+"?idTest="+id);
		// $("addButton").hide();
	}
	
	function shareTest(id) {
		let testUrl = window.location.host + '/web/answerTest/' + id;
		$(".katchau").addClass("katchauVisible");
		$(".katchau > label > span").text("Link copiado: " + testUrl);

		setTimeout(function () {
			$(".katchauVisible").removeClass("katchauVisible");
		}, 5000);
	}
</script>

<c:forEach begin="0" end="${testList.length() -1}" var="index">
	<div class="item" onclick="viewTest(${testList.getJSONObject(index).get("id")})">
		<div class="texts">
				<span style="font-weight: bold;">${testList.getJSONObject(index).get("title")}</span>
			<span>${testList.getJSONObject(index).get("description")}</span>
		</div>
		<div class="icons">
			<span onclick="shareTest(${testList.getJSONObject(index).get("id")});event.stopImmediatePropagation()"><img src="../../icons/share.png"></span>
			<span onclick="downloadTest(${testList.getJSONObject(index).get("id")})"><img src="../../icons/download.png"></span>
			<span onclick="deleteTest(${testList.getJSONObject(index).get("id")})"><img src="../../icons/delete.png"></span>
		</div>
	</div>
</c:forEach>