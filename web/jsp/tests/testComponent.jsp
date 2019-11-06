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
		$(".itemBody").load(METHODS.getInterviewerTestController+"?idTest="+id);
		$("addButton").hide();
	}
</script>

<c:forEach begin="0" end="${testList.length() -1}" var="index">
	<div class="item" onclick="viewTest(${testList.getJSONObject(index).get("id")})">
		<div class="texts">
				<span style="font-weight: bold;">${testList.getJSONObject(index).getString("title")}</span>
			<span>${testList.getJSONObject(index).getString("description")}</span>
		</div>
		<div class="icons">
			<span>Share</span>
			<span onclick="editTest(${testList.getJSONObject(index).get("id")})">Editar</span>
			<span onclick="deleteTest(${testList.getJSONObject(index).get("id")})">Excluir</span>
		</div>
	</div>
</c:forEach>