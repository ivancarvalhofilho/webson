<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.selectImage {
		border: 1px solid;
		position: relative;
		overflow-y: auto;
		width: 80%;
		margin: 0px 10%;
		height: fit-content;
		max-height: 80%;
	}
	.image > span:after {
		content: 'X';
	}
	.image > span {
		font-weight: bold;
		height: 10px;
		width: 10px;
		border-radius: 50em;
		background: red;
		color: white;
		position: absolute;
		border: 1px solid;
		top: -15px;
		right: -15px;
		font-size: 15px;
		padding: 10px;
		text-align: center;
		line-height: 10px;
		transform: scale(0.7);
		cursor: pointer;
	}
	.image > img {
		height: 100px;
		width: 100px;
		object-fit: fill;
		box-shadow: 1px 1px 5px #0000006b;
	}
	.image {
		position: relative;
		height: min-content;
		margin: 15px;
		cursor: pointer;
	}

	.flexWrap{
		display: inline-flex;
		flex-wrap: wrap;
	}
	.x {
		background: red;
		border-radius: 3em;
		width: 10px;
		right: 15px;
		top: 15px;
		height: 10px;
		padding: 10px;
		position: absolute;
		color: white;
		font-weight: bold;
		display: flex;
		justify-content: center;
		align-items: center;
		cursor: pointer;
	}
</style>

<script>
	function selectImage(imageDiv) {
		debugger
		$(".box[name='" + selectedBox + "'] img").attr("src", imageDiv.find("img").attr("src"));
		$(".box[name='" + selectedBox + "'] img").attr("value", imageDiv.find("img")cd 	.attr("value"));
		$(".box[name='" + selectedBox + "']").addClass("boxWithImage");
		$(".x").click();
	}
</script>

<h2 style="padding-left: 30px">Selecione uma imagem:</h2>
<span class="x" onclick="$('.modal').hide()">X</span>
<div class="selectImage">
	<div class="scrollableContent flexWrap">
		<c:if test="${imagesResponse != null && imagesResponse.length() > 0}">
			<c:forEach begin="0" end="${imagesResponse.length() -1}" var="index">
				<div class="image" onclick="selectImage($(this))">
					<img src="${imagesResponse.get(index).get("base64")}" value="${imagesResponse.get(index).get("id")}"/>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>