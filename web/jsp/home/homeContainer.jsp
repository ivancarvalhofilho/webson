<style>
	.homeContainer {
		display: flex;
		justify-content: space-around;
		align-items: center;
		height: 100%;
		width: 100%;
	}
	.homeContainer > div {
		display: flex;
		justify-content: space-around;
		align-items: center;
		width: 80%;
		flex-direction: row-reverse;
	}
	.homeContainer > div > div {
		position: relative;
		cursor: pointer;
		border: 1px solid;
		border-radius: 2em;
		border-top: none;
		border-top-left-radius: 0;
		border-top-right-radius: 0;
		padding: 30px;
	}
	.homeContainer > div > div > img{
		border-radius: 2em;
		width: 250px;
		height: 150px;
		object-fit: scale-down;
	}
	.homeContainer > div > div > span{
		position: absolute;
		width: 100%;
		left: 0;
		border-top-left-radius: 1em;
		border-top-right-radius: 1em;
		height: 25%;
		font-size: 26px;
		color: white;
		font-weight: bold;
		background: linear-gradient(#000000fa,#0000);
		padding: 20px;
		box-sizing: border-box;
		top: -25px;
	}
</style>

<div class="homeContainer">
	<div>
		<div onclick="changeContainer.call(this, CONTAINERS.tests)">
			<span>Pesquisas</span>
			<img src="./../../icons/researches.png">
		</div>
		<div onclick="changeContainer.call(this, CONTAINERS.administrator)">
			<span>Imagens</span>
			<img src="./../../icons/images.png">
		</div>
	</div>
</div>