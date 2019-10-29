<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach begin="0" end="${testList.length() -1}" var="index">
	<div class="item">
		<div class="texts">
			<span style="font-weight: bold;">${testList.getJSONObject(index).getString("title")}</span>
			<span>${testList.getJSONObject(index).getString("description")}</span>
		</div>
		<div class="icons">
			<span>Share</span>
			<span>Editar</span>
			<span>Excluir</span>
		</div>
	</div>
</c:forEach>