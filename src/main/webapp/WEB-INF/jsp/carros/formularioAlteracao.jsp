<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>

<style type="text/css">
.container img {
	max-width: 250px;
	max-height: 170px;
	width: auto;
	height: auto;
}
</style>

<div class="alert alert-secondary" role="alert">${tipoForm}</div>

<div class="container" align="center">
	<img src="<c:url value='${carro.url}'/>" alt="..."
		class="img-thumbnail">
</div>

<form action="${linkTo[CarrosController].saveOrUpdate(null) }"
	onsubmit="this.enviar.value='Enviando...'; this.enviar.disabled=true;"
	method="POST" enctype="multipart/form-data">
	<fieldset>
		<input type="hidden" name="carro.id" value="${carro.id}" id="id">
		<input type="hidden" name="carro.modelo.id"
			value="${carro.modelo.getId()}" id="id"> <input type="hidden"
			name="carro.modelo.marca.id" value="${carro.modelo.marca.getId()}"
			id="id">
		<div class="form-group">
			<div class="   col-md-6 offset-md-3">
				<label for="marca">Marca</label> <input type="text" name="carro.marca"
					id="marca" class="form-control" placeholder="A MARCA DO CARRO"
					value="${carro.modelo.marca.getNome()}" required disabled>
			</div>
		</div>
		<div class="form-group">
			<div class="   col-md-6 offset-md-3">
				<label for="modelo">Modelo</label> <input type="text" name="carro.modelo"
					id="modelo" class="form-control" placeholder="O ANO DO CARRO"
					maxlength="4" value="${carro.modelo.getNome()}" required disabled>
			</div>
		</div>

		<div class="form-group">
			<div class="   col-md-6 offset-md-3">
				<label for="ano">Ano</label> <input type="text" name="carro.ano"
					id="ano" class="form-control" placeholder="O ANO DO CARRO"
					maxlength="4" value="${carro.ano}" required>
			</div>
		</div>
		<div class="form-group">
			<div class="   col-md-6 offset-md-3">
				<label for="placa">Placa</label> <input type="text"
					name="carro.placa" id="placa" class="form-control"
					placeholder="PLACA DO CARRO" maxlength="8" value="${carro.placa}"
					required onkeyup="this.value = this.value.toUpperCase();">
			</div>
		</div>
		<div class="form-group">
			<div class="   col-md-6 offset-md-3">
				<label for="cor">Cor</label> <input type="text" name="carro.cor"
					id="placa" class="form-control" placeholder="COR DO CARRO"
					maxlength="20" value="${carro.cor}" required
					onkeyup="this.value = this.value.toUpperCase();">
			</div>
		</div>
		<div class="form-group">
			<div class="   col-md-6 offset-md-3">
				<label for="marcas">Alterar Imagem</label>
				<div class="custom-file">
					<input name="uploadedFile" type="file">
				</div>


			</div>
		</div>
		<div class="col-md-6 offset-md-3">
			<button type="submit" class="btn btn-primary" name="enviar">Salvar</button>
			<a href="/projetoCrud/carros/cadastrados"><button type="button"
					class="btn btn-primary">Voltar</button></a>
		</div>
	</fieldset>

</form>


<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>