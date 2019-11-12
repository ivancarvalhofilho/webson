<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.administratorContainter {
		border: 1px solid;
		height: 100%;
		position: relative;
		overflow-y: auto;
		width: 80%;
		margin: 0px 10%;
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
		object-fit: cover;
		box-shadow: 1px 1px 5px #0000006b;
	}
	.image {
		position: relative;
		height: min-content;
		margin: 15px;
	}
	
	.flexWrap{
		display: inline-flex;
		flex-wrap: wrap;
	}
</style>

<script>
	
	function deleteImage(id) {
		$.post(METHODS.deleteImage, {id: id});
	}
	
	function showContainerAddImage(){
		changeContainer(CONTAINERS.addImage);		
	}
	
</script>

<div class="administratorContainter">
	<addButton onclick="showContainerAddImage()"/>

	<div class="scrollableContent flexWrap">
		<c:forEach begin="0" end="${imagesResponse.length() -1}" var="index">
			<div class="image">
				<span onclick="deleteImage('${imagesResponse.get(index).get("id")}'); $(this).parent().remove()"/>
				<img src="${imagesResponse.get(index).get("url")}"/>
			</div>
		</c:forEach>
	</div>
</div>