<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function viewResponse(id) {
		changeContainer(METHODS.getAnswer, "?answerId="+id);
	}
</script>

<c:forEach begin="0" end="${interviewerList.length() -1}" var="index">
	<div class="item" onclick="viewResponse(${interviewerList.getJSONObject(index).get("id")})">
		<div class="texts">
			<span style="font-weight: bold;">Nome: ${interviewerList.getJSONObject(index).get("email")}</span>
			<span>Idade: ${interviewerList.getJSONObject(index).get("age")}</span>
		</div>
	</div>
</c:forEach>