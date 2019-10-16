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
	}
	.homeContainer > div > div {
		position: relative;
		cursor: pointer;
	}
	.homeContainer > div > div > img{
		border-radius: 2em;
		width: 300px;
		height: 200px;
		object-fit: cover;
	}
	.homeContainer > div > div > span{
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		border-top-left-radius: 1em;
		border-top-right-radius: 1em;
		height: 30%;
		font-size: 26px;
		color: white;
		font-weight: bold;
		background: linear-gradient(#000000fa,#0000);
		padding: 20px;
		box-sizing: border-box;
	}
</style>

<div class="homeContainer">
	<div>
		<div onclick="changeContainer.call(this, CONTAINERS.tests)">
			<span>Pesquisas</span>
			<img src="https://upload.wikimedia.org/wikipedia/commons/f/f1/Atkinson_Rowan.jpg">
		</div>
		<div onclick="changeContainer.call(this, CONTAINERS.administrator)">
			<span>Imagens</span>
			<img src="https://bostonhassle.com/wp-content/uploads/2018/08/conair2.jpg">
		</div>
	</div>
</div>