<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function viewResponse(id) {
		changeContainer(CONTAINERS.createTest, "?id="+id);
	}
</script>

<c:forEach begin="0" end="${interviewerList.length() -1}" var="index">
	<div class="item" onclick="viewResponse(${interviewerList.getJSONObject(index).get("answerId")})">
		<div class="texts">
			<span style="font-weight: bold;">${interviewerList.getJSONObject(index).getString("interviewerName")}</span>
			<span>${interviewerList.getJSONObject(index).getString("interviewerSexo")}</span>
		</div>
	</div>
</c:forEach>